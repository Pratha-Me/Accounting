/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.OrganisationMasterModel;
import java.util.List;

/**
 *
 * @author pratha
 */
public interface OrganisationMasterDao {
	
	public String getMsg();

	public List getRecord(String hql);

	public int save(OrganisationMasterModel obj);

	public int update(OrganisationMasterModel obj);

	public int delete(String hql);
}
