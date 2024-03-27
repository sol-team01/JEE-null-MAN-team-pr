package com.hac.dto.userDto;

import lombok.Data;

@Data
public class InfoDto {

	private String I_no; // 인포Dto 고유번호
	private String U_no; // 유저 넘버
	private String I_name; // 유저 네임
	private String I_nameUpdateTime; // 유저 이름 마지막 변경시간
	private byte[] I_profileImg; // 프로필 사진
	private String I_profileImgUpdateTime; // 프로필 사진 마지막 변경시간
	private String I_birthDate; // 생년월일
	private String I_gender; // 성별
	private String I_email; // 이메일
	private int I_pwFinding; //질의 종류
	private String I_hint; // 질문 대답
	private String I_createdAt; // 계정생성시간
	private String I_updatedAt; // 마지막 업데이트 시간
	private int timeDifference; // 두 날짜 간의 차이계산
	
}
