package com.hac.controller;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.hac.dto.foodDto.FoodDto;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/food/*") 
@AllArgsConstructor 
@Controller
public class FoodController {
		// API 키를 상수로 정의
		private static final String API_KEY = "hHHC2afAzbBFG%2BiTNM1BgP8tim6KZmaRvsAPA6AOJd60TROjKviEGzaqQ%2BS%2BKLCR5OHtl74y2SWr%2Bev1LBBvHQ%3D%3D";
		
		// 식품정보 리스트 보기
		@RequestMapping("/list")
		public void list(@RequestParam(value = "desc_kor", defaultValue = "%EB%B0%B0") String descKor, Model model) {
//			//인코딩 인증키	
//			String API_KEY = "hHHC2afAzbBFG%2BiTNM1BgP8tim6KZmaRvsAPA6AOJd60TROjKviEGzaqQ%2BS%2BKLCR5OHtl74y2SWr%2Bev1LBBvHQ%3D%3D";					
//			String API_URL = null;
//			
//			try {
//				String encodedSearchId = URLEncoder.encode(descKor, "UTF-8");
//				API_URL = "http://apis.data.go.kr/1471000/FoodNtrIrdntInfoService1/getFoodNtrItdntList1?serviceKey="+ API_KEY +"&desc_kor="+ encodedSearchId +"&pageNo=1&numOfRows=10&type=json" ;			
//				log.info("========" + API_URL);
//			} catch (UnsupportedEncodingException e1) {
//				e1.printStackTrace();
//			}
//			
//			RestTemplate restTemplate = new RestTemplate();					
//			URI uri = null; 				
//			try {					
//				uri = new URI(API_URL);				
//			} catch (URISyntaxException e) {					
//				e.printStackTrace();				
//			}
//								
//			FoodDto food = restTemplate.getForObject(uri, FoodDto.class); 	
//			
//			log.info("==== food json ==== : ============================ : ");							
//			
//			 model.addAttribute("food", food);
//			 
			 
			  // API URL 생성
			    String API_URL = createApiUrl(descKor);
			    log.info("API URL: " + API_URL);

			    // RestTemplate을 사용하여 API 호출
			    RestTemplate restTemplate = new RestTemplate();
			    FoodDto food = restTemplate.getForObject(API_URL, FoodDto.class);
			    log.info("food json: " + food);

			    model.addAttribute("food", food);
			    log.info("LIST: API 호출 완료");
			 
		}
		
		@RequestMapping("/detailList")
		public void detailList(@RequestParam(value = "desc_kor", defaultValue = "%EB%B0%B0") String descKor, Model model) {
			  // API URL 생성
		    String API_URL = createApiUrl(descKor);
		    log.info("API URL: " + API_URL);

		    // RestTemplate을 사용하여 API 호출
		    RestTemplate restTemplate = new RestTemplate();
		    FoodDto food = restTemplate.getForObject(API_URL, FoodDto.class);
		    log.info("food json: " + food);

		    model.addAttribute("food", food);
		    log.info("DETAILLIST: API 호출 완료");
			 
			log.info("==== DEDAILLIST ==== : ============================ : ");	
		}
		
		@RequestMapping("/information")
		public void information(@RequestParam(value = "desc_kor", defaultValue = "%EB%B0%B0") String descKor, Model model) {
			 // API URL 생성
		    String API_URL = createApiUrl(descKor);
		    log.info("API URL: " + API_URL);

		    // RestTemplate을 사용하여 API 호출
		    RestTemplate restTemplate = new RestTemplate();
		    FoodDto food = restTemplate.getForObject(API_URL, FoodDto.class);
		    log.info("food json: " + food);

		    model.addAttribute("food", food);
		    log.info("INFORMATION: API 호출 완료");
			 
			log.info("==== INFORMATION ==== : ============================ : ");	
		}
		
		// API URL 생성 메서드
		private String createApiUrl(String descKor) {
		    try {
		        String encodedSearchId = URLEncoder.encode(descKor, "UTF-8");
		        return "http://apis.data.go.kr/1471000/FoodNtrIrdntInfoService1/getFoodNtrItdntList1?serviceKey="
		                + API_KEY + "&desc_kor=" + encodedSearchId + "&pageNo=1&numOfRows=10&type=json";
		    } catch (UnsupportedEncodingException e) {
		        e.printStackTrace();
		        return null;
		    }
		}
		
}
