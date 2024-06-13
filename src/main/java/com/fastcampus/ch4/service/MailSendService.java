package com.fastcampus.ch4.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.Random;
import java.util.UUID;

@Component
public class MailSendService {
//    @Autowired
//    private JavaMailSenderImpl mailSender;

    private final JavaMailSenderImpl mailSender;
    public MailSendService(JavaMailSenderImpl mailSender){
        this.mailSender = mailSender;
    }

    public int makeRandomNumber(){
        //난수 생성 (인증번호)
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        return checkNum;
    }

    public String joinEmail(String email){
        int authNumber = makeRandomNumber();
        String setForm = "flzhejqnfwk@naver.com";
        String toMail = email;
        String title = "MONO 회원 가입 인증 이메일 입니다.";
        String content = "인증 코드는 " + authNumber + "입니다." +
                "<br>" +
                "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";
        mailSend(setForm, toMail, title, content);
        return Integer.toString(authNumber);
    }

    public String temporaryPassword(String email){
        String tempPw = UUID.randomUUID().toString().replace("-",""); // - 제거
        tempPw = tempPw.substring(0,10); //10자리 비밀번호

        String setForm = "flzhejqnfwk@naver.com";
        String toMail = email;
        String title = "MONO 임시 비밀번호가 발급되었습니다.";
        String content = "임시비밀번호는 " + tempPw + "입니다." +
                "<br>" +
                "발급 이후 빠른 시일내에 새로운 비밀번호로 변경해주세요.";
        mailSend(setForm, toMail, title, content);

        return tempPw;
    }

    public void mailSend(String setForm, String toMail, String title, String content){
        MimeMessage message = mailSender.createMimeMessage();

        try{

            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setForm);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content, true); // true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
            mailSender.send(message);

        } catch (Exception e){
            e.printStackTrace();
        }
    }


}
