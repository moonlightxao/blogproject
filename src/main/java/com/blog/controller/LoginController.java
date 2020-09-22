package com.blog.controller;

import com.blog.entity.Blog;
import com.blog.entity.Blogger;
import com.blog.service.BloggerService;
import com.blog.utils.CryptographyUtil;
import com.blog.utils.CurrentDateUtil;
import com.blog.utils.ResponseWrite;
import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {
    @Autowired
    private BloggerService bloggerService;

    /*转发进入到登录页面的请求*/
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    /*处理登录请求*/
    @RequestMapping("/login")
    public String login(Blogger blogger, String remember, HttpServletRequest request , RedirectAttributes redirectAttributes) throws IOException {
        String userName = blogger.getUsername();
        String password = blogger.getPassword();

        /*对密码进行转化*/
        String pwd = CryptographyUtil.md5(password,"njust");

        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(userName,pwd);
        if("on".equals(remember)){
            token.setRememberMe(true);
        }
        try{
            subject.login(token);
            Blogger user = bloggerService.getBloggerByName(blogger.getUsername());
            return "redirect:/Homepage/toHomepage?usrId="+user.getUserId();
        }catch(UnknownAccountException e){
            redirectAttributes.addFlashAttribute("message","用户名错误！");
        }catch(IncorrectCredentialsException e){
            redirectAttributes.addFlashAttribute("message","密码错误！");
        }catch(Exception e){
            redirectAttributes.addFlashAttribute("message","未知错误，联系管理员");
        }
        return "redirect:/againLogin";
    }

    @RequestMapping("/againLogin")
    public  String againLogin(){
        return "login";
    }

    /*实现退出登录的操作*/
    @RequestMapping("/logout")
    public String logout(){
        Blogger curUser = (Blogger) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        if(curUser != null){
            SecurityUtils.getSubject().logout();
        }
        return "login";
    }



    /*将请求转发到创建账号页面*/
    @RequestMapping("/toCreateAccount")
    public String toCreateAccount(){
        return "createAccount";
    }

    /*处理创建账号请求，如果创建成功，则返回登录界面登录，创建失败则输出错误信息，让用户重新创建
    * 这里假设前端已经使用ajax去判断用户名是否重复，故直接创建
    * */
    @RequestMapping("/createAccount")
    public String createAccount(@RequestParam("imageLink") MultipartFile imageLink,String username,String password,String realName,String  phone,String day,String nickname ,String sign,HttpServletRequest request) throws ParseException, IOException {
        if(imageLink.isEmpty()){
            return "createAccount";
        }
        String filePath = request.getServletContext().getRealPath("/");
        System.out.println("filePath = "+filePath);
        String res = CurrentDateUtil.getCurrentDate()+"."+imageLink.getOriginalFilename().split("\\.")[1];
        System.out.println("上传文件保存地址" + filePath+"userImageLink/"+res);
        imageLink.transferTo(new File(filePath+"userImageLink/"+res));
        System.out.println(username+"," + password+"," + realName+","+phone+","+day+","+nickname+","+sign+","+res);
        String pwd = CryptographyUtil.md5(password,"njust");
        Blogger blogger = new Blogger(username,pwd,nickname,realName,phone,new SimpleDateFormat("yyyy-MM-dd").parse(day),sign,res);
        System.out.println(blogger);

        boolean flag = bloggerService.addBlogger(blogger);
        if(flag == false){
            request.setAttribute("erroBuf","创建账号失败，请重新创建");
            return "createAccount";
        }
        return "redirect:/login.jsp";
    }

    @RequestMapping("/toChangePwd")
    public String toChangePwd(){
        return "redirect:/admin/changePwd.jsp";
    }


    /*处理修改账户之前验证账号信息的请求*/
    @RequestMapping("/verify")
    public String verifyInfo(String username,String realname,String phone,String birthday,HttpServletRequest request) throws ParseException {
        System.out.println(username+"+" + realname+" + " + phone +" + " + birthday );
        Date day = new SimpleDateFormat("yyyy-MM-dd").parse(birthday);
        Blogger blogger = bloggerService.getBloggerByName(username);
        if(blogger.getRealName().equals(realname) == false){
            request.setAttribute("erro","真实姓名不正确，请重新输入！");
            return "verifyAccount";
        }
        if(blogger.getPhone().equals(phone) == false){
            request.setAttribute("erro","电话号码不正确，请重新输入！");
            return "verifyAccount";
        }
        if(blogger.getBirthday().equals(day) == false){
            request.setAttribute("erro","生日日期不正确，请重新输入！");
            return "verifyAccount";
        }
        request.setAttribute("userName",username);
        return "admin/changePwd";
    }

    /*处理在登录时忘记密码要修改账号信息的请求*/
    @RequestMapping("/changePwd")
    public String changePwd(Blogger blogger){
        Blogger res = bloggerService.getBloggerByName(blogger.getUsername());
        String pwd = CryptographyUtil.md5(blogger.getPassword(),"njust");
        res.setPassword(pwd);
        boolean flag = bloggerService.updateBlogger(res);
        if(flag == false){
            return "admin/changePwd";
        }
        return "redirect:/login.jsp";
    }

    /*处理从个人主页面到管理账号页面的请求*/
    @RequestMapping("/toManageAccount")
    public String toManageAccount(String usrId,HttpServletRequest request){
        Blogger user = bloggerService.findBloggerById(Integer.valueOf(usrId));
        if(user == null){
            return "login";
        }
        request.setAttribute("userName",user.getUsername());
        return "admin/manageAccount";
    }

    /*处理管理账号信息的请求*/
    @RequestMapping("/manageAccount")
    public String manageAccount(@RequestParam("imageLink") MultipartFile imageLink,String username,String nickname,String password,String realname,String phone,String birthday,String sign,HttpServletRequest request) throws ParseException, IOException {
        Map<String,String> map = new HashMap<String, String>();
        Blogger user = bloggerService.getBloggerByName(username);
        if(imageLink.isEmpty()){
            return "admin/manageAccount";
        }
        String filePath = request.getServletContext().getRealPath("/");
        System.out.println("filePath = "+filePath);
        String res = CurrentDateUtil.getCurrentDate()+"."+imageLink.getOriginalFilename().split("\\.")[1];
        //System.out.println("上传文件保存地址" + filePath+"userImageLink/"+res);
        imageLink.transferTo(new File(filePath+"userImageLink/"+res));
        map.put("sign",sign);
        map.put("image",res);
        map.put("username",username);
        map.put("nickname",nickname);
        map.put("password",CryptographyUtil.md5(password,"njust"));
        map.put("realname",realname);
        map.put("phone",phone);
        map.put("birthday",birthday);
        boolean flag = bloggerService.manageAccount(map);

        if(flag == false){
            return null;
        }
        return "redirect:/Homepage/toHomepage?usrId="+user.getUserId();
    }




    @RequestMapping("/")
    public String toIndex(String page){
        //System.out.println(page);
        String red = "redirect:/Blog/index?page=";
        if(page == null){
            red = red + "1";
            return red;
        }
        red = red + page;
        System.out.println(red);
        return red;
    }
}
