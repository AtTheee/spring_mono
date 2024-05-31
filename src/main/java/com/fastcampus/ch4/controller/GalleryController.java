package com.fastcampus.ch4.controller;


import com.fastcampus.ch4.domain.*;
import com.fastcampus.ch4.service.GalleryService;
import com.fastcampus.ch4.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/gallery")
public class GalleryController {

    @Autowired
    GalleryService galleryService;

    @Autowired
    MemberService memberService;

    private String rootPath = "/images";

    @GetMapping("/list")
    public String list(SearchCondition sc, Model model, HttpSession session) throws Exception{
        try{
//            System.out.println(sc);
            // 프로젝트 게시판 리스트에서는 각 게시글 별 이미지가 하나씩 필요하니께.
            List<ImgFileDto> list = galleryService.searchSelectList(sc);
            model.addAttribute("list", list);

            List<String> titleList = galleryService.searchSelectTitleList(sc);

            model.addAttribute("titleList", titleList);

            model.addAttribute("rootPath", rootPath);

            int totalCnt = galleryService.totalCnt();

            PageHandler pageHandler = new PageHandler(totalCnt, sc);
            model.addAttribute("ph",pageHandler);

            String id = (String) session.getAttribute("id");
            if(id != null && !id.isEmpty()){
                User user = memberService.getUser(id);
                model.addAttribute("role", user.getRoles());
            } else{
                model.addAttribute("role", "GUEST");
            }

        } catch (Exception e){
            e.printStackTrace();
        }
        return "gallery";
    }

    @GetMapping("/write")
    public String write(){
        return "galleryBoard";
    }

    @PostMapping("/write")
    public String write(@RequestParam("file_upload") MultipartFile files[], GalleryDto galleryDto, RedirectAttributes redirectAttributes, Model model) throws IOException {
        String rootPath = ("C:\\Gallery");
        String today = new SimpleDateFormat("yyMMdd").format(new Date());
        String saveFolder = rootPath + File.separator + today;
        File folder = new File(saveFolder);

        if(!folder.exists()) folder.mkdirs();

        List<ImgFileDto> imgFileDtos = new ArrayList<ImgFileDto>();

        for(MultipartFile file : files){
            ImgFileDto imgFileDto = new ImgFileDto();
            String origin_name = file.getOriginalFilename();

            String save_name = UUID.randomUUID().toString() + origin_name.substring(origin_name.lastIndexOf('.'));
            imgFileDto.setSave_folder(today);
            imgFileDto.setOrigin_name(origin_name);
            imgFileDto.setSave_name(save_name);

            file.transferTo(new File(folder, save_name));
            imgFileDtos.add(imgFileDto);
        }
        galleryDto.setImgFileDtos(imgFileDtos);

        try{
            if(galleryService.write(galleryDto) != 1)
                throw new Exception("write failed");

            System.out.println(galleryDto.getGno());
            redirectAttributes.addFlashAttribute("msg","WRT_OK");
            return "redirect:/gallery/list?pageSize=9";

        } catch (Exception e){
            e.printStackTrace();
            model.addAttribute("msg", "WRT_ERR");
            return "galleryBoard";
        }

    }

    @GetMapping("read")
    public String read(SearchCondition sc, Integer gno, Model model, HttpSession session) throws Exception {

        try{

            GalleryDto galleryDto = galleryService.read(gno);
            galleryDto.setGno(gno);
            model.addAttribute("galleryDto", galleryDto);

            List<ImgFileDto> imgList = galleryService.readFile(gno);
            model.addAttribute("imgList", imgList);

            model.addAttribute("rootPath", rootPath);

            String id = session.getAttribute("id").toString();
            if(id != null){
                User user = memberService.getUser(id);
                model.addAttribute("role", user.getRoles());
            } else{
                model.addAttribute("role", "GUEST");
            }

        } catch (Exception e){
            e.printStackTrace();
        }

        return "gallery_view";
    }

