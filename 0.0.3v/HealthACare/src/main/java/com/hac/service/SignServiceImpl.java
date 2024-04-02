package com.hac.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hac.dto.searchDto.PhysicalDto;
import com.hac.dto.searchDto.SignDto;
import com.hac.dto.userDto.InfoDto;
import com.hac.mapper.SignMapper;

import lombok.Setter;

@Service
public class SignServiceImpl implements SignService {
	@Setter(onMethod_ = @Autowired)
	private SignMapper signMapper;

	private final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	

	// 암호화 해주는 함수
	@Override
	public String signUp(SignDto dto,InfoDto infoDto, PhysicalDto phyDto) {

		if (dto.getU_id() == null || dto.getU_id().trim().isEmpty()) {
			System.out.println("빈 ID 회원가입");
			return "redirect:/page/signUp"; // 회원가입 폼으로 이동
		}

		if (dto.getU_pw() == null || dto.getU_pw().trim().isEmpty()) {
			System.out.println("빈 PW 회원가입");
			return "redirect:/page/signUp";
		}

		if (dto.getU_pw().length() < 8) {
			System.out.println("비밀번호 불일치 회원가입");
			return "redirect:/page/signUp";
		}

		if (!dto.getU_pw().equals(dto.getU_repw())) {
			System.out.println("비밀번호 확인 불일치 회원가입");
			return "redirect:/page/signUp";
		}

		if (signMapper.selectId(dto.getU_id())) {
		    System.out.println("아이디 중복 검사");
		    return "redirect:/page/signUp";
		
		} else {
			dto.setU_pw(encoder.encode(dto.getU_pw()));
			signMapper.signUp(dto); // 회원가입 진행
			
			infoDto.setU_no(signMapper.noSearch(dto.getU_id()).getU_no());
			phyDto.setU_no(signMapper.noSearch(dto.getU_id()).getU_no());
			signMapper.signUpInfo(infoDto);
			signMapper.signUpPhy(phyDto);
			
//			dto.setU_no(signMapper.signIn(dto.getU_id(),dto.getU_pw()).getU_no());
//			// 아이디 비번 인설트하고
//			
//			signMapper.signUpPhy(dto);
//			INSERT 하는 MAPPER에 DTO 값넣고
			// 아이디 비번 참조해서 유저넘버 가져오고
//			DTO.SETU_no(SELECT MAPPER DTO)
			// 유저 넘버로 유저 인포 인설트하고
//			USER INFO(DTO)
			// 유저 넘버로 유저 피지컬로그 인설트하고
//			USER 피지컬(DTO)
			return "redirect:/page/login";
		}
	}
	
	@Override
	public String signUpInfo(InfoDto dto) {
		signMapper.signUpInfo(dto);
		return "redirect:/page/login";
	}

	@Override
	public String signUpPhy(PhysicalDto dto) {
		signMapper.signUpPhy(dto);
		return "redirect:/page/login";
	}

	// 암호화 확인해주는 함수
	@Override
	public ArrayList<SignDto> loginList() {
		return signMapper.loginList();
	}

	 //로그인
	@Override
	public SignDto signIn(String U_id, String U_pw) {
	    SignDto user = signMapper.signIn(U_id, U_pw); // DB에서 사용자 정보를 가져옴
	    System.out.println(U_pw);
	    System.out.println(user.getU_pw());
	    
	    if (user != null && encoder.matches(U_pw, user.getU_pw())) {
	        // 비밀번호가 일치하면 로그인 성공
	        return user;
	    }
	    return null;
	}
	
	//아이디 중복체크
	@Override
	public boolean selectId(String U_id) {
		System.out.println("아이디중복체크"+" "+U_id);
		return signMapper.selectId(U_id);
	}
	
	//닉네임 중복체크
	@Override
	public boolean selectName(String I_name) {
		System.out.println("아이디중복체크"+" "+I_name);
		return signMapper.selectName(I_name);
	}
}
