package com.lzt.myutils;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class UpdateFile {
	
	/**
	 * 上传图片
	 * @return null:上传图片失败 
	 */
	public static List<String> uploadFile(List<MultipartFile> list, HttpServletRequest request){
		List<String> fileList = new ArrayList<String>();
		if(list.size()==0){
			return null;
		}
		for(MultipartFile file:list){
	        File targetFile=null;
	        String msg="";//返回存储路径
			//获取文件名加后缀
			String fileName = file.getOriginalFilename();
			if(fileName!=null&&fileName!=""){ 
				 String returnUrl = request.getScheme() + "://" + request.getServerName() + ":" 
				 + request.getServerPort() + request.getContextPath() +"/upload/imgs/";//存储路径
				 String path = request.getSession().getServletContext().getRealPath("upload/imgs"); //文件存储位置
				 String fileF = fileName.substring(fileName.lastIndexOf("."), fileName.length());//文件后缀
				 fileName=new Date().getTime()+"_"+new Random().nextInt(1000)+fileF;//新的文件名
				//先判断文件是否存在
		            String fileAdd = DateUtil.format("yyyyMMdd");
		            File file1 =new File(path+"/"+fileAdd); 
		            //如果文件夹不存在则创建    
		            if(!file1.exists()  && !file1.isDirectory()){       
		                boolean mkdir = file1.mkdirs();
		            }
		            targetFile = new File(file1, fileName);
//		          targetFile = new File(path, fileName);
		            try {
		                file.transferTo(targetFile);
//		             	 msg=returnUrl+fileName;
		                msg=returnUrl+fileAdd+"/"+fileName;
		            } catch (Exception e) {
		                e.printStackTrace();
		            }
		            fileList.add(msg);
		        }
			}
		return fileList;
	}
}
