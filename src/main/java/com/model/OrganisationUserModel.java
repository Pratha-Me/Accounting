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
@Table(name="organisation_user")
public class OrganisationUserModel implements Serializable{
	
	@Id
	@Column(name="ID", columnDefinition = "bigint", nullable = false)
	private long id;
	@Column(name="USER_ID", columnDefinition = "varchar(15)", nullable = false, unique = true)
	private String userID;
	@Column(name="USER_NAME", columnDefinition = "varchar(60)")
	private String userName;
	@Column(name="MOBILE_NUMBER", columnDefinition = "varchar(10)")
	private String mobileNum;
	@Column(name="EMAIL", columnDefinition = "varchar(150)")
	private String email;
	@Column(name="STATUS", columnDefinition = "varchar(1)")
	private String status;
	@Column(name="JOIN_DATE", columnDefinition = "date")
	@Temporal(TemporalType.DATE)
	private Date date;
	
	@Override
	public String toString() {
		return "OrganizationUsermodel{" + "id=" + id + ", userID=" + userID + ", userName=" + userName + ", mobileNum=" + mobileNum + ", email=" + email + ", status=" + status + ", date=" + date + '}';
	}
	
	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}
	
	public String getUserID() {
		return userID;
	}
	
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getMobileNum() {
		return mobileNum;
	}
	
	public void setMobileNum(String mobileNum) {
		this.mobileNum = mobileNum;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public Date getDate() {
		return date;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
}
