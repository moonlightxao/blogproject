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
import javax.servlet.http.HttpSession;
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
        /*获取session保存用户名以及用户id*/
        HttpSession session = request.getSession(true);

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
            session.setAttribute("user",user);
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
    public String logout(HttpServletRequest request){
        Blogger curUser = (Blogger) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        HttpSession session = request.getSession();
        if(curUser != null){
            if(session != null){
                session.removeAttribute("user");
            }
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
    public String createAccount(@RequestParam("imageLink") MultipartFile imageLink,String userName,String password,String realname,String  phone,String birthday,String nickname ,String sign,HttpServletRequest request) throws IOException, ParseException {
        if(imageLink.isEmpty()){
            //System.out.println("图像上传失败");
            return "createAccount";
        }
        String filePath = request.getServletContext().getRealPath("/");
        //System.out.println("filePath = "+filePath);
        String res = CurrentDateUtil.getCurrentDate()+"."+imageLink.getOriginalFilename().split("\\.")[1];
        //System.out.println("上传文件保存地址" + filePath+"userImageLink/"+res);
        imageLink.transferTo(new File(filePath+"userImageLink/"+res));
        //System.out.println(userName+"," + password+"," + realname+","+phone+","+birthday+","+nickname+","+sign+","+res);
        String pwd = CryptographyUtil.md5(password,"njust");
       // System.out.println("即将进入try语句块");
        try{
            Blogger blogger = new Blogger(userName,pwd,nickname,realname,phone,new SimpleDateFormat("yyyy-MM-dd").parse(birthday),sign,res);
            //System.out.println(blogger);
            boolean flag = bloggerService.addBlogger(blogger);
            if(flag == false){
                request.setAttribute("erroBuf","创建账号失败，请重新创建");
                return "createAccount";
            }
           // System.out.println("准备要重定向到login");
            return "redirect:/login.jsp";
        }catch(ParseException e){
            request.setAttribute("erroDate","日期输入不正确，请重新选择");
            return "toCreateAccount";
        }catch(Exception e){
            return "redirect:/toCreateAccount";
        }

    }

    @RequestMapping("/toChangePwd")
    public String toChangePwd(){
        return "redirect:/admin/changePwd.jsp";
    }


    /*处理修改账户之前验证账号信息的请求*/
    @RequestMapping("/verify")
    public String verifyInfo(String username,String realname,String phone,String birthday,HttpServletRequest request) throws ParseException {
        //System.out.println(username+"+" + realname+" + " + phone +" + " + birthday );
        Map<String,Object> map = bloggerService.verifyInfo(username,realname,phone,birthday);
        if((Boolean)map.get("flag") == false){
            request.setAttribute("errorBuf",map.get("errorBuf"));
            return "verifyAccount";
        }
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
    public String toManageAccount(HttpServletRequest request){
        Blogger user = (Blogger) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        if(user == null){
            return "login";
        }
        request.setAttribute("user",user);
        return "admin/manageAccount";
    }

    /*处理管理账号信息的请求*/
    @RequestMapping("/manageAccount")
    public String manageAccount(@RequestParam("imageLink") MultipartFile imageLink,String username,String nickname,String realname,String phone,String birthday,String sign,HttpServletRequest request) throws ParseException, IOException {
        Map<String,String> map = new HashMap<String, String>();
        Blogger cUser = (Blogger) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        Blogger user = bloggerService.getBloggerByName(username);
        if(imageLink.isEmpty()){
            return "admin/manageAccount";
        }
        String filePath = request.getServletContext().getRealPath("/");
        //System.out.println("filePath = "+filePath);
        String res = CurrentDateUtil.getCurrentDate()+"."+imageLink.getOriginalFilename().split("\\.")[1];
        //System.out.println("上传文件保存地址" + filePath+"userImageLink/"+res);
        imageLink.transferTo(new File(filePath+"userImageLink/"+res));
        map.put("sign",sign);
        map.put("image",res);
        map.put("username",username);
        map.put("nickname",nickname);
        map.put("password",cUser.getPassword());
        map.put("realname",realname);
        map.put("phone",phone);
        map.put("birthday",birthday);
        boolean flag = bloggerService.manageAccount(map);

        if(flag == false){
            return null;
        }
        return "redirect:/Homepage/toHomepage?usrId="+user.getUserId();
    }

    @RequestMapping("/checkUsername")
    public String checkUsername(String username,HttpServletResponse response) throws IOException {
        //System.out.println("right here");
        Blogger blogger = bloggerService.getBloggerByName(username);
        boolean isExit = (blogger != null) ? true : false;
        JSONObject jsonObject = new JSONObject();
        //System.out.println(username+" with " + isExit);
        jsonObject.put("isExit",isExit);
        ResponseWrite.writeJSON(response,jsonObject);
        return null;
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
