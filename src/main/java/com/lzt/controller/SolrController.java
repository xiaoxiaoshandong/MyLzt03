package com.lzt.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lzt.service.CartService;
import com.lzt.service.MySolrService;

@RestController  
@RequestMapping("/solr") 
public class SolrController {
		
	@Autowired(required=false)
	private MySolrService mySolrService;
	
	private static Logger log=LoggerFactory.getLogger(SolrController.class);
	
	@RequestMapping(value="/add")  
	public Integer addSolr(){
		
		Integer i = null;
		try {
			i = mySolrService.addSolr();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
			
			
}
