package com.anand.aems.master;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.anand.masters.M_User;

@Entity
@Table(name = "aems_m_sub_category_history")
public class M_Aems_Sub_Category_History implements Comparable<M_Aems_Sub_Category_History> {

	@Override
	public int compareTo(M_Aems_Sub_Category_History mAemsCategoryHistory) {
		return mAemsCategoryHistory.getmAemsCategoryHistoryId() - this.getmAemsCategoryHistoryId();
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "m_aems_sub_category_history_id",unique = true, nullable = false)
    private Integer mAemsCategoryHistoryId;

	@ManyToOne
    @JoinColumn(name = "m_aems_sub_category_id", nullable = true)
    private M_Aems_Sub_Category aemsSubCategoryHistory;

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

	public Integer getmAemsCategoryHistoryId() {
		return mAemsCategoryHistoryId;
	}

	public void setmAemsCategoryHistoryId(Integer mAemsCategoryHistoryId) {
		this.mAemsCategoryHistoryId = mAemsCategoryHistoryId;
	}

	public M_Aems_Sub_Category getAemsSubCategoryHistory() {
		return aemsSubCategoryHistory;
	}

	public void setAemsSubCategoryHistory(M_Aems_Sub_Category aemsSubCategoryHistory) {
		this.aemsSubCategoryHistory = aemsSubCategoryHistory;
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
}