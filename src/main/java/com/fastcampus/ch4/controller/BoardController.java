package com.fastcampus.ch4.controller;

import com.fastcampus.ch4.domain.*;
import com.fastcampus.ch4.service.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.*;

import javax.servlet.http.*;
import java.time.*;
import java.util.*;

@Controller
@RequestMapping("/board")
public class BoardController {
//    @Autowired
//    BoardService boardService;

    private final BoardService boardService;

    public BoardController(BoardService boardService){
        this.boardService = boardService;
    }

    @PostMapping("/modify")
    public String modify(BoardDto boardDto, SearchCondition sc, RedirectAttributes rattr, Model m, HttpSession session) {
        String writer = (String)session.getAttribute("id");
        boardDto.setWriter(writer);

        try {
            if (boardService.modify(boardDto)!= 1)
                throw new Exception("Modify failed.");

            rattr.addFlashAttribute("msg", "MOD_OK");
            return "redirect:/board/list"+sc.getQueryString();
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(boardDto);
            m.addAttribute("msg", "MOD_ERR");
            return "board";
        }
    }

    @PostMapping("/remove")
    public String remove(Integer bno, SearchCondition sc, RedirectAttributes rattr, HttpSession session) {
        String writer = (String)session.getAttribute("id");
        String msg = "DEL_OK";

        try {
            if(boardService.remove(bno, writer)!=1)
                throw new Exception("Delete failed.");
        } catch (Exception e) {
            e.printStackTrace();
            msg = "DEL_ERR";
        }

        rattr.addFlashAttribute("msg", msg);
        return "redirect:/board/list"+sc.getQueryString();
    }

    @GetMapping("/write")
    public String write(Model m) {
        m.addAttribute("mode", "new");

        return "board";
    }

    @PostMapping("/write")
    public String write(BoardDto boardDto, RedirectAttributes rattr, Model m, HttpSession session) {
        String writer = (String)session.getAttribute("id");
        boardDto.setWriter(writer);

        try {
            if (boardService.write(boardDto) != 1) // 성공하면 1 반환 (성공적으로 하나의 행 추가)
                throw new Exception("Write failed.");
            rattr.addFlashAttribute("msg", "WRT_OK"); // 모델과 달리 한번 전달하고 없앰
            return "redirect:/board/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(boardDto);
            m.addAttribute("mode", "new");
            m.addAttribute("msg", "WRT_ERR");
            return "board";
        }
    }

    @GetMapping("/read")
    public String read(Integer bno, SearchCondition sc, RedirectAttributes rattr, Model m) {
        try {
            BoardDto boardDto = boardService.read(bno);
            m.addAttribute(boardDto);
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "READ_ERR");
            return "redirect:/board/list"+sc.getQueryString();
        }

        return "board";
    }

    @GetMapping("/list")   // @ModelAttribute 자동으로 붙음 (SETTER, GETTER가 있는 클래스 객체 자동 생성 - 자동 바인딩) // 그래서 searchCondition으로 쓸 수 있다. (첫 글자만 소문자인 이름으로 객체 생성)
    public String list(Model m, SearchCondition sc, HttpServletRequest request) {
        if(!loginCheck(request)){
//            System.out.println("request.getRequestURL() = " + request.getRequestURL()); //http://localhost/ch4/board/list = 로그인하고 다시 돌아가야되는 페이지
            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동
        }

        try {
            // sc의 keyword의 초기값이 ''이므로 모든 게시물의 개수를 count하게 된다.
            int totalCnt = boardService.getSearchResultCnt(sc); // 총 게시물 개수
            m.addAttribute("totalCnt", totalCnt);

            // paging (몇 페이지를 어떻게 나타낼까? 정도..?)
            PageHandler pageHandler = new PageHandler(totalCnt, sc);

            List<BoardDto> list = boardService.getSearchResultPage(sc); // 게시글 리스트
            m.addAttribute("list", list);
            m.addAttribute("ph", pageHandler);

            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant(); // 오늘의 자정 시간
            m.addAttribute("startOfToday", startOfToday.toEpochMilli());
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "LIST_ERR");
            m.addAttribute("totalCnt", 0);
        }

        return "boardList"; // 로그인을 한 상태이면, 게시판 화면으로 이동
    }

    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서(false는 session이 없어도 새로 생성하지 않는다. 반환값 null)
        HttpSession session = request.getSession(false);
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session!=null && session.getAttribute("id")!=null;
    }
}