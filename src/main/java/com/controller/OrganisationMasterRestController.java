/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.OrganisationMasterModel;
import com.service.OrganisationMasterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;

/**
 *
 * @author pratha
 */

@RestController
@RequestMapping("api/Master")
public class OrganisationMasterRestController {
	
    @Autowired
    OrganisationMasterService service;

    @GetMapping
    public Object getRecord() {
        return service.getRecord();
    }

    @PostMapping
    public Object Save(@RequestBody OrganisationMasterModel obj) {
        return service.doSave(obj);
    }

    @PutMapping("/{id}")
    public Object Update(@PathVariable long id, @RequestBody OrganisationMasterModel obj) {
        return service.doUpdate(obj, id);
    }

    @DeleteMapping("/{id}")
    public Object Delete(@PathVariable long id) {
        return service.doDelete(id);
    }
}
