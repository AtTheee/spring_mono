<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-05-11
  Time: 오전 5:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="bno" value="${param.bno}"/>
<c:set var="loginId" value="${empty sessionScope.id ? '' : sessionScope.id}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Mono</title>
    <!-- script -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/5270e3d1c1.js" crossorigin="anonymous"></script>
    <!-- font -->
    <link rel="stylesheet" href="https://webfontworld.github.io/NexonLv1Gothic/NexonLv1Gothic.css"/>

    <link rel="stylesheet" href="${path}/css/reset.css"/>
    <link rel="stylesheet" href="${path}/css/contactView.css"/>
</head>
<body>
<header>
    <img src="${path}/img/header_bg6.jpg" alt=""/>
</header>
<%@include file="nav.jsp" %>
<main>
    <div class="contact_board_wrap">
        <form id="form" action="">
            <h2>건축문의</h2>
            <div class="contact_input_wrap">
                <div class="input_list">
                    <div class="list_L">
                        <div class="input_list_item">
                            <input type="hidden" name="bno" id="bno" value="${bno}">
                            <table>
                                <th>제목</th>
                                <td><input type="text" name="title" id="title" value="${contactDto.title}"/></td>
                            </table>
                        </div>
                    </div>
                    <div class="list_R">
                        <div class="input_list_item">
                            <table>
                                <th>건축시기</th>
                                <td>
                                    <select name="construct_date" id="construct_date">
                                        <option value="">시기선택</option>
                                        <option value="바로시공" ${contactDto.construct_date == '바로시공' ? 'selected' : ''}>
                                            바로시공
                                        </option>
                                        <option value="1년이내" ${contactDto.construct_date == '1년이내' ? 'selected' : ''}>
                                            1년이내
                                        </option>
                                        <option value="2년이내" ${contactDto.construct_date == '2년이내' ? 'selected' : ''}>
                                            2년이내
                                        </option>
                                        <option value="2년이후" ${contactDto.construct_date == '2년이후' ? 'selected' : ''}>
                                            2년이후
                                        </option>
                                    </select>
                                </td>
                            </table>
                        </div>
                        <div class="input_list_item">
                            <table>
                                <th>예상평수</th>
                                <td>
                                    <select name="area" id="area">
                                        <option value="">평수선택</option>
                                        <option value="30평대" ${contactDto.area == '30평대' ? 'selected' : ''}>30평대
                                        </option>
                                        <option value="40평대" ${contactDto.area == '40평대' ? 'selected' : ''}>40평대
                                        </option>
                                        <option value="50평대" ${contactDto.area == '50평대' ? 'selected' : ''}>50평대
                                        </option>
                                        <option value="60평대이상" ${contactDto.area == '60평대이상' ? 'selected' : ''}>60평대이상
                                        </option>
                                    </select>
                                </td>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="input_list">
                    <div class="input_list_item">
                        <table>
                            <th>건축예정지</th>
                            <td class="radio_td">
                                <label for="서울"> <input type="radio" id="서울" value="서울"
                                                        name="address" ${contactDto.address == '서울' ? 'checked' : ''}/>서울</label>
                                <label for="경기도"> <input type="radio" id="경기도" value="경기도"
                                                         name="address" ${contactDto.address == '경기도' ? 'checked' : ''}/>경기도</label>
                                <label for="인천"> <input type="radio" id="인천" value="인천"
                                                        name="address" ${contactDto.address == '인천' ? 'checked' : ''}/>인천</label>
                                <label for="충청도"> <input type="radio" id="충청도" value="충청도"
                                                         name="address" ${contactDto.address == '충청도' ? 'checked' : ''}/>충청도</label>
                                <label for="강원도"> <input type="radio" id="강원도" value="강원도"
                                                         name="address" ${contactDto.address == '강원도' ? 'checked' : ''}/>강원도</label>
                                <label for="전라도"> <input type="radio" id="전라도" value="전라도"
                                                         name="address" ${contactDto.address == '전라도' ? 'checked' : ''} />전라도</label>
                                <label for="경상도"> <input type="radio" id="경상도" value="경상도"
                                                         name="address" ${contactDto.address == '경상도' ? 'checked' : ''}/>경상도</label>
                                <label for="제주도"> <input type="radio" id="제주도" value="제주도"
                                                         name="address" ${contactDto.address == '제주도' ? 'checked' : ''}/>제주도</label>
                                <label for="기타"> <input type="radio" id="기타" value="기타"
                                                        name="address" ${contactDto.address == '기타' ? 'checked' : ''}/>기타</label>
                            </td>
                        </table>
                    </div>
                </div>
                <div class="input_list contents">
                    <div class="input_list_item">
                        <textarea name="contents" id="contents">${contactDto.contents}</textarea>
                    </div>
                </div>
            </div>
            <div class="contact_board_button">
                <c:if test="${mode eq 'new'}">
                    <button type="button" class="btn" id="writeBtn">문의하기</button>
                </c:if>
                <c:if test="${mode ne 'new'}">
                    <button type="button" class="btn" id="modifyBtn">수정하기</button>
                    <button type="button" class="sub_btn" id="removeBtn">삭제</button>
                </c:if>
                <button type="button" class="sub_btn" id="listBtn">목록</button>
            </div>
        </form>
        <c:if test="${mode ne 'new'}">
            <div class="contact_comment_wrap">
                <div class="commentBox">
                    <textarea name="comment" id="comment"></textarea>
                    <button id="commentBtn" type="button">댓글 등록</button>
                </div>
                <div class="comment_list_wrap">

                </div>
            </div>
        </c:if>
    </div>
