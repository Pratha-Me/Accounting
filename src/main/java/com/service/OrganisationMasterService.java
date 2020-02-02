/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.model.OrganisationMasterModel;

/**
 *
 * @author pratha
 */
public interface OrganisationMasterService {
	
	public Object getRecord();

	public Object doSave(OrganisationMasterModel obj);

	public Object doUpdate(OrganisationMasterModel obj, long id);
	
	public Object doDelete(long id);
}
