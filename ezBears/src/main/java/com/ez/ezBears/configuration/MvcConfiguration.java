package com.ez.ezBears.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfiguration implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		/*
		registry.addInterceptor(new LoginInterceptor())
		.addPathPatterns("/shop/cart/*", "/shop/order/*",
				"/member/memberEdit","/member/memberOut");

	
		registry.addInterceptor(new AdminLoginInterceptor())
		.excludePathPatterns("/admin/login/adminLogin")
		.addPathPatterns("/admin/**"); 
		//**->admin아래 폴더가 와도 되고 안되도 되고

		 */
	}

	/*
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver 
		= new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8"); // 파일 인코딩 설정
		multipartResolver.setMaxUploadSizePerFile(2 * 1024 * 1024); // 파일당 업로드 크기 제한 (2MB)
		return multipartResolver;
	}
*/
	

	/*
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/pd_images/**").addResourceLocations("file:///C:/lecture/pd_images/");
		
	}
*/
	
}