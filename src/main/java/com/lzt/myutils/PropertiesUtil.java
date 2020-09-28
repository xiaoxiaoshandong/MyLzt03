package com.lzt.myutils;
import java.io.InputStream;
import java.util.Properties;
/**
 * 读取配置文件工具类
 */
public class PropertiesUtil {
    private static Properties getProperties(String properties) {
        try {
            InputStream in = PropertiesUtil.class.getClassLoader().getResourceAsStream(properties);
            Properties p = new Properties();
            p.load(in);
            return p;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    public static String getValue(String properties,String key){
        Properties p = getProperties(properties);
        return p.getProperty(key);
    }
}