</main>
<%@include file="footer.jsp" %>

<script>
    let msg = '${msg}';
    let mode = '${mode}'
    if (msg == 'MODIFY_ERR') alert("게시물 수정에 실패했습니다. 다시 시도해주세요");

    let bno
    let path = '${path}';
    if(mode != "new"){
        bno = '${bno}';
    }
    let loginId ='${loginId}';

    console.log(bno)

    $(document).ready(function () {

        if(mode != "new"){

            showList(bno);
        }

        function fCheck() {
            let f = document.getElementById("form");
            if (f.title.value.trim().length == 0) {
                console.log(f.address.value)
                alert("제목을 입력해주세요.")
                return false;
            }

            if (f.construct_date.value == "") {
                alert("건축시기를 선택해주세요.")
                return false;
            }

            if (f.area.value == "") {
                alert("예상평수를 선택해주세요.")
                return false;
            }

            if (f.address.value == "") {
                alert("건축예정지를 선택해주세요.")
                return false;
            }

            if (f.contents.value.trim().length == 0) {
                alert("내용을 입력해주세요.")
                return false;
            }
            return true;
        }

        $("#writeBtn").on('click', function () {
            if (!fCheck()) {
                return false;
            }

            let form = $("#form");
            form.attr("action", "<c:url value='/contact/write'/>");
            form.attr("method", "post");
            form.submit();
        })

        $("#listBtn").on("click", function () {
            <%--location.href = "<c:url value='/contact/list${searchCondition.queryString}'/>";--%>
            history.back();
        });

        $("#modifyBtn").on("click", function () {
            let form = $("#form");
            form.attr("action", "<c:url value="/contact/modify${searchCondition.queryString}"/>");
            form.attr("method", "post");
            form.submit();
        })

        $("#removeBtn").on("click", function () {
            if (!confirm("정말로 삭제하시겠습니까?")) return;

            let form = $("#form");
            form.attr("action", "<c:url value="/contact/remove${searchCondition.queryString}"/>");
            form.attr("method", "post");
            form.submit();
        })

        $(".comment_list_wrap").on("click", ".reply_link", function (e) {
            e.preventDefault() // 기본 이벤트를 막습니다.

            // 클릭된 링크에 대한 가장 가까운 '.comment_list'를 찾고, 그 내부의 '.reCommentBox' 토글
            $(this).closest(".comment_list").find(".reCommentBox").toggle()
        })

        $("#commentBtn").on('click',function (){
            let comment =  $("textarea[name=comment]").val();

            if(comment.trim() == ''){
                alert("댓글 내용을 입력해주세요.");
                $("textarea[name=comment]").focus();
                return;
            }

            $.ajax({
                type:'POST',
                url: path + '/comments?bno='+ bno,
                headers: {"content-type":"application/json"},
                data: JSON.stringify({bno: bno, comment: comment}),
                success : function(result){
                    alert(result);
                    $("textarea[name=comment]").val("")
                    showList(bno); // 댓글 달고 갱신하고 목록 보여줌
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            })
        })

        $(".comment_list_wrap").on('click',"#reCommentBtn",function (){
            let commentBox = $(this).closest(".commentBox");
            let comment =  commentBox.find("textarea[name='reComment']").val();
            let pcno = $(this).closest(".comment_list").attr("data-cno");

            console.log(pcno);
            if(comment.trim() == ''){
                alert("답글 내용을 입력해주세요.");
                commentBox.find("textarea[name='reComment']").focus();
                return;
            }

            $.ajax({
                type:'POST',
                url:path +'/comments/?bno=' + bno,
                headers: {"content-type":"application/json"},
                data: JSON.stringify({bno: bno, pcno:pcno, comment:comment}),
                success : function(result){
                    alert(result);
                    showList(bno); // 댓글 달고 갱신하고 목록 보여줌
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            })

        })

        $(".comment_list_wrap").on('click',"#commentModifyBtn",function (){
            const contents = $(this).siblings(".contents");
            $(this).text("수정하기").addClass("editing")
            $(this).siblings("#commentCancelBtn").show()
            if (!contents.data('origin') && contents.data('origin') !== contents.val()) {
                contents.data('origin', contents.val());
            }
            contents.prop("readonly", false)
        })

        $(".comment_list_wrap").on('click',"#commentCancelBtn",function (){
            const contents = $(this).siblings(".contents");
            $(this).siblings("#commentModifyBtn").text("수정").removeClass("editing")
            $(this).hide()
            contents.prop("readonly", true)
            contents.val(contents.data('origin'))
        })


        $(".comment_list_wrap").on('click','.editing',function (){
            let comment = $(this).closest('.comment_list').find('.contents').val();
            let cno = $(this).closest('.comment_list').attr('data-cno');

            $.ajax({
                type:'PATCH',
                url: path + "/comments/" + cno,
                headers:{"content-type":"application/json"},
                data:JSON.stringify({cno,cno, comment:comment}),
                success : function(result){
                    alert(result);
                    showList(bno); // 댓글 달고 갱신하고 목록 보여줌
                },
                error   : function(){
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            })

        })

        $(".comment_list_wrap").on('click','#commentDeleteBtn', function (){
            let cno = $(this).closest('.comment_list').attr('data-cno');

            if(!confirm("댓글을 삭제하시겠습니까?")) return;

            $.ajax({
                type:"DELETE",
                url: path + "/comments/" + cno +"?bno=" + bno,
                headers: {"content-type":"application/json"},
                data:JSON.stringify({cno: cno, bno: bno}),
                success : function(result){
                    alert(result);
                    showList();
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            })

        })

    })

    function showList(){
        $.ajax({ // 댓글목록 가져오기
            type:'GET',       // 요청 메서드
            url: path + '/comments?bno='+ bno, // 요청 URI
            // dataType : 'text', // 전송받을 데이터의 타입 //생략하면 기본이 JSON
            success : function(result){
                $(".comment_list_wrap").html(toHtml(result));  //  가져온 댓글 목록 넣기
                applyAutoResize();
            },
            error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    }

    function autoResize() {
        $(this).height('auto');
        $(this).height($(this)[0].scrollHeight);
    }

    function applyAutoResize() {
        $('.contents').each(function () {
            autoResize.call(this);
        });
    }

    function toHtml(comments){
        let html = '';

        comments.forEach(function (comment){
            if(comment.cno != comment.pcno){
                html += '<div class="comment_list reComment_list" data-cno=' + comment.cno + '>';
                html += ' <span>└</span>'
                html += ' <span class = "name">' + comment.commenter + '</span>';
                html += ' <span class = "date">' + comment.format_reg_date + '</span>';

                if(comment.commenter == loginId){

                    html += ' <button type="button" id="commentModifyBtn">수정</button>';
                    html += ' <button type="button" id="commentCancelBtn" hidden>취소</button>'
                    html += ' <button type="button" id="commentDeleteBtn">삭제</button>';
                }

                html += ' <textarea class="contents" readonly>' + comment.comment + '</textarea>'; // 댓글 내용
                html += '</div>';
            } else{
                html += '<div class="comment_list" data-cno=' + comment.cno + '>';
                if(comment.comment == ""){
                    html += '<p> 삭제된 댓글입니다. </p>'
                } else{

                    html += ' <span class = "name">' + comment.commenter + '</span>';
                    html += ' <span class = "date">' + comment.format_reg_date + '</span>';

                    if(comment.commenter == loginId){
                        html += ' <button type="button" id="commentModifyBtn">수정</button>';
                        html += ' <button type="button" id="commentCancelBtn" hidden>취소</button>'
                        html += ' <button type="button" id="commentDeleteBtn">삭제</button>';
                    }

                    html += ' <textarea class="contents" readonly>' + comment.comment + '</textarea>'; // 댓글 내용
                    html += ' <span><a href="" class="reply_link">답글</a></span>';
                }

                // 답글 입력창은 숨겨진 상태로 시작하고, '답글' 링크 클릭 시 표시
                html += '  <div class="reCommentBox commentBox" style="display:none;">';
                html += '    <textarea name="reComment" id="reComment"></textarea>';
                html += '    <button id="reCommentBtn" type="button">답글 등록</button>';
                html += ' </div>';
                html += '</div>';

            }

        })

        return html;
    }

</script>
</body>
</html>

