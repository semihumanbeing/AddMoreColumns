package com.project.myurlshortener.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.NaturalId;

@Entity
public class UrlEntity {

	@Id
	@GeneratedValue
	private Long id;
	
	@NaturalId
	@Column(unique = true, nullable = false)
	private String alias;
	
	@Column(nullable = false)
	private String url;

	public UrlEntity(final String alias, final String url) {
		this.alias = alias;
		this.url = url;
	}

	public UrlEntity() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
	
	
	
}
