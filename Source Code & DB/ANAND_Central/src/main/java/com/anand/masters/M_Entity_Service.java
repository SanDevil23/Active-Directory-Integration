package com.anand.masters;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface M_Entity_Service {

	List<M_Entity> getEntityList(HttpServletRequest request, Integer offset);

	List<M_Entity> getEntityByActiveStatus(Integer entityActive);

	List<M_Entity> getActiveParentEntityByStatus(Integer entityActive);

	List<M_Entity> getActiveChildEntityByStatus(Integer entityActive);

	String saveEntityDetails(HttpServletRequest request, M_Entity entity);

	String getEntityDetails(HttpServletRequest request);
}
