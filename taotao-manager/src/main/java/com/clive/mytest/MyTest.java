package com.clive.mytest;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.clive.bean.TbItem;
import com.clive.service.TbItemService;

public class MyTest {
	@Test
	public void show1() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		TbItemService tbItemService = (TbItemService) ac.getBean("tbItemServiceImpl");
		List<TbItem> tbItemAll = tbItemService.findTbItemAll();
		for (TbItem tbItem : tbItemAll) {
			System.out.println(tbItem);
		}
	}
}