    @GetMapping("modify")
    public String modify(Integer gno, SearchCondition sc, Model model) throws Exception{

        try{

            GalleryDto galleryDto = galleryService.read(gno);
            galleryDto.setGno(gno);
            model.addAttribute("galleryDto", galleryDto);

            List<ImgFileDto> imgList = galleryService.readFile(gno);
            model.addAttribute("imgList", imgList);

            model.addAttribute("rootPath", rootPath);

            model.addAttribute("mode", "modify");

        } catch (Exception e){
            e.printStackTrace();
        }

        return "galleryBoard";
    }

    @PostMapping("modify")
    public String modify(GalleryDto galleryDto, SearchCondition sc , @RequestParam(required = false) List<String> existingImages , @RequestParam("file_upload") MultipartFile files[], RedirectAttributes redirectAttributes) throws Exception{
        try{
            List <ImgFileDto> existingImgList = galleryService.readFile(galleryDto.getGno());
            List <ImgFileDto> deleteImgList;

            // existingImages 리스트를 확인해서 기존 DB리스트와 확인해서 없으면 삭제
            if(existingImages != null){
                deleteImgList = existingImgList.stream()
                        .filter(img -> !existingImages.contains(String.valueOf(img.getFno())))
                        .collect(Collectors.toList());
                System.out.println("지워야 되는거 " + deleteImgList);
            } else{ // existingImages가 null이면 기존에 있던 이미지를 전부 지워야 한다.
                deleteImgList = existingImgList;
                System.out.println("지워야 되는거 " + deleteImgList);
            }

            // 지울 List가 비어있지 않으면 지움(비어있으면 지울게 없다.)
            if(!deleteImgList.isEmpty()){
                if(galleryService.deleteExistFile(deleteImgList) != deleteImgList.size())
                    throw new Exception("existingImage delete failed");
            }

            // 새로운 파일 추가하기 null 아니면

            if(files.length > 0){
                String rootPath = ("C:\\Gallery");
                String today = new SimpleDateFormat("yyMMdd").format(new Date());
                String saveFolder = rootPath + File.separator + today;
                File folder = new File(saveFolder);

                if(!folder.exists()) folder.mkdirs();

                List<ImgFileDto> imgFileDtos = new ArrayList<ImgFileDto>();

                for(MultipartFile file : files){
                    if(!file.isEmpty()){
                        ImgFileDto imgFileDto = new ImgFileDto();
                        String origin_name = file.getOriginalFilename();
                        String save_name;

                        if (origin_name != null && origin_name.contains(".")) {
                            save_name = UUID.randomUUID().toString() + origin_name.substring(origin_name.lastIndexOf('.'));
                        } else {
                            // 확장자가 없는 경우 처리
                            save_name = UUID.randomUUID().toString(); // 예시로 UUID를 그대로 사용
                        }

                        imgFileDto.setSave_folder(today);
                        imgFileDto.setOrigin_name(origin_name);
                        imgFileDto.setSave_name(save_name);

                        file.transferTo(new File(folder, save_name));
                        imgFileDtos.add(imgFileDto);
                    }
                }
                galleryDto.setImgFileDtos(imgFileDtos);
            }

            // gallery 수정

            if(galleryService.modify(galleryDto) != 1)
                throw new Exception("modify failed");

            redirectAttributes.addFlashAttribute("msg","MODIFY_OK");

        } catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg","MODIFY_ERR");
        }

        return "redirect:/gallery/read" + sc.getQueryString() + "&gno=" + galleryDto.getGno();

    }

    @PostMapping("delete")
    String delete(Integer gno, SearchCondition sc, RedirectAttributes redirectAttributes) throws Exception {

        try {
            if(galleryService.delete(gno) != 1)
                throw new Exception("delete Failed");

            redirectAttributes.addFlashAttribute("msg", "DELETE_OK");

        } catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg", "DELETE_ERR");
        }

        return "redirect:/gallery/list" + sc.getQueryString();
    }

}
