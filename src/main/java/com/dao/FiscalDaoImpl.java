/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.FiscalModel;
import java.util.List;
import model.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;

/**
 *
 * @author pratha
 */

@Component
public class FiscalDaoImpl implements FiscalDao {

	String msg = "";

	@Override
	public String getMsg() {
		return msg;
	}

	@Override
	public List getRecord(String hql) {
		Session session = HibernateUtil.getSession();
		try {
			List list = session.createQuery(hql).list();
			session.close();
			return list;
		} catch (Exception e) {
			msg = model.Message.exceptionMsg(e);
		}
		return null;
	}

	@Override
	public int save(FiscalModel obj) {
		Session session = HibernateUtil.getSession();
		Transaction tr = session.beginTransaction();
		try {
			session.save(obj);
			tr.commit();
			session.close();
			msg = "Successfully Saved";
			return 1;
		} catch (Exception e) {
			tr.rollback();
			msg = model.Message.exceptionMsg(e);
		}
		return 0;
	}

	@Override
	public int update(FiscalModel obj) {
		Session session = HibernateUtil.getSession();
		Transaction tr = session.beginTransaction();
		try {
			session.update(obj);
			tr.commit();
			session.close();
			msg = "Successfully updated";
			return 1;
		} catch (Exception e) {
			tr.rollback();
			msg = model.Message.exceptionMsg(e);
		}
		return 0;
	}

	@Override
	public int delete(String hql) {
		Session session = HibernateUtil.getSession();
		int count;
		try {
			count = session.createSQLQuery(hql).executeUpdate();
			session.close();
		} catch (Exception e) {
			msg = model.Message.exceptionMsg(e);
			count = 0;
		}
		return count;
	}

}
