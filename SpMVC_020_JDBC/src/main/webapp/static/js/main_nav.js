document.addEventListener("DOMContentLoaded", () => {
  const nav = document.querySelector("nav#main_nav");
  nav.addEventListener("click", (e) => {
    let tagName = e.target.tagName;
    if (tagName === "LI") {
      let menuText = e.target.textContent;

      // `` : backTit : 역 작은 따옴표
      // JS에서 변수를 포함하는 문자열을 생성할 때 사용한다
      // let urlPath = rootPath 와 똑같음. backtit 안 써도 되는데 써본 것.
      let urlPath = `${rootPath}`;
      // 이 이름은 아까 var로 만든 자바스크립트의 변수

      if (menuText === "HOME") {
        // 위에서 만든 urlPath += rootPath + "/"
        // 이렇게 만든 문장을 한문장으로 변경해서 쓰는 것
        // 위에 있는 rootPath와 이걸 합해서 URL을 만들어라
        // 변수+문자열 연결 연산자 써야될 것을 backTit써서 하나의 문자열처럼 사용
        urlPath += `/`;
      } else if (menuText === "도서정보관리") {
        urlPath += `/books`;
      } else if (menuText === "출판사정보") {
        urlPath += `/comp`;
      } else if (menuText === "저자정보") {
        urlPath += `/author`;
      } else if (menuText === "로그인") {
        urlPath += `/member/login`;
      } else if (menuText === "회원가입") {
        urlPath += `/member/join`;
        //location.href = "${rootPath}/member/join";
      }

      // alert(`내가 가야할 곳 ${urlPath}`);
      // alert("내가 가야할곳 " + urlPath);
      location.href = urlPath;
    }
    // main nav 클릭되면 클릭된 것 중에 ?네임 가져온 다음 ?이 메뉴태그면
    // li태그 클릭되면 클릭된 메뉴 텍스트 가져와서 ?에 띄워라
  });
});
