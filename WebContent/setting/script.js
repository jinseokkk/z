function logincheck() { // 로그인 유효성 검사
	if (document.login.mem_email.value == "") {
		alert("이메일을 입력하세요");
		document.login.mem_email.focus();
		return;
	}
	var str = document.login.mem_email.value;
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if (regExp.test(str))
		;
	else {
		alert('E-mail주소 형식이 잘못되었습니다.\n\r 다시 입력해 주세요!');
		document.login.mem_email.focus();
		return;
	}
	if (document.login.mem_pw.value == "") {
		alert("비밀번호를 입력하세요");
		document.login.mem_pw.focus();
		return;
	}
	
	document.login.submit();
}

function signupcheck() { // 회원가입 유효성 검사
	if (document.signup.mem_id.value == "") {
		alert("이름을 입력하세요");
		document.signup.mem_id.focus();
		return;
	}
	if (document.signup.mem_email.value == "") {
		alert("이메일을 입력하세요");
		document.signup.mem_email.focus();
		return;
	}
	if (document.signup.mem_pw.value == "") {
		alert("비밀번호를 입력하세요");
		document.signup.mem_pw.focus();
		return;
	}
	if (document.signup.mem_repw.value == "") {
		alert("비밀번호를 확인하세요");
		document.signup.mem_repw.focus();
		return;
	}
	if (document.signup.mem_repw.value != document.signup.mem_pw.value) {
		alert("비밀번호가 일치하지 않습니다");
		document.signup.mem_repw.focus();
		return;
	}
	var str = document.signup.mem_email.value;
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if (regExp.test(str))
		;
	else {
		alert('E-mail주소 형식이 잘못되었습니다.\n\r 다시 입력해 주세요!');
		document.signup.mem_email.focus();
		return;
	}
	
	if (document.signup.mem_type.value == "") {
		alert("가입유형을 체크해주세요");
		document.signup.mem_type.focus();
		return;
	}
	document.signup.submit();
}

function signup_go() { // 회원가입페이지로 이동
	document.location = "/z/signup/signup.jsp";
}

function productinsert_go() {
	document.location = "/z/signup/signup.jsp";
}

function productUpdate(no) {
	document.update.no.value = no;
	document.update.submit();
}

function productDelete(no) {
	document.del.no.value = no;
	document.del.submit();
}

function productdetail(no) {
	document.detail.no.value = no;
	document.detail.submit();
}
