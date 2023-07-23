	
	//배너 전체 크기 구하기
	const banner_outline = document.querySelector(".banner_outline");
	let banner_Width = banner_outline.clientWidth;
	
	//버튼 요소 선택
	const leftBtn = document.querySelector(".button_left"); //이전 버튼
	const rightBtn = document.querySelector(".button_right"); //다음 버튼
	
	
	// 배너 전체를 선택해 값을 변경해주기 위해 배너 전체 선택하기
	let banner_list = document.querySelectorAll(".banner_list");
	// 현재 배너 위치가 배너 개수를 넘기지 않게 하기 위한 변수
	const maxSlide = banner_list.length;
	
	// 버튼 클릭할 때 마다 현재 배너가 어디인지 알려주기 위한 변수
	let currSlide = 1;

	
	// 페이지네이션 생성
	const banner_pagination = document.querySelector(".banner_pagination");

	for (let i = 0; i < maxSlide; i++) {
	  if (i == 0) banner_pagination.innerHTML += `<li class="active">•</li>`;
	  else banner_pagination.innerHTML += `<li>•</li>`;
	}

	const banner_paginationItems = document.querySelectorAll(".banner_pagination > li");
	
	
	
	// 무한 배너를 위해 start, end 배너 복사하기
	const startSlide = banner_list[0];
	const endSlide = banner_list[banner_list.length - 1];
	const startElem = document.createElement("div");
	const endElem = document.createElement("div");

	endSlide.classList.forEach((c) => endElem.classList.add(c));
	endElem.innerHTML = endSlide.innerHTML;

	startSlide.classList.forEach((c) => startElem.classList.add(c));
	startElem.innerHTML = startSlide.innerHTML;
	
	
	
	// 각 복제한 엘리먼트 추가하기
	banner_list[0].before(endElem);
	banner_list[banner_list.length - 1].after(startElem);
	
	
	
	// 배너 전체를 선택해 값을 변경해주기 위해 배너 전체 선택하기
	banner_list = document.querySelectorAll(".banner_list");
	//
	let offset = banner_Width + currSlide;
	banner_list.forEach((i) => {
	  i.setAttribute("style", `left: ${-offset}px`);
	});
	
	
	
	function nextMove() {
  currSlide++;
  // 마지막 배너 이상으로 넘어가지 않게 하기 위해서
  if (currSlide <= maxSlide) {
    // 배너를 이동시키기 위한 offset 계산
    const offset = banner_Width * currSlide;
    // 각 배너 아이템의 left에 offset 적용
    banner_list.forEach((i) => {
      i.setAttribute("style", `left: ${-offset}px`);
    });
    // 배너 이동 시 현재 활성화된 pagination 변경
    banner_paginationItems.forEach((i) => i.classList.remove("active"));
    banner_paginationItems[currSlide - 1].classList.add("active");
  } else {
    // 무한 배너 기능 - currSlide 값만 변경해줘도 되지만 시각적으로 자연스럽게 하기 위해 아래 코드 작성
    currSlide = 0;
    let offset = banner_Width * currSlide;
    banner_list.forEach((i) => {
      i.setAttribute("style", `transition: ${0}s; left: ${-offset}px`);
    });
    currSlide++;
    offset = banner_Width * currSlide;
    // 각 배너 아이템의 left에 offset 적용
    setTimeout(() => {
      // 각 배너 아이템의 left에 offset 적용
      banner_list.forEach((i) => {
        // i.setAttribute("style", `transition: ${0}s; left: ${-offset}px`);
        i.setAttribute("style", `transition: ${0.15}s; left: ${-offset}px`);
      });
    }, 0);
    // // 배너 이동 시 현재 활성화된 pagination 변경
    banner_paginationItems.forEach((i) => i.classList.remove("active"));
    banner_paginationItems[currSlide - 1].classList.add("active");
  }
}


