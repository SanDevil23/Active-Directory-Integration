package com.anand.eim.charter;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.anand.eim.charter.T_Project_Charter;
import com.anand.masters.M_User;


import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "eim_t_project_charter_review")
public class T_Project_Charter_Review implements Comparable<T_Project_Charter_Review> {
	
	@Override
	public int compareTo(T_Project_Charter_Review projectCharterReview) {
		return (int) (projectCharterReview.gettProjectCharterReviewId() - this.tProjectCharterReviewId);
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "t_project_charter_review_id",unique = true, nullable = false)
	private Long tProjectCharterReviewId;
	
	@ManyToOne
	@JoinColumn(name = "t_project_charter_id", nullable = true)
	private T_Project_Charter projectCharterReview;
	
	@Column(name = "review_mom_name") //Review Minutes of Meeting
	private String reviewMomName;

	@Column(name = "review_mom_type")
	private String reviewMomType;

	@Column(name = "review_mom")
	@Lob
	private byte[] reviewMom;
	
	@Column(name = "review_comments")
	private String reviewComments;
	
	@OneToOne
	@JoinColumn(name = "review_done_by", nullable = true)
	private M_User reviewDoneBy;
	
	@Column(name = "review_done_on")
	private Date reviewDoneOn;
	
	@Column(name = "active")
	private Integer active;

	public Long gettProjectCharterReviewId() {
		return tProjectCharterReviewId;
	}

	public void settProjectCharterReviewId(Long tProjectCharterReviewId) {
		this.tProjectCharterReviewId = tProjectCharterReviewId;
	}

	public T_Project_Charter getProjectCharterReview() {
		return projectCharterReview;
	}

	public void setProjectCharterReview(T_Project_Charter projectCharterReview) {
		this.projectCharterReview = projectCharterReview;
	}

	public String getReviewMomName() {
		return reviewMomName;
	}

	public void setReviewMomName(String reviewMomName) {
		this.reviewMomName = reviewMomName;
	}

	public String getReviewMomType() {
		return reviewMomType;
	}

	public void setReviewMomType(String reviewMomType) {
		this.reviewMomType = reviewMomType;
	}

	public byte[] getReviewMom() {
		return reviewMom;
	}

	public void setReviewMom(byte[] reviewMom) {
		this.reviewMom = reviewMom;
	}

	public String getReviewComments() {
		return reviewComments;
	}

	public void setReviewComments(String reviewComments) {
		this.reviewComments = reviewComments;
	}

	public M_User getReviewDoneBy() {
		return reviewDoneBy;
	}

	public void setReviewDoneBy(M_User reviewDoneBy) {
		this.reviewDoneBy = reviewDoneBy;
	}

	public Date getReviewDoneOn() {
		return reviewDoneOn;
	}

	public void setReviewDoneOn(Date reviewDoneOn) {
		this.reviewDoneOn = reviewDoneOn;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}

	@Transient private String reviewCommentsTemp;
	@Transient private String reviewMomNameTemp;
	@Transient private String reviewMomTypeTemp;
	@Transient private MultipartFile reviewMomTemp;
	
	public String getReviewMomNameTemp() {
		return reviewMomNameTemp;
	}

	public void setReviewMomNameTemp(String reviewMomNameTemp) {
		this.reviewMomNameTemp = reviewMomNameTemp;
	}

	public String getReviewMomTypeTemp() {
		return reviewMomTypeTemp;
	}

	public void setReviewMomTypeTemp(String reviewMomTypeTemp) {
		this.reviewMomTypeTemp = reviewMomTypeTemp;
	}

	public MultipartFile getReviewMomTemp() {
		return reviewMomTemp;
	}

	public void setReviewMomTemp(MultipartFile reviewMomTemp) {
		this.reviewMomTemp = reviewMomTemp;
	}
	public String getReviewCommentsTemp() {
		return reviewCommentsTemp;
	}

	public void setReviewCommentsTemp(String reviewCommentsTemp) {
		this.reviewCommentsTemp = reviewCommentsTemp;
	}
}
