package com.lzt.myutils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 类型转换
 */
public class TypeChange {

    private static Pattern linePattern = Pattern.compile("_(\\w)");

    /**
     * @param str 参数类型为：a_b_c 或 A_B_C
     * @Description 下划线转驼峰格式
     */
    public static String lineToHump(String str) {
        str = str.toLowerCase();
        Matcher matcher = linePattern.matcher(str);
        StringBuffer sb = new StringBuffer();
        while (matcher.find()) {
            matcher.appendReplacement(sb, matcher.group(1).toUpperCase());
        }
        matcher.appendTail(sb);
        return sb.toString();
    }

    /**
     * @param str 参数类型为：a_b_c 或 A_B_C
     * @Description  首字符为大写的驼峰
     */
    public static String InitialsLineToHump(String str) {
        String lineToHump = lineToHump(str);
        char[] chars = lineToHump.toCharArray();
        if (chars[0] >= 'a' && chars[0] <= 'z') {
            chars[0] = (char) (chars[0] - 32);
        }
        String s = String.valueOf(chars);
        return s;
    }

    /**
     *
     * @param str  随意
     * @Description 首字母表小写
     */
    public static String lowerFirstCase(String str){
        char[] chars = str.toCharArray();

        //首字母小写方法，大写会变成小写，如果小写首字母会消失
        chars[0] +=32;
        return String.valueOf(chars);

    }
}
