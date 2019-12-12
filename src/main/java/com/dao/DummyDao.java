/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.DummyModel;
import java.util.List;

/**
 *
 * @author pratha
 */
public interface DummyDao {

	public String getMsg();

	public List getRecord(String hql);

	public int save(DummyModel obj);

	public int update(DummyModel obj);

	public int delete(String hql);
}
