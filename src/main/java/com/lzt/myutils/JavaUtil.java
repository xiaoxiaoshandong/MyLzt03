package com.lzt.myutils;

import java.util.*;

public class JavaUtil {

    // list去重
    public static List<String> listDelRepeat(List<String> list) {
        List<String> listNew = new ArrayList<String>(new TreeSet<String>(list));
        return listNew;
    }
}
