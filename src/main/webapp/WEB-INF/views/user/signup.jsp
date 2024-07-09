<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Golfro 회원가입</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">
<link
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    rel="stylesheet">
<style>
:root {
    --primary-color: #4CAF50;
    --secondary-color: #45a049;
    --background-color: #f8f9fa;
    --text-color: #333;
}

body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: var(--background-color);
    color: var(--text-color);
}

.navbar {
    background-color: var(--primary-color);
}

.navbar-brand, .nav-link {
    color: white !important;
}

.container {
    max-width: 600px;
    margin-top: 30px;
    background-color: white;
    border-radius: 10px;
    padding: 30px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

h4 {
    color: var(--primary-color);
    margin-bottom: 20px;
}

.form-control, .btn {
    border-radius: 5px;
    padding: 0.375rem 0.75rem;
}

.btn-primary {
    background-color: var(--primary-color);
    border-color: var(--primary-color);
}

.btn-primary:hover {
    background-color: var(--secondary-color);
    border-color: var(--secondary-color);
}

.form-group {
    margin-bottom: 15px;
}

.form-label {
    font-weight: bold;
    font-size: 0.9rem;
}

.flex {
    display: flex;
    gap: 10px;
    align-items: center;
}

#bank {
    flex: 1;
}

#accountNumber {
    flex: 2;
}
</style>
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="/gaebokchi">골프로</a>
            <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link"
                        href="/gaebokchi">메인</a></li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown"><a
                        class="nav-link dropdown-toggle" href="#"
                        id="navbarDropdown" role="button"
                        data-bs-toggle="dropdown"> 접속하기 </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item"
                                href="singin">로그인</a></li>
                            <li><a class="dropdown-item"
                                href="signup">회원가입</a></li>
                        </ul></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <h4 class="text-center">골프로 회원가입</h4>
        <c:url var="signUpPage" value="/user/signup" />
        <form action="${signUpPage}" method="post">
            <div class="form-group">
                <label for="id" class="form-label">아이디</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="userid"
                        name="userid" placeholder="아이디를 입력하세요" required>
                    <button class="btn btn-outline-secondary"
                        type="button" name="idbutton" id="idbutton">중복체크</button>
                </div>
            </div>

            <div class="form-group">
                <label for="userPassword" class="form-label">비밀번호</label>
                <input type="password" class="form-control"
                    id="userPassword" name="password"
                    placeholder="8~15자의 숫자, 특수문자, 영문자 조합" required>
                <div id="passwordStrength"></div>
            </div>

            <div class="form-group">
                <label for="userPasswordConfirm" class="form-label">비밀번호
                    확인</label> <input type="password" class="form-control"
                    id="userPasswordConfirm" name="passwordConfirm"
                    placeholder="비밀번호를 다시 입력하세요" required>
                <div id="passwordMatch"></div>
            </div>

            <div class="form-group">
                <label for="userName" class="form-label">이름</label> <input
                    type="text" class="form-control" id="name"
                    name="name" placeholder="이름을 입력하세요" required>
            </div>

            <div class="form-group">
                <label for="id" class="form-label">닉네임</label>
                <div class="input-group">
                    <input type="text" class="form-control"
                        id="nickname" name="nickname"
                        placeholder="별명 입력하세요" required>
                    <button class="btn btn-outline-secondary"
                        type="button" name="nicknamebutton"
                        id="nicknamebutton">중복체크</button>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">휴대폰 번호</label>
                <div class="flex">
                    <select class="form-select" name="phone0"
                        style="width: 30%;">
                        <option value="">통신사 선택</option>
                        <option value="SKT">SKT</option>
                        <option value="KT">KT</option>
                        <option value="LG U+">LG U+</option>
                        <option value="SKT 알뜰폰">SKT 알뜰폰</option>
                        <option value="KT 알뜰폰">KT 알뜰폰</option>
                        <option value="LG U+ 알뜰폰">LG U+ 알뜰폰</option>
                    </select> <input type="text" class="form-control" id="phone1"
                        name="phone1" style="width: 20%;" required>
                    <input type="text" class="form-control" id="phone2"
                        name="phone2" placeholder="앞자리" required
                        style="width: 25%;"> <input required
                        type="text" class="form-control" id="phone3"
                        name="phone3" placeholder="뒷자리"
                        style="width: 25%;">
                </div>

            </div>

            <div class="form-group" id="emailGroup">
                <label class="form-label">이메일</label>
                <div class="flex">
                    <input type="text" class="form-control"
                        id="emailPrefix" name="emailPrefix"
                        placeholder="이메일 주소" style="width: 40%;"
                        required> <span class="email-separator">@</span>
                    <select class="form-select" id="emailSeparator"
                        name="emailSeparator" style="width: 40%;">
                        <option value="naver.com">naver.com</option>
                        <option value="google.com">google.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="nate.com">nate.com</option>
                        <option value="kakao.com">kakao.com</option>
                    </select>
                </div>
                <div id="emailDiv"></div>
            </div>

            <div class="form-group">
                <label class="form-label">생년월일</label>
                <div class="flex">
                    <select class="form-select" id="birth-Year" required
                        name="birthYear" style="width: 40%;">
                        <option disabled selected>출생 연도</option>
                        <!-- 1940년부터 현재 년도까지 옵션 추가 -->
                        <script>
																									var currentYear = new Date()
																											.getFullYear();
																									for (var i = currentYear; i >= 1940; i--) {
																										document
																												.write('<option value="' + i + '">'
																														+ i
																														+ '년</option>');
																									}
																								</script>
                    </select> <select class="form-select" id="birth-month"
                        required name="birthMonth" style="width: 30%;">
                        <option disabled selected>월</option>
                        <option value="1">1월</option>
                        <option value="2">2월</option>
                        <option value="3">3월</option>
                        <option value="4">4월</option>
                        <option value="5">5월</option>
                        <option value="6">6월</option>
                        <option value="7">7월</option>
                        <option value="8">8월</option>
                        <option value="9">9월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
                    </select> <select class="form-select" id="birth-day" required
                        name="birthDay" style="width: 30%;">
                        <option disabled selected>일</option>
                        <!-- 1일부터 31일까지 옵션 추가 -->
                        <script>
																									for (var i = 1; i <= 31; i++) {
																										document
																												.write('<option value="' + i + '">'
																														+ i
																														+ '일</option>');
																									}
																								</script>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">성별</label>
                <div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio"
                            name="gender" id="gender" value="1" checked>
                        <label class="form-check-label" for="male">남자</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio"
                            name="gender" id="gender" value="2">
                        <label class="form-check-label" for="female">여자</label>
                    </div>
                </div>
            </div>



            <div class="form-group">
                <label for="postcode" class="form-label">우편번호</label> <input
                    type="text" class="form-control" id="postCode"
                    name="postCode" placeholder="우편번호"
                    style="width: 150px;" readonly>
            </div>

            <div class="form-group">
                <label for="addressMain" class="form-label">주소</label>
                <div class="input-group">
                    <input type="text" class="form-control" required
                        id="addressMain" name="addressMain"
                        placeholder="주소를 입력하세요" readonly>
                    <button class="btn btn-outline-secondary"
                        type="button" onclick="searchAddress()">
                        <i class="fas fa-search"></i> 주소 검색
                    </button>
                </div>
            </div>

            <div class="form-group">
                <label for="addressDetail" class="form-label">상세주소</label>
                <input type="text" class="form-control"
                    id="addressDetail" name="addressDetail" required
                    placeholder="상세주소를 입력하세요">
            </div>

            <div class="form-group">
                <label class="form-label">회원 유형</label>
                <div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio"
                            name="userType" id="normalUser" value="일반회원"
                            checked> <label
                            class="form-check-label" for="normalUser">일반회원</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio"
                            name="userType" id="expertUser" value="전문가">
                        <label class="form-check-label" for="expertUser">전문가</label>
                    </div>
                </div>
            </div>


            <div class="form-group" id="accountGroup">

                <label class="form-label">계좌번호 입력</label>
                <div class="flex">
                    <select class="form-select" id="bank" name="bank">
                        <option value="" selected>은행 선택</option>
                        <option value="KWANGJU">광주</option>
                        <option value="BNK">경남</option>
                        <option value="KB">국민</option>
                        <option value="IBK">기업</option>
                        <option value="NH">농협</option>
                        <option value="DGB">대구</option>
                        <option value="BUSAN">부산</option>
                        <option value="KDB">산업</option>
                        <option value="MG">새마을금고</option>
                        <option value="SH">수협</option>
                        <option value="SOL">신한</option>
                        <option value="ShinHyup">신협</option>
                        <option value="WOORI">우리</option>
                        <option value="PO">우체국</option>
                        <option value="JB">전북</option>
                        <option value="kakao">카카오뱅크</option>
                        <option value="Toss">토스</option>
                        <option value="KEB">하나</option>
                        <option value="SC">SC제일</option>
                    </select> <input type="text" class="form-control"
                        id="accountNumber" name="accountNumber"
                        placeholder="계좌번호를 입력하세요" />
                </div>
            </div>

            <div class="form-group" id="licenseGroup">
                <label for="LicenseUpload" class="form-label">라이센스
                    등록</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="license"
                        name="license" placeholder="라이센스 번호를 등록하세요">
                </div>
            </div>

            <div class="d-grid gap-2 mt-4" id="submitButtonContainer">
                <button type="submit" class="btn btn-primary btn-lg"
                    id="submitButton">회원가입</button>
            </div>
        </form>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script
            src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
									function searchAddress() {
										new daum.Postcode(
												{
													oncomplete : function(data) {
														// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

														// 각 주소의 노출 규칙에 따라 주소를 조합한다.
														// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
														var addr = ''; // 주소 변수

														// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
														if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
															addr = data.roadAddress;
														} else { // 사용자가 지번 주소를 선택했을 경우(J)
															addr = data.jibunAddress;
														}

														// 우편번호와 주소 정보를 해당 필드에 넣는다.
														document
																.getElementById('postCode').value = data.zonecode;
														document
																.getElementById('addressMain').value = addr;

														// 커서를 상세주소 필드로 이동한다.
														document
																.getElementById(
																		'addressDetail')
																.focus();
													}
												}).open();
									}
								</script>
        <script>
									// 사용자 유형에 따라 계좌번호 입력창과 라이센스 등록창을 보여주거나 숨기는 함수
									function toggleFormFields() {
										var expertUserChecked = document
												.getElementById('expertUser').checked;
										var accountGroup = document
												.getElementById('accountGroup');
										var licenseGroup = document
												.getElementById('licenseGroup');
										var submitButtonContainer = document
												.getElementById('submitButtonContainer');

										if (expertUserChecked) {
											accountGroup.style.display = 'block';
											licenseGroup.style.display = 'block';
											submitButtonContainer.style.display = 'block'; // 전문가일 때 버튼 보이기
										} else {
											accountGroup.style.display = 'none';
											licenseGroup.style.display = 'none';
											submitButtonContainer.style.display = 'block'; // 일반회원일 때도 버튼 보이기
										}
									}

									// 은행 선택 변경 이벤트 처리
									function handleBankSelection() {
										var bankSelect = document
												.getElementById('bank');
										bankSelect
												.addEventListener(
														'change',
														function() {
															// 선택된 옵션의 인덥스를 저장
															var selectedIndex = this.selectedIndex;

															// 선택된 옵션을 다시 설정
															this.selectedIndex = selectedIndex;
														});
									}

									// 페이지 로드시 초기 호출
									document
											.addEventListener(
													'DOMContentLoaded',
													function() {
														toggleFormFields();
														handleBankSelection();

														// 라디오 버튼 변경 이벤트 감지
														var radios = document
																.querySelectorAll('input[type=radio][name=userType]');
														radios
																.forEach(function(
																		radio) {
																	radio
																			.addEventListener(
																					'change',
																					toggleFormFields);
																});
													});
								</script>

        <script
            src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

        <!-- 우리가 만드는 JS 파일 -->
        <c:url var="userSignUpJS" value="/js/user_signup.js" />
        <script src="${userSignUpJS}"></script>
    </div>
</body>
</html>