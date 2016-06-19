package kosta.apt.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kosta.apt.service.MemberService;

public class LoginInterceptor extends HandlerInterceptorAdapter {



@Override
  public boolean preHandle(HttpServletRequest request,  HttpServletResponse response, Object handler) throws Exception {
    
    HttpSession session = request.getSession();   

    if(session.getAttribute("member") != null){
    
    System.out.println("로그인 상태");
    
      request.setAttribute("loginOn", 1);      
      
     
    }else{  
    	System.out.println("비로그인 상태");
    	 request.setAttribute("loginOn", 0);      
    }
    return true;
  }  

}

