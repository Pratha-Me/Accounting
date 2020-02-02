/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.model.OrganisationUserModel;

/**
 *
 * @author pratha
 */
public interface OrganisationUserService {
	
	public Object getRecord();

	public Object doSave(OrganisationUserModel obj);

	public Object doUpdate(OrganisationUserModel obj, long id);
	
	public Object doDelete(long id);
}
