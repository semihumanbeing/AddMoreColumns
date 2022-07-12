package com.project.myurlshortener.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.myurlshortener.entity.UrlEntity;

@Repository
public interface UrlRepository extends JpaRepository<UrlEntity,Long> {
	
	Optional<UrlEntity> findByAlias(String alias);
	
	Boolean existsByAlias(String alias);

}
