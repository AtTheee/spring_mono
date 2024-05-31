# 프로젝트 소개

- 개인 프로젝트로 만들어 본 mono 건축사사무소(가상) 웹 사이트 입니다.
- 해당 건축사 사무소 회사 소개와 고객과의 상담, 회사내 프로젝트 게시 용도의 서비스를 제공합니다.

## 프로젝트 링크
- http://43.200.174.116:8080/mono/ (aws 무료 프리티어 사용중이라 기간이 만료되면 접속이 불가할 수 있습니다.)
- 관리자 id : 관리자, pw : asdf

## 개발환경 및 사용기술
- IDE : IntelliJ Ultimate
- Language : Java
- Framework : Spring Framework 5.0.7
- server : Apache Tomcat 9.0.76 , AWS EC2
- Build : Maven
- DB : MySQL
- API : KAKAO MAP API, JQuery

## 데이터베이스 구조
<table>
  <tr>
    <td>user_info</td>
    <td>사용자 정보 관리</td>
  </tr>
   <tr>
    <td>contact</td>
    <td>contact 게시글 관리</td>
  </tr>
   <tr>
    <td>comment</td>
    <td>댓글 관리</td>
  </tr>
   <tr>
    <td>gallery</td>
    <td>프로젝트 게시글 관리</td>
  </tr>
  <tr>
    <td>img_file</td>
    <td>프로젝트 이미지 관리</td>
  </tr>
</table>

## 주요 기능
- 이메일 인증을 통한 회원가입으로 로그인 후 contact 게시판에 상담글을 작성할 수 있다.
- 본인 글만 열람이 가능하며(관리자는 모두 열람 가능) 추가 질문과 답변을 얻을 수 있는 댓글과 답글 기능이 있다.
- 본인 글과 댓글은 CRUD가 가능하다.
- 프로젝트 게시판은 관리자만 CRUD가 가능하다.
- 프로젝트는 제목, 설명을 포함한 다수의 이미지 파일 첨부가 가능하다.
- 마이페이지로 가면 본인 글만 확인할 수 있으며(내 게시글 확인), 회원 정보 수정과 탈퇴가 가능하다.

## 실제 서비스 화면
![mono1](https://github.com/AtTheee/spring_mono/assets/139583539/1ccf8e12-9971-477e-a982-8393ce354a4c)
![mono2](https://github.com/AtTheee/spring_mono/assets/139583539/1b419b8f-b240-46dc-bd38-215968903648)
![mono3](https://github.com/AtTheee/spring_mono/assets/139583539/0b937af4-dbf8-47d4-bb12-460fe66719bc)
![mono4](https://github.com/AtTheee/spring_mono/assets/139583539/1b93ee5f-4e2c-4f4e-a689-01ea00879453)
