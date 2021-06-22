document.addEventListener("DOMContentLoaded", () => {
  let modal = document.querySelector("div#modal");
  modal.querySelector("span").addEventListener("click", (e) => {
    // 임의로 생성된 div_search Box는
    // modal과 별개로 생성을 하였으므로
    // div_search box를 remove하고 modal을 감춘다
    document.querySelector("div#div_search").remove();
    modal.style.display = "none";
  });
  document.querySelector("form#book_input").addEventListener("keydown", (e) => {
    let key = e.key;
    let tagName = e.target.tagName;
    let id = e.target.id;
    let className = e.target.className;

    if (key === "Enter" && tagName === "INPUT") {
      // input 박스에서 엔터를 눌렀을 때
      let text = e.target.value;
      let urlPath = rootPath;

      if (id === "bk_ccode") {
        urlPath += `/comp/search?cp_title=${text}`;
      } else if (id === "bk_acode") {
        urlPath += `/author/search?au_name=${text}`;
        // 아이디 값에 따라 urlPath를 ~ 만들어주고
      }

      if (className === "search") {
        modal.style.display = "block";
        fetch(urlPath)
          .then((res) => {
            return res.text();
          })
          .then((result) => {
            // 새로운 element(tag)
            let div = document.createElement("div");
            // 본문 내용 추가
            div.innerHTML = result;
            // id 추가
            div.setAttribute("id", "div_search");
            document.querySelector("body").appendChild(div);
          });
        // Ajax
      }
    }
  });

  document
    .querySelector("form#book_input button.btn_save")
    .addEventListener("click", (e) => {
      let form = document.querySelector("form#book_input");

      let bk_isbn = form.querySelector("input#bk_isbn");
      let bk_title = form.querySelector("input#bk_title");
      let bk_ccode = form.querySelector("input#bk_ccode");
      let bk_acode = form.querySelector("input#bk_acode");
      let bk_price = form.querySelector("input#bk_price");
      let bk_pages = form.querySelector("input#bk_pages");
      // 코드 재활용 위해 뒤에 .value 지움

      // front 단에서 값이 입력됐나 확인하는 유효성 검사
      if (bk_isbn.value === "") {
        // .value가 비어있으면
        alert("ISBN은 반드시 입력하세요");
        bk_title.focus();
        return false;
      }
      if (bk_isbn.value.length !== 13) {
        alert("ISBN은 13자리여야 합니다");
        bk_isbn.focus();
        return false;
      }

      if (bk_title.value === "") {
        alert("도서명은 반드시 입력하세요");
        bk_name.focus();
        return false;
      }

      // 여기 도착하면 유효성 검사 모두 통과
      // form에 담긴 데이터를 서버로 req하는데
      // front에서는 submit한다 라고 표현한다
      form.submit();
    });
});
