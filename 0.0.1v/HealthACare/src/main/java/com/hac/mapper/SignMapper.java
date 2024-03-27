package com.hac.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hac.dto.searchDto.LoginDto;

public interface SignMapper {
	public void login(LoginDto dto);
	//암호화 구현 확인을 위한 함수
	public ArrayList<LoginDto> loginList();
	//입력한 로그인을 불러오기 위한 메퍼
	public LoginDto signIn(@Param("id") String id, @Param("pw") String pw);
	
	// 다른 메소드들과 함께 중복 체크를 위한 메소드 추가
    public int countId(String id);
}
