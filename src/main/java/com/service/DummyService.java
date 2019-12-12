/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.model.DummyModel;

/**
 *
 * @author pratha
 */
public interface DummyService {
	
	public Object getRecord();

	public Object doSave(DummyModel obj);

	public Object doUpdate(DummyModel obj, Long id);
	
	public Object doDelete(Long id);
}
