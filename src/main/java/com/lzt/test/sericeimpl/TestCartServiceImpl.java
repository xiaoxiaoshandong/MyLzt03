package com.lzt.test.sericeimpl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.test.context.ContextConfiguration;
import com.lzt.dao.CartMapper;
import com.lzt.dao.CartProdMapper;
import com.lzt.entity.Cart;
import com.lzt.entity.CartProd;
import com.lzt.myutils.MyId;

@RunWith(value = SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath*:/applicationContext.xml"}) 
public class TestCartServiceImpl {
	private Cart cart ;
	@Autowired(required=false)
	private CartMapper cartMapper;
	@Autowired(required=false)
	private CartProdMapper cartProdMapper;
	public TestCartServiceImpl (){
		cart =  new Cart();
		cart.setCartId("155637125548960");
	}
	@Test
	@Transactional(propagation = Propagation.REQUIRED)
	public void selectByColumn(){
		Cart cart3 = new Cart();
		cart3.setUserId("1");
		cart3.setAddressId("2");
		cartMapper.insertSelective(cart3);
		selectByColumn2();
	}
	
	@Test
	@Transactional(propagation = Propagation.REQUIRED)
	public void selectByColumn2(){
		CartProd cartProd = new CartProd();
		cartProd.setCpId(MyId.getMyId());
		cartProd.setCartId(MyId.getMyId());
		cartProd.setNum(99);
		cartProdMapper.insertSelective(cartProd);
	}
}
