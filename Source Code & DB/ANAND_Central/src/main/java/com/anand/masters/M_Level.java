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
import javax.persistence.Transient;

@Entity
@Table(name = "m_level")
public class M_Level implements Comparable<M_Level> {

	@Override
	public int compareTo(M_Level zone) {
		return Integer.parseInt(""+zone.getmLevelId()) - Integer.parseInt(""+this.mLevelId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "m_level_id",unique = true, nullable = false)
    private Long mLevelId;

	@Column(name = "level_name")
    private String levelName;

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

	@Column(name = "active")
    private Integer active;

	public Long getmLevelId() {
		return mLevelId;
	}

	public void setmLevelId(Long mLevelId) {
		this.mLevelId = mLevelId;
	}

	public String getLevelName() {
		return levelName;
	}

	public void setLevelName(String levelName) {
		this.levelName = levelName;
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

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	@Transient private String actionForList;

	public String getActionForList() {
		return actionForList;
	}

	public void setActionForList(String actionForList) {
		this.actionForList = actionForList;
	}
}