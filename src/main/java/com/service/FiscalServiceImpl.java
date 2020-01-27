/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.dao.FiscalDao;
import com.model.FiscalModel;
import java.util.List;
import java.util.Map;
import model.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author pratha
 */
@Service
public class FiscalServiceImpl implements FiscalService{

	@Autowired
	FiscalDao dao;

	Message msg = new Message();
	
	@Override
	public Object getRecord() {
		List list = dao.getRecord("from FiscalModel");
		if(!list.isEmpty()) return list;
		return msg.respondWithError(dao.getMsg());
	}

	@Override
	public Object doSave(FiscalModel obj) {
		String sql = "SELECT IFNULL(MAX(ID), 0)+ 1 AS id FROM fiscal_year";
		msg.map = (Map) msg.db.getRecord(sql).get(0);
		obj.setId(Long.parseLong(msg.map.get("id").toString()));
		int count = dao.save(obj);
		if (count == 1) {
			return msg.respondWithMessage("Successfully Saved");
		}
		return msg.respondWithError(dao.getMsg());
	}

	@Override
	public Object doUpdate(FiscalModel obj, long id) {
		obj.setId(id);
		int count = dao.update(obj);
		if (count == 1) {
			return msg.respondWithMessage("Successfully Saved");
		}
		return msg.respondWithError(dao.getMsg());
	}

	@Override
	public Object doDelete(long id) {
		String sql = "DELETE FROM dummy WHERE ID=" + id;
		int count = msg.db.delete(sql); 
		if (count == 1) {
			return msg.respondWithMessage("Success");
		}
		return msg.respondWithError(dao.getMsg());
	}
}
