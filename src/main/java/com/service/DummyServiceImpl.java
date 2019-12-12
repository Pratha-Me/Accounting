/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.dao.DummyDao;
import com.model.DummyModel;
import java.util.List;
import java.util.Date;
import java.util.Map;
import model.Message;
import model.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author pratha
 */

@Service
public class DummyServiceImpl implements DummyService {

	@Autowired
	DummyDao dao;

	Message msg = new Message();

	@Override
	public Object getRecord() {
		List list = dao.getRecord("from DummyModel");
		if (!list.isEmpty()) {
			return list;
		}
		return msg.respondWithError(dao.getMsg());
	}

	@Override
	public Object doSave(DummyModel obj) {
		Token td = new Token();
		obj.setEnterBy(td.getUserID());
		obj.setEnterDate(new Date());
		String sql = "SELECT IFNULL(MAX(ID), 0) + 1 AS id FROM dummy";
		msg.map = (Map) msg.db.getRecord(sql).get(0);
		obj.setId(Long.parseLong(msg.map.get("id").toString()));
		int count = dao.save(obj);
		if (count == 1) {
			return msg.respondWithMessage("Successfully Saved");
		}
		return msg.respondWithError("Save Failed");
	}

	@Override
	public Object doUpdate(DummyModel obj, Long id) {
		obj.setId(id);
		int count = dao.update(obj);
		if (count == 1) {
			return msg.respondWithMessage("Success");
		}
		return msg.respondWithError(dao.getMsg());
	}

	@Override
	public Object doDelete(Long id) {
		String sql = "DELETE FROM DummyModel WHERE ID=" + id;
		int count = msg.db.save(sql);
		if (count == 1) {
			return msg.respondWithMessage("Success");
		}
		return msg.respondWithError(dao.getMsg());
	}

}
