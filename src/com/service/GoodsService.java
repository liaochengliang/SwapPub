package com.service;
import java.util.ArrayList;

import com.dao.GoodsDao;
import com.entity.Goods;

public class GoodsService {
	//商品添加功能
	public static boolean GoodsSave(Goods goods){
		GoodsDao goodsDao = new GoodsDao();
		return goodsDao.addGoods(goods);
	}
	//获取所有商品
	public static ArrayList GoodsShow(){
		GoodsDao goodsDao = new GoodsDao();
		return goodsDao.selectAllGoods();
	}
	//获取当前商品
	public static Goods GoodsShow(int id){
		GoodsDao goodsDao = new GoodsDao();
		return goodsDao.selectGoods(id);
	}	
}