function prevMove(){
currSlide--;
    // 1번째 배너 이하로 넘어가지 않게 하기 위해서
  if (currSlide > 0) {
    // 배너를 이동시키기 위한 offset 계산
    const offset = banner_Width * currSlide;
    // 각 배너 아이템의 left에 offset 적용
    banner_list.forEach((i) => {
      i.setAttribute("style", `left: ${-offset}px`);
    });
    // 배너 이동 시 현재 활성화된 pagination 변경
    banner_paginationItems.forEach((i) => i.classList.remove("active"));
    banner_paginationItems[currSlide - 1].classList.add("active");
  } else {
    // 무한 배너 기능 - currSlide 값만 변경해줘도 되지만 시각적으로 자연스럽게 하기 위해 아래 코드 작성
    currSlide = maxSlide + 1;
    let offset = banner_Width * currSlide;
    // 각 배너 아이템의 left에 offset 적용
    banner_list.forEach((i) => {
      i.setAttribute("style", `transition: ${0}s; left: ${-offset}px`);
    });
    currSlide--;
    offset = banner_Width * currSlide;
    setTimeout(() => {
      // 각 배너 아이템의 left에 offset 적용
      banner_list.forEach((i) => {
        // i.setAttribute("style", `transition: ${0}s; left: ${-offset}px`);
        i.setAttribute("style", `transition: ${0.15}s; left: ${-offset}px`);
      });
    }, 0);
    // 배너 이동 시 현재 활성화된 pagination 변경
   banner_paginationItems.forEach((i) => i.classList.remove("active"));
   banner_paginationItems[currSlide - 1].classList.add("active");
  }
}



// 버튼 엘리먼트에 클릭 이벤트 추가하기 1
rightBtn.addEventListener("click", () => {
  // 이후 버튼 누를 경우 현재 배너를 변경
  //배너에서 오른쪽에 있는버튼
  nextMove();
});


// 버튼 엘리먼트에 클릭 이벤트 추가하기 2
leftBtn.addEventListener("click", () => {
  // 이전 버튼 누를 경우 현재 배너를 변경
  //배너에서 왼쪽에 있는버튼
  prevMove();
});



// 브라우저 화면이 조정될 때 마다 slideWidth를 변경하기 위해
window.addEventListener("resize", () => {
  banner_Width = banner_outline.clientWidth;
});



// 각 페이지네이션 클릭 시 해당 배너로 이동하기
for (let i = 0; i < maxSlide; i++) {
  // 각 페이지네이션마다 클릭 이벤트 추가하기
   banner_paginationItems[i].addEventListener("click", () => {
    // 클릭한 페이지네이션에 따라 현재 배너 변경해주기(currSlide는 시작 위치가 1이기 때문에 + 1)
    currSlide = i + 1;
    // 배너를 이동시키기 위한 offset 계산
    const offset = banner_Width * currSlide;
    // 각 배너 아이템의 left에 offset 적용
    banner_list.forEach((i) => {
      i.setAttribute("style", `left: ${-offset}px`);
    });
    // 배너 이동 시 현재 활성화된 pagination 변경
    banner_paginationItems.forEach((i) => i.classList.remove("active"));
    banner_paginationItems[currSlide - 1].classList.add("active");
  });
}



// 드래그(스와이프) 이벤트를 위한 변수 초기화
let startPoint = 0;
let endPoint = 0;


// PC 클릭 이벤트 (드래그)
banner_outline.addEventListener("mousedown", (e) => {
  startPoint = e.pageX; // 마우스 드래그 시작 위치 저장
});

banner_outline.addEventListener("mouseup", (e) => {
  endPoint = e.pageX; // 마우스 드래그 끝 위치 저장
  if (startPoint < endPoint) {
    // 마우스가 오른쪽으로 드래그 된 경우
    prevMove();
  } else if (startPoint > endPoint) {
    // 마우스가 왼쪽으로 드래그 된 경우
    nextMove();
  }
});




// 기본적으로 배너 루프 시작하기
let loopInterval = setInterval(() => {
  nextMove();
}, 3000);



// 배너에 마우스가 올라간 경우 루프 멈추기
banner_outline.addEventListener("mouseover", () => {
  clearInterval(loopInterval);
});



// 배너에서 마우스가 나온 경우 루프 재시작하기
banner_outline.addEventListener("mouseout", () => {
  loopInterval = setInterval(() => {
    nextMove();
  }, 3000);
});