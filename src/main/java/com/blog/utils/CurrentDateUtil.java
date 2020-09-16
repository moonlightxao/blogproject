package com.blog.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CurrentDateUtil {
    public static String getCurrentDate(){
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddmmss");
        return simpleDateFormat.format(date);
    }
}
