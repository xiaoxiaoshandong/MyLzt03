package com.lzt.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.ContextConfiguration;
import com.lzt.dao.CartMapper;
import com.lzt.entity.Cart;

@RunWith(value = SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath*:/applicationContext.xml"}) 
public class TestCartServiceImpl {
	private Cart cart ;
	@Autowired(required=false)
	private CartMapper cartMapper;
	public TestCartServiceImpl (){
		cart =  new Cart();
		cart.setCartId("155637125548960");
	}
	@Test
	public void selectByColumn(){
		System.out.println(cart.getCartId());
		Cart cart2 = cartMapper.selectByColumn(cart);
		System.out.println(cart2);
	}
}
