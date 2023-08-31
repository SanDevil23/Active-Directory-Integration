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
@Table(name = "m_zone")
public class M_Zone implements Comparable<M_Zone> {

	@Override
	public int compareTo(M_Zone zone) {
		return Integer.parseInt(""+zone.getmZoneId()) - Integer.parseInt(""+this.mZoneId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "m_zone_id",unique = true, nullable = false)
    private Long mZoneId;

	@Column(name = "zone_name")
    private String zoneName;

	@Column(name = "zone_active")
    private Integer zoneActive;

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

	public Long getmZoneId() {
		return mZoneId;
	}

	public void setmZoneId(Long mZoneId) {
		this.mZoneId = mZoneId;
	}

	public String getZoneName() {
		return zoneName;
	}

	public void setZoneName(String zoneName) {
		this.zoneName = zoneName;
	}

	public Integer getZoneActive() {
		return zoneActive;
	}

	public void setZoneActive(Integer zoneActive) {
		this.zoneActive = zoneActive;
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

	@Transient private String actionForList;

	public String getActionForList() {
		return actionForList;
	}

	public void setActionForList(String actionForList) {
		this.actionForList = actionForList;
	}
}