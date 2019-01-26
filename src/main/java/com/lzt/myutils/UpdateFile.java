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
	 * �ϴ�ͼƬ
	 * @return null:�ϴ�ͼƬʧ�� 
	 */
	public static List<String> uploadFile(List<MultipartFile> list, HttpServletRequest request){
		List<String> fileList = new ArrayList<String>();
		if(list.size()==0){
			return null;
		}
		for(MultipartFile file:list){
	        File targetFile=null;
	        String msg="";//���ش洢·��
			//��ȡ�ļ����Ӻ�׺
			String fileName = file.getOriginalFilename();
			if(fileName!=null&&fileName!=""){ 
				 String returnUrl = request.getScheme() + "://" + request.getServerName() + ":" 
				 + request.getServerPort() + request.getContextPath() +"/upload/imgs/";//�洢·��
				 String path = request.getSession().getServletContext().getRealPath("upload/imgs"); //�ļ��洢λ��
				 String fileF = fileName.substring(fileName.lastIndexOf("."), fileName.length());//�ļ���׺
				 fileName=new Date().getTime()+"_"+new Random().nextInt(1000)+fileF;//�µ��ļ���
				//���ж��ļ��Ƿ����
		            String fileAdd = DateUtil.format("yyyyMMdd");
		            File file1 =new File(path+"/"+fileAdd); 
		            //����ļ��в������򴴽�    
		            if(!file1.exists()  && !file1.isDirectory()){       
		                boolean mkdir = file1.mkdirs();
		            }
		            targetFile = new File(file1, fileName);
//		          targetFile = new File(path, fileName);
		            try {
		                file.transferTo(targetFile);
//		             	 msg=returnUrl+fileName;
		                msg=returnUrl+fileAdd+"/"+fileName;
		                System.out.println("msg:"+msg);
		            } catch (Exception e) {
		                e.printStackTrace();
		            }
		            fileList.add(msg);
		        }
			}
		return fileList;
	}
}
