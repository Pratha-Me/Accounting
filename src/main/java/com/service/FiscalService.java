/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.model.FiscalModel;

/**
 *
 * @author pratha
 */
public interface FiscalService {
	
	public Object getRecord();

	public Object doSave(FiscalModel obj);

	public Object doUpdate(FiscalModel obj, long id);

	public Object doDelete(long id);
}
