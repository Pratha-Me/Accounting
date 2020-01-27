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
@Table(name = "fiscal_year")
public class FiscalModel implements Serializable {
	
	@Id
	@Column(name = "ID",columnDefinition = "bigint(4)")
	private Long id;
	@Column(name = "FISCAL_NAME",columnDefinition = "varchar(10)")
	private String fiscalName;
	@Column(name = "START_DATE", columnDefinition = "date")
	@Temporal(TemporalType.DATE)
	private Date startDate;
	@Column(name = "END_DATE", columnDefinition = "date")
	@Temporal(TemporalType.DATE)
	private Date endDate;
	@Column(name = "STATUS",columnDefinition = "varchar(1)")
	private String status;
	
	@Override
	public String toString() {
		return "FiscalModel{" + "id=" + id + ", fiscalName=" + fiscalName + ", startDate=" + startDate + ", endDate=" + endDate + ", status=" + status + '}';
	}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getfiscalName() {
		return fiscalName;
	}
	
	public void setfiscalName(String fiscalName) {
		this.fiscalName = fiscalName;
	}
	
	public Date getStartDate() {
		return startDate;
	}
	
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	public Date getEndDate() {
		return endDate;
	}
	
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
}
