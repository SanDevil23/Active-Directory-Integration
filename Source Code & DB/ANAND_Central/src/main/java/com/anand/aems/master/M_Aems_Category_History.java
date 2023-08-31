package com.anand.aems.master;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.anand.masters.M_User;

@Entity
@Table(name = "aems_m_category_history")
public class M_Aems_Category_History implements Comparable<M_Aems_Category_History> {

	@Override
	public int compareTo(M_Aems_Category_History mAemsCategoryHistory) {
		return mAemsCategoryHistory.getmAemsCategoryHistoryId() - this.getmAemsCategoryHistoryId();
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "m_aems_category_history_id",unique = true, nullable = false)
    private Integer mAemsCategoryHistoryId;

	@OneToOne
    @JoinColumn(name = "m_aems_category_id", nullable = true)
    private M_Aems_Category aemsProjectCategoryHistory;

	@Column(name = "aems_category_name")
    private String aemsCategoryName;

	@Column(name = "aems_category_active")
    private Integer aemsCategoryActive;//0-In-Active 1-Active

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

	public M_Aems_Category getAemsProjectCategoryHistory() {
		return aemsProjectCategoryHistory;
	}

	public void setAemsProjectCategoryHistory(M_Aems_Category aemsProjectCategoryHistory) {
		this.aemsProjectCategoryHistory = aemsProjectCategoryHistory;
	}

	public String getAemsCategoryName() {
		return aemsCategoryName;
	}

	public void setAemsCategoryName(String aemsCategoryName) {
		this.aemsCategoryName = aemsCategoryName;
	}

	public Integer getAemsCategoryActive() {
		return aemsCategoryActive;
	}

	public void setAemsCategoryActive(Integer aemsCategoryActive) {
		this.aemsCategoryActive = aemsCategoryActive;
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