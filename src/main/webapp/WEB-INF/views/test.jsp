<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<h2>CommentTest</h2>
comment: <input type="text" name="comment"><br>
<button id="sendBtn" type="button">SEND</button>
<button id="modBtn" type="button">수정</button>


<div id="commentList"></div>
<div id="replyForm" style="display:none">
    <input type="text" name="replyComment">
    <button id="wrtReBtn" type="button">등록</button>
</div>
<script>
    let bno = 658;

    let showList = function () {
        $.ajax({ // 댓글목록 가져오기
            type:'GET',       // 요청 메서드
            url: '/ch4/comments?bno=' + bno,  // 요청 URI
            // dataType : 'text', // 전송받을 데이터의 타입 //생략하면 기본이 JSON
            success : function(result){
                $("#commentList").html(toHtml(result));  //  가져온 댓글 목록을 commentList에 넣기
            },
            error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    };

    // 댓글 쓰기
    $(document).ready(function(){
        showList(bno); // 댓글 다 보여주기

        $("#modBtn").click(function(){
            let comment = $("input[name=comment]").val();
            let cno = $(this).attr("data-cno");

            if (comment.trim() == '') {
                alert("댓글을 입력해주세요.");
                $("input[name=comment]").focus();
                return;
            }

            $.ajax({
                type:'PATCH',       // 요청 메서드
                url: '/ch4/comments/'+cno,  // 요청 URI
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({cno:cno, comment:comment}),  // json으로 데이터 전달하면 자바객체로 바껴서 컨트롤러의 매개변수로 들어감
                success : function(result){
                    alert(result);
                    showList(bno); // 댓글 달고 갱신하고 목록 보여줌
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

        $("#sendBtn").click(function(){
            let comment = $("input[name=comment]").val();

            if (comment.trim() == '') {
                alert("댓글을 입력해주세요.");
                $("input[name=comment]").focus();
                return;
            }

            $.ajax({
                type:'POST',       // 요청 메서드
                url: '/ch4/comments?bno='+bno,  // 요청 URI
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({bno:bno, comment:comment}),  // json으로 데이터 전달하면 자바객체로 바껴서 컨트롤러의 매개변수로 들어감
                success : function(result){
                    alert(result);
                    showList(bno); // 댓글 달고 갱신하고 목록 보여줌
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

        // 수정 버튼 누르면
        $("#commentList").on("click",".modBtn",function() {
            let comment = $("span.comment", $(this).parent()).text(); // 수정 버튼의 부모 = li의 sapn태그중 클래스가 comment인것의 내용
            let cno = $(this).parent().attr("data-cno"); // $(this).parent() li 안에 있는 cno는 commentList의 부모의. attr() 속성을 들고와라

            // 1. comment의 내용을 input에 뿌려주기
            $("input[name=comment]").val(comment);

            // 2. cno 전달하기
            $("#modBtn").attr("data-cno", cno); // modBtn에 속성 추가하기
        });

        // 답글 버튼 누르면 답글 달 수 있는 칸이 나오게
        $("#commentList").on("click", ".replyBtn", function () {
            // 1. replyForm을 옮기고
            $("#replyForm").appendTo($(this).parent()) // 답글버튼의 부모인 li의 맨 뒤에 붙임

            // 2. 답글을 입력할 폼을 보여줌
            $("#replyForm").css("display", "block");
        });

        // 답글 등록 버튼 누르면
        $("#wrtReBtn").click(function(){
            let comment = $("input[name=replyComment]").val();
            let pcno = $("#replyForm").parent().attr("data-pcno"); //

            if (comment.trim() == '') {
                alert("댓글을 입력해주세요.");
                $("input[name=replyComment]").focus();
                return;
            }

            $.ajax({
                type:'POST',       // 요청 메서드
                url: '/ch4/comments?bno='+bno,  // 요청 URI
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({pcno:pcno, bno:bno, comment:comment}),  // json으로 데이터 전달하면 자바객체로 바껴서 컨트롤러의 매개변수로 들어감
                success : function(result){
                    alert(result);
                    showList(bno); // 댓글 달고 갱신하고 목록 보여줌
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

            // 댓글 등록하면 칸이 다시 안보이게
            $("#replyForm").css("diplay", "none");
            $("input[name=replyComment]").val(''); // 댓글 입력 칸 빈칸으로
            $("#replyForm").appendTo("body"); // 원래 있던 자리로 돌려보냄

        });

            // 댓글 삭제 버튼 누르면 삭제되게
        // $("#sendBtn").click(function(){ // 이렇게 하면 send 버튼 누르기 전에 삭제 버튼이 없어서 이벤트가 안걸림
        $("#commentList").on("click",".delBtn",function(){
            let cno = $(this).parent().attr("data-cno"); // $(this).parent() li 안에 있는 cno는 commentList의 부모의. attr() 속성을 들고와라
            let bno = $(this).parent().attr("data-bno");

            $.ajax({ // 댓글목록 가져오기
                type:'DELETE',       // 요청 메서드
                url: '/ch4/comments/'+ cno + '?bno=' + bno,  // 요청 URI
                // dataType : 'text', // 전송받을 데이터의 타입 //생략하면 기본이 JSON
                success : function(result){
                    alert(result);
                    showList();
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });
    });

    let toHtml = function (comments) {
        let tmp = "<ul>";

        comments.forEach(function (comment) {
            tmp += '<li data-cno=' + comment.cno
            tmp += ' data-pcno=' + comment.pcno
            tmp += ' data-bno=' + comment.bno + '>'
            if(comment.cno != comment.pcno)
                tmp +='ㄴ'
            tmp += ' commenter = <span class = "commenter">' + comment.commenter + '</span>'
            tmp += ' comment = <span class="comment">' + comment.comment + '</span>'
            tmp += ' up_date=' + comment.up_date
            tmp += '<button class="delBtn">삭제</button>'
            tmp += '<button class="modBtn">수정</button>'
            tmp += '<button class="replyBtn">답글</button>'
            tmp += '</li>'
        });

        return tmp + "</ul>";
    };
</script>
</body>
</html>
