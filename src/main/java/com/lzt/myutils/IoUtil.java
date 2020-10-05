package com.lzt.myutils;

import java.io.*;

/**
 * IO相关的工具类
 */
public class IoUtil {

    /**
     *
     * @param content 内容
     * @param packagePath 路径
     * @param tableName 表名称
     * @param fileType 文件类型 例如：java , xml
     */
    public static void wirteToFile(String content,String packagePath,String tableName,String fileType){
        PrintWriter pw = null;
        BufferedWriter bw = null;
        //根据空文件获取项目路径
        File dir = new File("");
        //entity文件父文件夹全路径
//        String dirpath = dir.getAbsolutePath() + "\\src\\"+packagePath.replace(".", "\\");
        File parentDir = new File(packagePath);
        //判断是否存在该路径
        if (!parentDir.exists()) {
            //不存在则创建
            parentDir.mkdirs();
        }
        String filePath = packagePath+"\\"+tableName+"."+fileType;    //java文件路径
        File file = new File(filePath);
        try {
            //判断是否存在java文件
            if (!file.exists()) {
                //不存在则创建
                file.createNewFile();
            }else {
                System.out.print("表     "+tableName+"   的entity实体已存在于:");
            }
            pw = new PrintWriter(new OutputStreamWriter(new FileOutputStream(filePath), "utf-8"));    //OutputStreamWriter为了解决乱码
            bw = new BufferedWriter(pw);
            bw.write(content);
        } catch (IOException e) {
            e.printStackTrace();
        } finally{
            try {
                if (bw!=null) {
                    bw.close();
                }
                if (pw!=null) {
                    pw.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        System.out.println(filePath);
    }
}
