package com.project.myurlshortener.request;

import javax.validation.constraints.NotNull;

public class UrlCreateRequest {
	
	@NotNull
	private String alias;
	
	@NotNull
	private String url;

	public UrlCreateRequest(final String alias, final String url) {
		this.alias = alias;
		this.url = url;
	}

	public String getAlias() {
		return alias;
	}

	public String getUrl() {
		return url;
	}
	
	
	
	
}
