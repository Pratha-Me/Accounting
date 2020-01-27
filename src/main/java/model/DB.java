/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author pratha
 */
public class DB {
	private String msg;

	public int save(String sql){
		Session session = HibernateUtil.getSession();
		Transaction tr = session.beginTransaction();
		int a = 0;
		try{
			a = session.createSQLQuery(sql).executeUpdate();
			tr.commit();
			session.close(); 
			setMsg("Success");
		} catch (Exception e) {
			setMsg(Message.exceptionMsg(e));
			tr.rollback();
		}

		try{ 
			session.close();
		} catch(Exception e){
		}
		
		return a;
	}

	public int delete(String sql){
		Session session = HibernateUtil.getSession();
		Transaction tr = session.beginTransaction();
		int a = 0;
		try{
			a = session.createSQLQuery(sql).executeUpdate();
			tr.commit();
			session.close();
			setMsg("Success");
		} 
		catch (Exception e){
			setMsg(Message.exceptionMsg(e));
			tr.rollback();
		}
		
		try{ 
			session.close();
		} catch(Exception e){
		}
		
		return a;
	}

	public List getRecord(String sql){
		Session session = HibernateUtil.getSession();
		try{
			List list = session.createSQLQuery(sql).setResultTransformer(org.hibernate.Criteria.ALIAS_TO_ENTITY_MAP).list();
			session.close();
			return list;
		} 
		catch(Exception e){
			session.close();
			setMsg(Message.exceptionMsg(e));
		}
		return null;
	}
	
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
}
