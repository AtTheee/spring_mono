package com.fastcampus.ch4.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component
@Aspect
public class LoginAspect {

    private static final Logger logger = LoggerFactory.getLogger(LoginAspect.class);

    public LoginAspect() {
        logger.info("LoginAspect 초기화는 했다!!!");
    }

    @Pointcut("@annotation(com.fastcampus.ch4.annotation.CheckLogin)") // 어노테이션이 붙은 메소트를 타겟으로 하겠다.
    public void checkLoginMethods(){logger.info("Pointcut checkLoginMethods() 초기화!!");}

    @Before("checkLoginMethods() && args(request, response)") // 메소드 실행 전에
    public void logBefore(JoinPoint joinPoint, HttpServletRequest request, HttpServletResponse response) throws IOException{
        logger.info("좀 나와라");
        if (!loginCheck(request)) {
            logger.info("User not logged in.");
            response.sendRedirect("/login/login?toURL=" + request.getRequestURL());
        } else {
            logger.info("User is logged in" + joinPoint.getSignature().getName()); // 현재 실행중인 메소드 이름
        }
    }

    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서(false는 session이 없어도 새로 생성하지 않는다. 반환값 null)
        HttpSession session = request.getSession(false);
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session != null && session.getAttribute("id") != null;
    }
}
