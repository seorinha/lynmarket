package com.lynmarket.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lynmarket.user.bo.UserBO;
import com.lynmarket.user.entity.UserEntity;

@RequestMapping("/user")
@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	/**
	 * 아이디 중복 확인
	 * @param loginId
	 * @return
	 */
	@RequestMapping("/is-duplicated-id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		
		//DB 조회
		UserEntity user = userBO.getUserEntityByLoginId(loginId);
		
		//응답값 만들고 return -> json
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		
		if (user == null) {
			//중복 아닐때
			result.put("isDuplicated", false);
		} else {
			//중복일 때
			result.put("isDuplicated", true);
		}
		return result;
	}
	
	@PostMapping("/sign-up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email) {
		
		//이름 유효성 검사
		if (name.isEmpty()) {
			Map<String, Object> result = new HashMap<>();
			result.put("code", 400);
			result.put("errorMessage", "이름을 입력하세요");
			return result;
		}
		
		//password 해싱 - md5알고리즘
		String hashedPassword = PasswordEncoder.encode(password);
		
		// db insert
		Integer id = userBO.addUser(loginId, hashedPassword, name, email);
		
		//응답값
		Map<String, Object> result = new HashMap<>();
		
		if (id == null) {
			result.put("code", 500);
			result.put("errorMessage", "회원가입에 실패했습니다");
		} else {
			result.put("code", 200);
			result.put("result", "성공");
		}
		return result;
	}
	
	
}
