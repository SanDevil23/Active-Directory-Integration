package com.anand.eim.charter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CharterRestController {

	@Autowired private T_Project_Charter_Service projectCharterService;

	@GetMapping("/getCharterAttachment")
	public ResponseEntity<byte[]> getFile(HttpServletRequest request) {
		T_Project_Charter projectCharter = projectCharterService.getCharterProjectDetail(request);
		return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + projectCharter.getCharterAttachmentName() + "\"")
				.body(projectCharter.getCharterAttachment());
	  }
	@GetMapping("/getFinalPresentation")
	public ResponseEntity<byte[]> getFile2(HttpServletRequest request) {
		T_Project_Charter projectCharter = projectCharterService.getCharterProjectDetail(request);
		return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + projectCharter.getFinalPresentationName() + "\"")
				.body(projectCharter.getFinalPresentation());
	  }
	@GetMapping("/getFinalClosurePresentation")
	public ResponseEntity<byte[]> getFile4(HttpServletRequest request) {
		T_Project_Charter projectCharter = projectCharterService.getCharterProjectDetail(request);
		return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + projectCharter.getFinalClosurePresentationName() + "\"")
				.body(projectCharter.getFinalClosurePresentation());
	  }
	@GetMapping("/getReviewMom")
	public ResponseEntity<byte[]> getFile3(HttpServletRequest request) {
		T_Project_Charter_Review projectReview = projectCharterService.getCharterProjectReviewDetail(request);
		return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + projectReview. getReviewMomName() + "\"")
				.body(projectReview.getReviewMom());
	  }
}