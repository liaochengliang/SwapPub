package com.service;
import java.util.ArrayList;

import com.dao.GoodsDao;
import com.entity.Goods;

public class GoodsService {
	//��Ʒ��ӹ���
	public static boolean GoodsSave(Goods goods){
		GoodsDao goodsDao = new GoodsDao();
		return goodsDao.addGoods(goods);
	}
	//��ȡ������Ʒ
	public static ArrayList GoodsShow(){
		GoodsDao goodsDao = new GoodsDao();
		return goodsDao.selectAllGoods();
	}
	//��ȡ��ǰ��Ʒ
	public static Goods GoodsShow(int id){
		GoodsDao goodsDao = new GoodsDao();
		return goodsDao.selectGoods(id);
	}	
}
