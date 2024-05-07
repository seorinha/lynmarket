package com.lynmarket.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.lynmarket.user.entity.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer>{

	//아이디 중복확인
	//null or 채워져있음
	public UserEntity findByLoginId(String loginId);
}
