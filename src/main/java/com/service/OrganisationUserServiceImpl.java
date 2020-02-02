/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.dao.OrganisationUserDao;
import com.model.OrganisationUserModel;
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
public class OrganisationUserServiceImpl implements OrganisationUserService{
	
	@Autowired
	OrganisationUserDao dao;

	Message msg = new Message();

	@Override
	public Object getRecord() {
		List list = dao.getRecord("from OrganisationUserModelO");
		if (!list.isEmpty()) {
			return list;
		}
		return msg.respondWithError(dao.getMsg());
	}

	@Override
	public Object doSave(OrganisationUserModel obj) {
/*		
		Token td = new Token();
		obj.setEnterBy(td.getUserID());
		obj.setEnterDate(new Date());
*/
		String sql = "SELECT IFNULL(MAX(ID), 0) + 1 AS id FROM organisation_user";
		msg.map = (Map) msg.db.getRecord(sql).get(0);
		obj.setId(Long.parseLong(msg.map.get("id").toString()));
		int count = dao.save(obj);
		if (count == 1) {
			return msg.respondWithMessage("Successfully Saved");
		}
		return msg.respondWithError(dao.getMsg());
	}

	@Override
	public Object doUpdate(OrganisationUserModel obj, long id) {
		obj.setId(id);
		int count = dao.update(obj);
		if (count == 1) {
			return msg.respondWithMessage("Success");
		}
		return msg.respondWithError(dao.getMsg());
	}

	@Override
	public Object doDelete(long id) {
		String sql = "DELETE FROM organisation_user WHERE ID=" + id;
		int count = msg.db.delete(sql); 
		if (count == 1) {
			return msg.respondWithMessage("Success");
		}
		return msg.respondWithError(dao.getMsg());
	}
}
