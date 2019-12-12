/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author pratha
 */
@Entity
@Table(name = "dummy")
public class DummyModel implements Serializable {

	@Id
	@Column(name = "ID")
	private Long id;
	@Column(name = "NAME")
	private String name;
	@Column(name = "SURNAME")
	private String surname;
	@Column(name = "ENTER_BY")
	private String enterBy;
	@Column(name = "ENTER_DATE")
	@Temporal(TemporalType.DATE)
	private Date enterDate;

	@Override
	public String toString() {
		return "DummyModel{" + "id=" + id + ", name=" + name + ", surname=" + surname + ", enterBy=" + enterBy + ", enterDate=" + enterDate + '}';
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEnterBy() {
		return enterBy;
	}

	public void setEnterBy(String enterBy) {
		this.enterBy = enterBy;
	}

	public Date getEnterDate() {
		return enterDate;
	}

	public void setEnterDate(Date enterDate) {
		this.enterDate = enterDate;
	}
}
