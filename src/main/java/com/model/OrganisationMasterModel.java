/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package com.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author pratha
 */

@Entity
@Table(name="organisation_master")
public class OrganisationMasterModel implements Serializable {
	
	@Id
	@Column(name="ID", columnDefinition = "bigint")
	private long id;
	@Column(name="NAME", columnDefinition = "varchar(60)")
	private String userName;
	@Column(name="ADDRESS", columnDefinition = "varchar(150)")
	private String address;
	@Column(name="URL", columnDefinition = "varchar(100)")
	private String url;
	@Column(name="EMAIL", columnDefinition = "varchar(150)")
	private String email;
	@Column(name="CONTACT_NUMBER", columnDefinition = "varchar(10)")
	private String contactNum;
	
	@Override
	public String toString() {
		return "OrganisationMaster{" + "id=" + id + ", userName=" + userName + ", address=" + address + ", url=" + url + ", email=" + email + ", contactNum=" + contactNum + '}';
	}
	
	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getContactNum() {
		return contactNum;
	}
	
	public void setContactNum(String contactNum) {
		this.contactNum = contactNum;
	}
}
