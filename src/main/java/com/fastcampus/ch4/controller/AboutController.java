package com.fastcampus.ch4.controller;

import com.fastcampus.ch4.domain.PersonDto;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Arrays;
import java.util.List;

@Controller
public class AboutController {

    @GetMapping("about")
    public String about(){
        return "about";
    }

    @GetMapping("about/person/{id}")
    public ResponseEntity<PersonDto> getPerson(@PathVariable int id){
         final List<PersonDto> personList = Arrays.asList(
                new PersonDto("Alan Worker","대표이사/부문장","aaa@aaa.com","상남시 의료원 추가공사 \n 창주대학교 글로벌 스포츠 교육센터", "abcd대학 건축공학과 졸업 \n edaf대학원 건축공학과 졸업", "건축사 \n 건설사업전문관리사"),
                new PersonDto("Blan Worker","상무/본부장","bbb@bbb.com","상남시 의료원 추가공사 \n 창주대학교 글로벌 스포츠 교육센터", "abcd대학 건축공학과 졸업 \n edaf대학원 건축공학과 졸업", "건축사 \n 건설사업전문관리사"),
                new PersonDto("Clan Worker","부사장/기획부장","ccc@ccc.com","상남시 의료원 추가공사 \n 창주대학교 글로벌 스포츠 교육센터", "abcd대학 건축공학과 졸업 \n edaf대학원 건축공학과 졸업", "건축사 \n 건설사업전문관리사"),
                new PersonDto("Cute Baby","귀요미 담당","ddd@ddd.com","상남시 의료원 추가공사 \n 창주대학교 글로벌 스포츠 교육센터", "abcd대학 건축공학과 졸업 \n edaf대학원 건축공학과 졸업", "건축사 \n 건설사업전문관리사")
        );
         return ResponseEntity.ok(personList.get(id));
    }
}
