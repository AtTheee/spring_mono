package com.fastcampus.ch4.controller;

import com.fastcampus.ch4.domain.CommentDto;
import com.fastcampus.ch4.service.CommentService;
import org.checkerframework.checker.units.qual.K;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

//@Controller
//@ResponseBody
@RestController
public class CommentController {
//    @Autowired
//    CommentService commentService;

    private final CommentService commentService;

    public CommentController(CommentService commentService){
        this.commentService = commentService;
    }

    // 댓글을 수정하는 메서드
//    @ResponseBody
    @PatchMapping("/comments/{cno}")
    public ResponseEntity<String> modify(@PathVariable Integer cno, @RequestBody CommentDto commentDto, HttpSession session) {
                String commenter = (String) session.getAttribute("id");

        commentDto.setCommenter(commenter);
        commentDto.setCno(cno);
        System.out.println("dto = " + commentDto);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.TEXT_PLAIN); // 텍스트 응답임을 명시
        headers.set(HttpHeaders.CONTENT_TYPE, MediaType.TEXT_PLAIN_VALUE + ";charset=UTF-8"); // 헤더에 인코딩 타입 명시

        try {
            if (commentService.modify(commentDto) != 1) {
                throw new Exception("Write failed.");
            }
            return new ResponseEntity<>("성공적으로 댓글을 수정하였습니다.", headers, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("댓글 수정에 실패하였습니다. 다시 시도해주세요.", headers , HttpStatus.BAD_REQUEST);
        }
    }


    // 테스트하려면 POSTMAN 사이트에서 POST로 url에 http://localhost/ch4/comments/?bno=658 치고 header에 Content-Type / application/json raw에
    // {
    //"pcno":0,
    //"comment" : "hi"
    //} 치고 send 하면 됨
    // 댓글을 등록하는 메서드
//    @ResponseBody
    @PostMapping("/comments")
    public ResponseEntity<String> write(@RequestBody CommentDto dto, HttpSession session) {
        String commenter = (String) session.getAttribute("id");
//        String commenter = "asdf";
        dto.setCommenter(commenter);

//        dto.setBno(bno);
//        System.out.println("dto = " + dto);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.TEXT_PLAIN); // 텍스트 응답임을 명시
        headers.set(HttpHeaders.CONTENT_TYPE, MediaType.TEXT_PLAIN_VALUE + ";charset=UTF-8"); // 헤더에 인코딩 타입 명시

        try {
            if (commentService.write(dto) != 1) {
                throw new Exception("Write failed.");
            }
            return new ResponseEntity<>("성공적으로 댓글이 등록되었습니다", headers, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("댓글 등록에 실패하였습니다. 다시 시도해주세요.", headers, HttpStatus.BAD_REQUEST);
        }
    }

    // 지정된 댓글을 삭제하는 메서드
//    @ResponseBody
    @DeleteMapping("/comments/{cno}") // comments/1?bno=1042 - URI에 들어온 1이 매개면수 cno의 값으로 들어감(@PathVariable 붙이면)
    public ResponseEntity<String> remove(@PathVariable Integer cno, Integer bno, HttpSession session) throws Exception {
        String commenter = (String) session.getAttribute("id");
//        String commenter = "asdf"; // 로그인을 안하니 지금 하드코딩

        CommentDto commentDto = commentService.read(cno);
//        System.out.println(commentDto);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.TEXT_PLAIN); // 텍스트 응답임을 명시
        headers.set(HttpHeaders.CONTENT_TYPE, MediaType.TEXT_PLAIN_VALUE + ";charset=UTF-8"); // 헤더에 인코딩 타입 명시

        try {
//            int rowCnt = service.remove(cno, bno, commenter);

            if(commentService.countByPcno(cno) > 0){
                commentDto.setComment("");
                commentService.modify(commentDto);
            } else{
                if (commentService.remove(cno, bno, commenter) != 1)
                    throw new Exception("Delete Failed");

                if(commentDto.getPcno() != null && commentService.countByPcno(commentDto.getPcno()) == 0){
                   if(commentService.read(commentDto.getPcno()).getComment().equals("")){
                       if (commentService.removePcno(commentDto.getPcno(), bno) != 1)
                           throw new Exception("Delete Failed");
                   }
                }
            }

            return new ResponseEntity<>("성공적으로 댓글이 삭제되었습니다.", headers, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("댓글 삭제에 실패하였습니다. 다시 시도해주세요.", headers, HttpStatus.BAD_REQUEST);
        }
    }

    // 지정된 게시물의 모든 댓글을 가져오는 메서드
//    @ResponseBody // 안붙이면 return list가 view로 해석됨
    @GetMapping("/comments")
    public ResponseEntity<List<CommentDto>> list(Integer bno) {
        List<CommentDto> list = null;
        try {
             list = commentService.getList(bno);
             list = formmat(list);
            return new ResponseEntity<List<CommentDto>>(list, HttpStatus.OK); // 상태코드 추가해서 보내줌 (200)
            // 엔티티 - 우리가 보내려는 내용
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<CommentDto>>(HttpStatus.BAD_REQUEST); // 400

        }
    }
    
    List<CommentDto> formmat(List<CommentDto> list){
        list.forEach(dto -> {dto.setFormat_reg_date(dto.formatDate(dto.getReg_date()));});
        return list;
    }
}
