package com.project.myurlshortener.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.myurlshortener.entity.UrlEntity;
import com.project.myurlshortener.exception.BadRequestException;
import com.project.myurlshortener.repository.UrlRepository;
import com.project.myurlshortener.request.UrlCreateRequest;

@Service
public class UrlService {
	
	private UrlRepository urlRepository;

	@Autowired
	public UrlService(UrlRepository urlRepository) {
		super();
		this.urlRepository = urlRepository;
	}
	
	public Optional<UrlEntity> createUrl(UrlCreateRequest createRequest){
		
		// 주소명이 이미 존재하면 에러발생
		if(urlRepository.existsByAlias(createRequest.getAlias())) {
			throw new BadRequestException("Alias already Exists");
		}
		
		// 존재하지 않으면 데이터베이스에 추가한다.
		UrlEntity urlEntity = new UrlEntity(createRequest.getAlias(), createRequest.getUrl());
		UrlEntity savedUrlEntity = urlRepository.save(urlEntity);
		
		// urlEntity가 존재하면 리턴하고 아니면 null을 반환한다.
		return Optional.ofNullable(savedUrlEntity);
	}
	
	public Optional<UrlEntity> getUrl(){
		return Optional.empty();
	}
}
