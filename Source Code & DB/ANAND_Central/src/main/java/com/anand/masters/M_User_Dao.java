package com.anand.masters;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface M_User_Dao extends JpaRepository<M_User, Long> {
	@Query(value="select * from m_user order by m_user_id desc limit 30 offset ?", nativeQuery = true)
	List<M_User> getUserListWithOffset(Integer offset);

	public M_User findByUserLoginId(String userLoginId);

	public List<M_User> findByUserActive(Integer userActive);

	public List<M_User> findByUserEmailVerifyTokenAndUserActive(String userEmailVerifyToken, Integer userActive);

	@Query(value="select * from m_user where user_code = ? order by m_user_id desc limit 1", nativeQuery = true)
	M_User getUserInfoWhichContainsUserCode(String userCode);
}
