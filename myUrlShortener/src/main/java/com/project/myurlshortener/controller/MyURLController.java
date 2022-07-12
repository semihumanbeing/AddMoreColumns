package com.project.myurlshortener.controller;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MyURLController {

	@GetMapping("/{alias}")
	public ResponseEntity<?> redirectHandler(@PathVariable String alias) throws URISyntaxException{
		// URI를 구해서 http header 에 전달해준다.
		URI uri = new URI("https://www.google.com");
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setLocation(uri);
		
		// ResponseEntity 에는 httpHeader와 status를 전달해준다.
		return new ResponseEntity<>(httpHeaders, HttpStatus.MOVED_PERMANENTLY);
	}
	
	@PostMapping("/{alias}")
	public ResponseEntity<?> redirectCreator(@PathVariable String id){
		
		return null;
	}
}
