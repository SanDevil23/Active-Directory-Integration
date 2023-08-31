/**
 * *******************************************************************************************
 * Copyright © 2023 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - Amit Srivastav
 */
package com.anand.ifc.rcm;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.anand.masters.M_Entity;
import com.anand.masters.M_User;

@Entity
@Table(name = "ifc_rcm_plant")
public class M_Plant {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "rcm_plant_id",unique = true, nullable = false)
    private Long rcmPlantId;
	
	@ManyToOne
    @JoinColumn(name="rcm_id", nullable=true)
    private M_Rcm plantForRcm;

	@OneToOne
    @JoinColumn(name = "plant_id", nullable = true)
    private M_Entity plantId;

	@OneToOne
    @JoinColumn(name = "soh_by", nullable = true)
    private M_User sohBy;

	@OneToOne
    @JoinColumn(name = "line_manager", nullable = true)
    private M_User lineManager;
	
	@OneToOne
    @JoinColumn(name = "praac", nullable = true)
    private M_User praac;

	@OneToOne
    @JoinColumn(name = "plant_created_by", nullable = true)
    private M_User plantCreatedBy;

	@Column(name = "plant_created_on")
    private Date plantCreatedOn;

	@Column(name = "plant_active")
    private Integer plantActive;
	
	@OneToMany(mappedBy="plantReference")
    private Set<M_Transaction> plantReference;

	public Long getRcmPlantId() {
		return rcmPlantId;
	}

	public void setRcmPlantId(Long rcmPlantId) {
		this.rcmPlantId = rcmPlantId;
	}

	public M_Rcm getPlantForRcm() {
		return plantForRcm;
	}

	public void setPlantForRcm(M_Rcm plantForRcm) {
		this.plantForRcm = plantForRcm;
	}

	public M_Entity getPlantId() {
		return plantId;
	}

	public void setPlantId(M_Entity plantId) {
		this.plantId = plantId;
	}

	public M_User getSohBy() {
		return sohBy;
	}

	public void setSohBy(M_User sohBy) {
		this.sohBy = sohBy;
	}

	public M_User getLineManager() {
		return lineManager;
	}

	public void setLineManager(M_User lineManager) {
		this.lineManager = lineManager;
	}

	public M_User getPraac() {
		return praac;
	}

	public void setPraac(M_User praac) {
		this.praac = praac;
	}

	public M_User getPlantCreatedBy() {
		return plantCreatedBy;
	}

	public void setPlantCreatedBy(M_User plantCreatedBy) {
		this.plantCreatedBy = plantCreatedBy;
	}

	public Date getPlantCreatedOn() {
		return plantCreatedOn;
	}

	public void setPlantCreatedOn(Date plantCreatedOn) {
		this.plantCreatedOn = plantCreatedOn;
	}

	public Integer getPlantActive() {
		return plantActive;
	}

	public void setPlantActive(Integer plantActive) {
		this.plantActive = plantActive;
	}
	
	public Set<M_Transaction> getPlantReference() {
		return plantReference;
	}

	public void setPlantReference(Set<M_Transaction> plantReference) {
		this.plantReference = plantReference;
	}


	@Transient private Long plantIdTemp;
	@Transient private Long sohByTemp;
	@Transient private Long lineManagerTemp;
	@Transient private Long praacTemp;

	public Long getPlantIdTemp() {
		return plantIdTemp;
	}

	public void setPlantIdTemp(Long plantIdTemp) {
		this.plantIdTemp = plantIdTemp;
	}

	public Long getSohByTemp() {
		return sohByTemp;
	}

	public void setSohByTemp(Long sohByTemp) {
		this.sohByTemp = sohByTemp;
	}

	public Long getLineManagerTemp() {
		return lineManagerTemp;
	}

	public void setLineManagerTemp(Long lineManagerTemp) {
		this.lineManagerTemp = lineManagerTemp;
	}

	public Long getPraacTemp() {
		return praacTemp;
	}

	public void setPraacTemp(Long praacTemp) {
		this.praacTemp = praacTemp;
	}
}