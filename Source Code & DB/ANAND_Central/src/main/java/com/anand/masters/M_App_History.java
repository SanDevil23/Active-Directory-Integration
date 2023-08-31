package com.anand.masters;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "m_app_history")
public class M_App_History implements Comparable<M_App_History> {

	@Override
	public int compareTo(M_App_History appHistory) {
		return appHistory.getmAppHistoryId() - this.mAppHistoryId;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "m_app_history_id",unique = true, nullable = false)
    private Integer mAppHistoryId;

	@OneToOne
    @JoinColumn(name = "m_app_id", nullable = true)
    private M_App mAppId;

	@Column(name = "app_name")
    private String appName;

	@Column(name = "app_description")
    private String appDescription;

	@Column(name = "app_active")
    private Integer appActive;

	@OneToOne
    @JoinColumn(name = "app_history_created_by", nullable = true)
    private M_User mUserId;

	@Column(name = "app_history_created_on")
    private Date createdOn;

	public Integer getmAppHistoryId() {
		return mAppHistoryId;
	}

	public void setmAppHistoryId(Integer mAppHistoryId) {
		this.mAppHistoryId = mAppHistoryId;
	}

	public M_App getmAppId() {
		return mAppId;
	}

	public void setmAppId(M_App mAppId) {
		this.mAppId = mAppId;
	}

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getAppDescription() {
		return appDescription;
	}

	public void setAppDescription(String appDescription) {
		this.appDescription = appDescription;
	}

	public Integer getAppActive() {
		return appActive;
	}

	public void setAppActive(Integer appActive) {
		this.appActive = appActive;
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