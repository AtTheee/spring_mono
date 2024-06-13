package com.fastcampus.ch4.controller;

import java.net.URLEncoder;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fastcampus.ch4.dao.*;
import com.fastcampus.ch4.domain.*;
import com.fastcampus.ch4.service.ContactService;
import com.fastcampus.ch4.service.MailSendService;
import com.fastcampus.ch4.service.MemberService;
import org.checkerframework.checker.units.qual.C;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/login")
public class LoginController {

//    @Autowired
//    MemberService memberService;
//
//    @Autowired
//    MailSendService mailSendService;
//
//    @Autowired
//    ContactService contactService;

    private final MemberService memberService;
    private final MailSendService mailSendService;
    private final ContactService contactService;
    public LoginController(MemberService memberService, MailSendService mailSendService, ContactService contactService){
        this.memberService = memberService;
        this.mailSendService = mailSendService;
        this.contactService = contactService;
    }

    @GetMapping("/login")
    public String loginForm() {
        return "loginForm";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // 1. 세션을 종료
        session.invalidate();
        // 2. 홈으로 이동
        return "redirect:/";
    }

    @PostMapping("/login")
    public String login(String id, String pw, String toURL, boolean rememberId,
                         HttpServletResponse response, RedirectAttributes redirectAttributes, HttpSession session) throws Exception {

        try{
            int result = memberService.login(id, pw);

            switch (result){
                case 0:
                    redirectAttributes.addFlashAttribute("msg", "ID_ERR");
                    return "redirect:/login/login";
                case 1:
                    redirectAttributes.addFlashAttribute("msg", "PW_ERR");
                    return "redirect:/login/login";
                case 2:
                    session.setAttribute("id",id);
                    Cookie cookie = new Cookie("id",id);
                    if (!rememberId) {
                        cookie.setMaxAge(0);
                    }
                    response.addCookie(cookie);
                    toURL = toURL==null || toURL.equals("") ? "/" : toURL;
                    return "redirect:"+toURL;
                default:
                    redirectAttributes.addFlashAttribute("msg","ERR");
                    return "redirect:/login/login";
            }

        } catch (Exception e){
            redirectAttributes.addFlashAttribute("msg","LOGIN_ERR");
            return "redirect:/login/login";
        }
    }

    @GetMapping("/join")
    public String join(){
        return "registerForm";
    }

    @PostMapping("/join")
    public String join(User user, Model model, RedirectAttributes redirectAttributes){

        try{
            if(memberService.join(user) != 1)
                throw new Exception("join failed");

            model.addAttribute("id", user.getId());
            model.addAttribute("name", user.getName());

            return "register_s";
        }catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg","JOIN_ERR");
            return "redirect:/login/join"; // !
        }
    }

    @PostMapping("/idCheck")
    @ResponseBody
    public int idCheck(@RequestParam("id") String id) throws Exception {
        int cnt = memberService.idCheck(id);
        return cnt;
    }

    @GetMapping("/myPage")
    public String myPage(){
        return "myPage";
    }

    @GetMapping("/myPage_check")
    public String myPageCheck(){
        return "myPage_check";
    }

    @PostMapping("/myPage_info")
    public String myPageInfo(String pw, HttpSession session, RedirectAttributes redirectAttributes, Model model, HttpServletResponse response) throws Exception {
        String id = (String)session.getAttribute("id");

        // 캐시 방지 헤더 설정
        // 일단 회원정보 수정하면 -> check 페이지에서 뒤로가기 했을 떄 양식 다시 제출하게
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.

        try{
            if(!memberService.pwCheck(id, pw))
                throw new Exception("pwCheck failed");

            model.addAttribute("user", memberService.getUser(id));
            return "myPage_info";

        } catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg", "pwCheck_ERR");
            return "redirect:/login/myPage_check";
        }
    }

    @PostMapping("/myPage_modify")
    @ResponseBody
    public ResponseEntity<?> myPageModify(@ModelAttribute User user){

        try{
            if(memberService.modify(user) != 1)
                throw new Exception("userModify failed");
            return ResponseEntity.ok(Map.of("status","success"));

        } catch (Exception e){
            return ResponseEntity.badRequest().body(Map.of("status","error"));
        }
    }

    @PostMapping("/remove")
    @ResponseBody
    public ResponseEntity<?> remove(HttpSession session){
        try{
            String id = (String)session.getAttribute("id");
            if(memberService.remove(id) != 1)
                throw new Exception("userRemove failed");
            return ResponseEntity.ok(Map.of("status","success"));

        }catch (Exception e){
            return ResponseEntity.badRequest().body(Map.of("status","error"));
        }
    }

    @PostMapping("/mailCheck")
    @ResponseBody
    public String mailCheck(@RequestParam String email){
        return mailSendService.joinEmail(email);
    }

    @GetMapping("/find_id")
    public String findId(){
        return "findUser";
    }

    @PostMapping("/find_id")
    @ResponseBody
    public String findId(@RequestParam String name, @RequestParam String email) throws Exception{

        User user = memberService.findId(name,email);

        if(user == null){
            return null;
        } else{
            return user.getId();
        }
    }

    @GetMapping("/find_pw")
    public String findPw(Model model){
        model.addAttribute("mode","pw");
        return "findUser";
    }

    @PostMapping("/find_pw")
    @ResponseBody
    public ResponseEntity<?> findPw(@RequestParam String name, @RequestParam String id, @RequestParam String email) throws Exception{
        try{

            User user = memberService.getUser(id);
            if(user == null || !user.getName().equals(name) || !user.getEmail().equals(email)){
                 return ResponseEntity.ok(Map.of("status","null"));
            }

            String tempPw = mailSendService.temporaryPassword(email);
            user.setPw(tempPw);
            if(memberService.modify(user) != 1)
                throw new Exception("user modify failed");

            return ResponseEntity.ok(Map.of("status","success"));
        } catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.badRequest().body(Map.of("status","error"));
        }
    }

    @GetMapping("/myBoard")
    public String myBoard(SearchCondition sc, Model model, HttpSession session) throws Exception{
        String id = session.getAttribute("id").toString();

        List<ContactDto> list = contactService.userSelectList(sc, id);
        list.forEach(dto -> dto.setWriter(maskName(dto.getWriter())));

        model.addAttribute("list", list);

        int totalCnt = contactService.userSelectCnt(sc, id);

        PageHandler pageHandler = new PageHandler(totalCnt, sc);

        model.addAttribute("ph",pageHandler);

        Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant(); // 오늘의 자정 시간
        model.addAttribute("startOfToday", startOfToday.toEpochMilli());

        model.addAttribute("mode", "myBoard"); // 모드 설정

        return "contactList";
    }

    private String maskName(String name){
        if(name == null || name.length() < 2) return name;

        int half = name.length() / 2;
        StringBuilder maskedName = new StringBuilder(name.substring(0,half));

        for(int i = half; i < name.length(); i++){
            maskedName.append("*");
        }
        return maskedName.toString();
    }
}