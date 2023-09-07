package com.ez.ezBears.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ez.ezBears.login.controller.LoginInterceptor;
import com.ez.ezBears.myBoard.controller.MyBoardInterceptor;

@Configuration
public class MvcConfiguration implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(new LoginInterceptor())
		.excludePathPatterns("/","/css/**","/login/login")
		.addPathPatterns("/**");
		
		
		/*
		 * registry.addInterceptor(new MyBoardInterceptor())
		 * .addPathPatterns("/myBoard/teamNotice")
		 * .addPathPatterns("/myBoard/teamWorkBoard")
		 * .addPathPatterns("/myBoard/Calender") .addPathPatterns("/myBoard/Approval")
		 * .addPathPatterns("/myBoard/webhard")
		 * .addPathPatterns("/myBoard/myBoardMember");
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