package com.lzt.entity;
import java.util.Date; 
/** 
 * @ClassName PigZhuLan 
 * @author li_zhentao 
 * @jdkVersion jdk1.7 
 * @version 
 * @Date 2020-09-28 21:10:18 
 * @Description 
 */ 
public class PigZhuLan { 
 
   /**  
   *  猪栏ID  
   *  表字段：pig_zhu_lan.zl_id  
   */  
   private String zlId ; 
 
   /**  
   *  猪舍ID  
   *  表字段：pig_zhu_lan.zs_id  
   */  
   private String zsId ; 
 
   /**  
   *  猪栏名称  
   *  表字段：pig_zhu_lan.zl_name  
   */  
   private String zlName ; 
 
   /**  
   *  猪栏类型 （1：空栏 2：妊娠栏 3：肥猪栏 4：后备栏 5：仔猪栏 6：配种公猪栏）  
   *  表字段：pig_zhu_lan.zl_type  
   */  
   private Integer zlType ; 
 
   /**  
   *  猪栏中猪的个数  
   *  表字段：pig_zhu_lan.pig_num  
   */  
   private Integer pigNum ; 
 
   /**  
   *  创建时间  
   *  表字段：pig_zhu_lan.create_time  
   */  
   private Date createTime ; 
 
   /**  
   *  更新时间  
   *  表字段：pig_zhu_lan.update_time  
   */  
   private Date updateTime ; 

   public String getZlId() {   return zlId;   } 

   public void setZlId(String zlId) {   this.zlId = zlId == null ? null : zlId.trim();   } 

   public String getZsId() {   return zsId;   } 

   public void setZsId(String zsId) {   this.zsId = zsId == null ? null : zsId.trim();   } 

   public String getZlName() {   return zlName;   } 

   public void setZlName(String zlName) {   this.zlName = zlName == null ? null : zlName.trim();   } 

   public Integer getZlType() {   return zlType;   } 

   public void setZlType(Integer zlType) {   this.zlType = zlType;   } 

   public Integer getPigNum() {   return pigNum;   } 

   public void setPigNum(Integer pigNum) {   this.pigNum = pigNum;   } 

   public Date getCreateTime() {   return createTime;   } 

   public void setCreateTime(Date createTime) {   this.createTime = createTime;   } 

   public Date getUpdateTime() {   return updateTime;   } 

   public void setUpdateTime(Date updateTime) {   this.updateTime = updateTime;   } 

}