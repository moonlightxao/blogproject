package com.blog.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTransferUtil {
    /*
    * 将默认的Date表示格式转换成中文用户更喜欢的格式（xxxx年xx月xx日xx时:xx分:xx秒）
    * */
    public static String transferTime(Date time){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy MM dd HH:mm:ss");
        String tmp = simpleDateFormat.format(time);
        String[] parts = tmp.split(" ");
        String res = parts[0] + "年" + parts[1] + "月" + parts[2] + "日" + parts[3];
        return res;
    }

    public static void main(String[] args) {
        System.out.println(DateTransferUtil.transferTime(new Date()));
    }
}
