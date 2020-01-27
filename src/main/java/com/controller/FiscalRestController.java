/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.FiscalModel;
import com.service.FiscalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author pratha
 */

@RestController
@RequestMapping("api/Fiscal")
public class FiscalRestController {
	
	@Autowired 
	FiscalService service;
	
	@GetMapping
	public Object getRecord(){
		return service.getRecord();
	}

	@PostMapping
	public Object save(@RequestBody FiscalModel obj){
		return service.doSave(obj);
	}

	@PutMapping("/{id}")
	public Object update(@PathVariable long id, @RequestBody FiscalModel obj){
		return service.doUpdate(obj, id);
	}

	@DeleteMapping ("/{id}")
	public Object delete(@PathVariable long id){
		return service.doDelete(id);
	}
}
