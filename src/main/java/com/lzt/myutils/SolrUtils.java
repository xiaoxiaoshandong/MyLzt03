package com.lzt.myutils;

import java.io.IOException;
import java.util.List;

import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.common.SolrInputDocument;

import com.lzt.entity.Sku;

public class SolrUtils {
	// 指定solr服务器的地址
	/*private final static String SOLR_URL = "http://localhost:8081/solr/collection1";
		
		// 创建一个客户端
		public HttpSolrClient createSolrServer() {
			HttpSolrClient solr = null;
			solr = new HttpSolrClient.Builder(SOLR_URL).withConnectionTimeout(10000).withSocketTimeout(60000).build();
			return solr;
		}
		
		// 添加文档
		public static void addDoc(List<Sku> skuList) throws SolrServerException, IOException {
			
			// 获得一个solr服务端的请求，去提交 ,选择具体的某一个solr core
			HttpSolrClient solr = new HttpSolrClient.Builder(SOLR_URL).withConnectionTimeout(10000)
			.withSocketTimeout(60000).build();
			for(Sku sku : skuList){
				// 构造一篇文档
				SolrInputDocument document = new SolrInputDocument();
				// 往doc中添加字段,在客户端这边添加的字段必须在服务端中有过定义
				document.addField("id", sku.getSkuId());
				document.addField("sku_name", sku.getSkuName());
				document.addField("jiage",sku.getJiage());
				solr.add(document);
			}
			
			solr.commit();
			solr.close();
		}*/

}
