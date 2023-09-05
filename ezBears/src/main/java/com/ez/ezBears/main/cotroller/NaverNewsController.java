package com.ez.ezBears.main.cotroller;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;

import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api")
public class NaverNewsController {
	
	@RequestMapping("/naverNews")
	public String newsView() {
		//네이버 뉴스
		String query = "야구";
		ByteBuffer buffer =StandardCharsets.UTF_8.encode(query);//utf8로 변환
		String encoding = StandardCharsets.UTF_8.decode(buffer).toString();
		
		java.net.URI uri = UriComponentsBuilder
				.fromUriString("https://openapi.naver.com")
				.path("/v1/search/news.json")
				.queryParam("query", encoding)
				.queryParam("display",5)
				.queryParam("start",1)
				.queryParam("sort", "date")
				.encode()
				.build()
				.toUri();
		
		RestTemplate restTemplate = new RestTemplate();
		
		RequestEntity<Void> req = RequestEntity
				.get(uri)
				.header("X-Naver-Client-Id","gJT7WuqmOqjls6Ss27Qp")
				.header("X-Naver-Client-Secret","NtMqngH3uO")
				.build();
		
		ResponseEntity<String> result = restTemplate.exchange(req, String.class);
		return result.getBody();
	}

}
