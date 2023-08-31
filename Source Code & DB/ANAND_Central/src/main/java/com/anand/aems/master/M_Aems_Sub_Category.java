/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - R S Iyer
 */
package com.anand.aems.master;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.anand.masters.M_User;

@Entity
@Table(name = "aems_m_sub_category")
public class M_Aems_Sub_Category implements Comparable<M_Aems_Sub_Category> {

	@Override
	public int compareTo(M_Aems_Sub_Category aemsSubCategory) {
		return Integer.parseInt(""+this.getmAemsSubCategoryId()) - Integer.parseInt(""+aemsSubCategory.getmAemsSubCategoryId());
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "m_aems_sub_category_id",unique = true, nullable = false)
    private Long mAemsSubCategoryId;

	@OneToOne
    @JoinColumn(name = "m_aems_category_id", nullable = true)
	private M_Aems_Category mAemsCategoryId;

	@Column(name = "aems_sub_category_name")
    private String aemsSubCategoryName;

	@Column(name = "aems_sub_category_active")
    private Integer aemsSubCategoryActive;//0-In-Active 1-Active

	@OneToOne
    @JoinColumn(name = "m_user_id", nullable = true)
	private M_User mUserId;

	@Column(name = "created_on")
    private Date createdOn;

	@OneToOne
    @JoinColumn(name = "m_user_id_updated", nullable = true)
	private M_User mUserIdUpdated;

	@Column(name = "updated_on")
    private Date updatedOn;

	public Long getmAemsSubCategoryId() {
		return mAemsSubCategoryId;
	}

	public void setmAemsSubCategoryId(Long mAemsSubCategoryId) {
		this.mAemsSubCategoryId = mAemsSubCategoryId;
	}

	public M_Aems_Category getmAemsCategoryId() {
		return mAemsCategoryId;
	}

	public void setmAemsCategoryId(M_Aems_Category mAemsCategoryId) {
		this.mAemsCategoryId = mAemsCategoryId;
	}

	public String getAemsSubCategoryName() {
		return aemsSubCategoryName;
	}

	public void setAemsSubCategoryName(String aemsSubCategoryName) {
		this.aemsSubCategoryName = aemsSubCategoryName;
	}

	public Integer getAemsSubCategoryActive() {
		return aemsSubCategoryActive;
	}

	public void setAemsSubCategoryActive(Integer aemsSubCategoryActive) {
		this.aemsSubCategoryActive = aemsSubCategoryActive;
	}

	public M_User getmUserId() {
		return mUserId;
	}

	public void setmUserId(M_User mUserId) {
		this.mUserId = mUserId;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public M_User getmUserIdUpdated() {
		return mUserIdUpdated;
	}

	public void setmUserIdUpdated(M_User mUserIdUpdated) {
		this.mUserIdUpdated = mUserIdUpdated;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	@OneToMany(mappedBy="aemsSubCategoryHistory")
    private Set<M_Aems_Sub_Category_History> aemsSubCategoryHistory;

	public Set<M_Aems_Sub_Category_History> getAemsSubCategoryHistory() {
		return aemsSubCategoryHistory;
	}

	public void setAemsSubCategoryHistory(Set<M_Aems_Sub_Category_History> aemsSubCategoryHistory) {
		this.aemsSubCategoryHistory = aemsSubCategoryHistory;
	}

	@Transient private String actionForList;
	@Transient private Long tempCategoryId;

	public String getActionForList() {
		return actionForList;
	}

	public void setActionForList(String actionForList) {
		this.actionForList = actionForList;
	}

	public Long getTempCategoryId() {
		return tempCategoryId;
	}

	public void setTempCategoryId(Long tempCategoryId) {
		this.tempCategoryId = tempCategoryId;
	}
}