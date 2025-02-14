/**
 * /post/details.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', () => {
	// btnToggleComment 버튼 요소를 찾음.

	const btnToggleComment = document.querySelector('button#btnToggleComment');

	// collapseComments div 요소를 부트스트랩의 Collapse 객체로 생성.
	const bsCollapse = new bootstrap.Collapse('div#collapseComments', { toggle: false });

	// 댓글 토글 버튼에 클릭 이벤트 리스너를 등록.
	btnToggleComment.addEventListener('click', () => {
		bsCollapse.toggle();

		if (btnToggleComment.innerHTML === '댓글보기') {
			btnToggleComment.innerHTML = '댓글접기';
			// 포스트에 달려 있는 모든 댓글 목록을 보여줌.
			getAllComments();
		} else {
			btnToggleComment.innerHTML = '댓글보기';
		}

	});

	// 버튼 btnResisterComment 요소를 찾음.
	const btnRegisterComment = document.querySelector('button#btnRegisterComment');

	// 버튼에 클릭 이벤트 리스너를 설정.
	btnRegisterComment.addEventListener('click', resisterComment);
	
	// 부트스트랩 모달(다이얼로그) 객체 생성.
	const commentModal = new bootstrap.Modal('div#commentModal', {backdrop: true});
	
	// 모달의 저장 버튼을 찾고, 클릭 이벤트 리스너를 설정.
	const btnUpdateComment = document.querySelector('button#btnUpdateComment');
	btnUpdateComment.addEventListener('click', updateComment);
	console.log;
	
	
	/* -------------------------------------------------------------------------- */
	
	
	// 댓글 등록 이벤트 리스너 콜백(함수)
	function resisterComment() {
		// 댓글이 달릴 포스트 번호를 찾는다.
		const postId = document.querySelector('input#id').value;

		// 댓글 내용을 찾음.
		const ctext = document.querySelector('textarea#ctext').value;

		// 댓글 작성자 아이디를 찾음.
		const username = document.querySelector('input#username').value;

		// 댓글 내용, 댓글 작성자가 비어 있는 지 체크
		if (ctext === '' || username === '') {
			alert('댓글 내용과 작성자는 반드시 입력하셔야 합니다.')
			return; // 이벤트 리스너 종료
		}

		// Ajax 요청에서 보낼 데이터 객체를 생성.
		/* const data = {
			postId: postId, // 데이터 객체의 프로퍼티 이름: 지역변수
			ctext: ctext,
			username: username			
			
		};	
		*/
		const data = { postId, ctext, username };
		console.log(data);

		// POST 방식의 Ajax 요청을 보냄. 응답 성공/실패 콜백을 등록.
		axios
			.post('../api/comment', data)
			.then((response) => {
				//	console.log(response);			
				console.log(response.data); // RestController에서 보낸 응답 데이터

				if (response.data === 1) {
					window.alert('댓글 1개 등록 성공');
					document.querySelector('textarea#ctext').value = '';
					document.querySelector('input#username').value = '';

					// 댓글 목록 갱신
					getAllComments();
				}
			})
			.catch((error) => {
				console.log(error);
			});
	}

	// 포스트에 달려 있는 모든 댓글 목록 가져오기
	function getAllComments() {
		// 댓글 목록을 요청하기 위한 포스트 번호
		const postId = document.querySelector('input#id').value;

		// 댓글 목록을 요청하기 위한 REST API URI
		const uri = `../api/comment/all/${postId}`;

		// Ajax 요청을 보냄.
		axios.get(uri)
			.then((response) => {
				console.log(response.data);
				// 댓글 목록을 HTML 로 작성 -> div#comments 영역에 출력.
				makeCommentElements(response.data);
			})
			.catch((error) => {
				console.log(error);
			});
	}

	//댓글 목록(댓글 객체들의 배열)을 마규먼트로 전달 받아서 HTML을 작성하는 함수.
	function makeCommentElements(data) {
		// 댓글 목록 HTML 이 삽입될 div
		const divComments = document.querySelector('div#comments'); // 할당되면 안 바뀜.

		// 댓글 목록 HTML 코드
		let htmlStr = ''; // 할당을 했지만 바뀔 수 있다.
		for (let comment of data) {
			// 댓글 최종 수정 시간
			const modifiedTime = new Date(comment.modifiedTime).toLocaleString();

			htmlStr += `
			<div class = 'card card-body mt-1'>
				<div style="font-size: 0.75rem;">
					<span>${comment.id}</span>
					<span class = 'fw-bold'>${comment.username}</span>
					<span>${modifiedTime}</span>
				</div>
				<div>${comment.ctext}</div> 
				<div>
					<button class="btnDeleteComment btn btn-outline-danger btn-sm"
						data-id="${comment.id}">삭제</button>
					<button class="btnModifyComment btn btn-outline-primary btn-sm"
						data-id="${comment.id}">수정</button>
				</div>
			</div>
			`;
		}

		// 작성된 HTML 코드를 div 영역에 삽입한다.
		divComments.innerHTML = htmlStr;

		// 삭제 버튼들을 찾아서 클릭 이벤트 리스너를 설정
		const btnDeletes = document.querySelectorAll('button.btnDeleteComment');
		for (let btn of btnDeletes) {
			btn.addEventListener('click', deleteComment);
		}

		// TODO: 모든 수정 버튼들을 찾아서 클릭 이벤트 리스너를 설정.
		const btnModifies = document.querySelectorAll('button.btnModifyComment');
		for (let btn of btnModifies) {
			btn.addEventListener('click', showCommentModal);
		}
	}

	function deleteComment(event) {
		// 이벤트 리스너 콜백의 아규먼트 event 객체는 target 속성을 가지고 있음.
		console.log(event.target); // 이벤트가 발생한 요소(타겟)
		const id = event.target.getAttribute('data-id'); // HTML 요소의 속성 값 찾기

		// 삭제 여부 확인
		const result = confirm('댓글을 정말 삭제할까요?');
		if (!result) { // 사용자가 [취소]를 선택했을 때

			return; // 함수 종료
		}

		// 댓글 삭제를 위한 REST API URI
		const uri = `../api/comment/${id}`;

		// Ajax 요청을 보냄.
		axios
			.delete(uri)
			.then((response) => {
				console.log(response.data);

				if (response.data === 1) {
					window.alert(`댓글(${id}) 삭제 성공`);
					// 댓글 목록 갱신
					getAllComments();
				}

			})
			.catch((error) => {
				console.log(error);
			});
	}
	
	function showCommentModal(event) {
		// 이벤트 타겟(수정 버튼)의 data-id 속성 값을 읽음.
		const id = event.target.getAttribute('data-id');
		
		// Ajax 요청을 보내서 댓글 아이디로 검색.
		const uri = `../api/comment/${id}`;
		axios
		.get(uri)
		.then((response)=>{
			console.log(response.data);
			// console.log(response.data.id);
			
			// 모달의 input(댓글 번호), textarea(댓글 내용)의 value를 채움.
			document.querySelector('input#modalCommentId').value=id;
			document.querySelector('textarea#modalCommentText').value=response.data.ctext;
			
			// 모달을 보여줌.
			commentModal.show();
			
						
		})
		.catch((error)=> {
			console.log(error)
		});
		
	} 
	
	function updateComment(event) {
			
		// 업데이트할 댓글 번호
		const id = document.querySelector('input#modalCommentId').value;
		
		// 업데이트할 댓글 내용
		const ctext = document.querySelector('textarea#modalCommentText').value;
		if(ctext === ''){
			alert('업데이트할 댓글 내용을 입력하세요.');
			return; // 이벤트 리스너 종료
		}
		
		// 댓글 업데이트 요청 REST API URI
		const uri = `../api/comment/${id}`;
		
		// Ajax 요청
		axios
		.put(uri, {ctext}) // {ctext} = {ctext:ctext}
		.then((response)=>{
			console.log(response);
			
			getAllComments(); // 댓글 목록 갱신
			commentModal.hide(); // 모달 숨김
		})
		.catch((error)=>console.log(error));
	}
	
	

});