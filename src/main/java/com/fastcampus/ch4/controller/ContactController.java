package com.fastcampus.ch4.controller;

import com.fastcampus.ch4.domain.ContactDto;
import com.fastcampus.ch4.domain.PageHandler;
import com.fastcampus.ch4.domain.SearchCondition;
import com.fastcampus.ch4.domain.User;
import com.fastcampus.ch4.service.ContactService;
import com.fastcampus.ch4.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

@Controller
@RequestMapping("/contact")
public class ContactController {

    @Autowired
    ContactService contactService;

    @Autowired
    MemberService memberService;

    @GetMapping("/list")
    public String list(Model model, SearchCondition sc) throws Exception {
        try{
            List<ContactDto> list = contactService.searchSelectList(sc);
            list.forEach(dto -> dto.setWriter(maskName(dto.getWriter())));

            model.addAttribute("list", list);

            int totalCnt = contactService.searchSelectCnt(sc);

            PageHandler pageHandler = new PageHandler(totalCnt, sc);

            model.addAttribute("ph",pageHandler);

            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant(); // 오늘의 자정 시간
            model.addAttribute("startOfToday", startOfToday.toEpochMilli());

            model.addAttribute("mode", "contactList"); // 모드 설정

        }catch (Exception e){
            e.printStackTrace();
        }

        return "contactList";
    }

    @GetMapping("/write")
    public String write(HttpServletRequest request ,Model model){
        if(!loginCehck(request)){
            return "redirect:/login/login?toURL=" + request.getRequestURL();
        }
        model.addAttribute("mode","new");

        return "contactView";
    }

    @PostMapping("/write")
    public String write(ContactDto contactDto, HttpSession session, RedirectAttributes redirectAttributes, HttpServletRequest request){
        if(!loginCehck(request)){
            return "redirect:/login/login?toURL=" + request.getRequestURL();
        }

        String writer = (String)session.getAttribute("id");
        contactDto.setWriter(writer);
        System.out.println(contactDto);

        try {
            if(contactService.write(contactDto) != 1)
                throw new Exception("write failed");

            redirectAttributes.addFlashAttribute("msg","WRT_OK");
            return "redirect:/contact/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "contactView";
        }
    }

    @GetMapping("/read")
    public String read(Integer bno, Model model, HttpSession session, RedirectAttributes redirectAttributes, SearchCondition sc) throws Exception {
        try{
            String id = (String)session.getAttribute("id");

            User user = memberService.getUser(id);

            ContactDto contactDto = contactService.read(bno);
            model.addAttribute(contactDto);

            if(id == null){
                redirectAttributes.addFlashAttribute("msg","AUTH_NULL");
                return "redirect:/contact/list" + sc.getQueryString();
            }

            if(!contactDto.getWriter().equals(id) && !user.getRoles().equals("MANAGER")){
                redirectAttributes.addFlashAttribute("msg","AUTH_ERR");
                return "redirect:/contact/list" + sc.getQueryString();
            }


        }catch (Exception e){
            e.printStackTrace();
//            return "redirect:/contact/list"+sc.getQueryString();
        }
        return "contactView";
    }

    @PostMapping("/modify")
    public String modify(ContactDto contactDto, SearchCondition sc, Model model, RedirectAttributes redirectAttributes){
        try{
            if(contactService.modify(contactDto) != 1)
                throw new Exception("modify failed");

            redirectAttributes.addFlashAttribute("msg", "MODIFY_OK");
            return "redirect:/contact/list" + sc.getQueryString();

        } catch (Exception e){
            e.printStackTrace();
            model.addAttribute(contactDto);
            model.addAttribute("msg", "MODIFY_ERR");
            return "contactView";
        }
    }

    @PostMapping("/remove")
    public String remove(Integer bno, SearchCondition sc, Model model, RedirectAttributes redirectAttributes){
        String msg = "DELETE_OK";
        try{
            if(contactService.remove(bno) != 1)
                throw new Exception("remove failed");

        } catch (Exception e){
            e.printStackTrace();
            msg = "DELETE_ERR";
        }
        redirectAttributes.addFlashAttribute("msg", msg);
        return "redirect:/contact/list" + sc.getQueryString();
    }



    private boolean loginCehck(HttpServletRequest request) {
        // 1. 세션을 얻어서(false는 session이 없어도 새로 생성하지 않는다. 반환값 null)
        HttpSession session = request.getSession(false);
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session!=null && session.getAttribute("id")!=null;
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
