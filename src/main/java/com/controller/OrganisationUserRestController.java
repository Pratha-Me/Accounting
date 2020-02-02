/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.OrganisationUserModel;
import com.service.OrganisationUserService;
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
@RequestMapping("api/User")
public class OrganisationUserRestController {
	
    @Autowired
    OrganisationUserService service;

    @GetMapping
    public Object getRecord() {
        return service.getRecord();
    }

    @PostMapping
    public Object Save(@RequestBody OrganisationUserModel obj) {
        return service.doSave(obj);
    }

    @PutMapping("/{id}")
    public Object Update(@PathVariable long id, @RequestBody OrganisationUserModel obj) {
        return service.doUpdate(obj, id);
    }

    @DeleteMapping("/{id}")
    public Object Delete(@PathVariable long id) {
        return service.doDelete(id);
    }
}
