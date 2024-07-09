/* header.jspf */

document.addEventListener("DOMContentLoaded", function() {
    // 로그인 버튼과 드롭다운 메뉴 초기화
    const loginButton = document.querySelector(".login-button");
    const dropdownMenu = document.querySelector(".dropdown-menu");

    if (loginButton && dropdownMenu) {
        // 로그인 버튼에 마우스를 올릴 때 드롭다운 메뉴 표시
        loginButton.addEventListener("mouseenter", function() {
            dropdownMenu.style.display = "block";
        });

        // 로그인 버튼에서 마우스가 떠날 때, 메뉴 외부로 이동한 경우에만 메뉴 숨김
        loginButton.addEventListener("mouseleave", function(event) {
            if (!dropdownMenu.contains(event.relatedTarget)) {
                dropdownMenu.style.display = "none";
            }
        });

        // 드롭다운 메뉴에 마우스를 올릴 때 메뉴 계속 표시
        dropdownMenu.addEventListener("mouseenter", function() {
            dropdownMenu.style.display = "block";
        });

        // 드롭다운 메뉴에서 마우스가 떠날 때 메뉴 숨김
        dropdownMenu.addEventListener("mouseleave", function() {
            dropdownMenu.style.display = "none";
        });
    }

    // 카테고리 메뉴 초기화
    const mainFolder = document.querySelector(".mainFolder");
    const submenu = document.querySelector(".submenu");
    
    if (mainFolder) {
        // 레슨 버튼에 마우스를 올릴 때 드롭다운 메뉴 표시
        mainFolder.addEventListener("mouseenter", function() {
            submenu.style.display = "block";
        });

        // 레슨 버튼에서 마우스가 떠날 때, 메뉴 외부로 이동한 경우에만 메뉴 숨김
        mainFolder.addEventListener("mouseleave", function(event) {
            if (!submenu.contains(event.relatedTarget)) {
                submenu.style.display = "none";
            }
        });

        // 서브 메뉴에 마우스를 올릴 때 메뉴 계속 표시
        submenu.addEventListener("mouseenter", function() {
            submenu.style.display = "block";
        });

        // 서브 메뉴에서 마우스가 떠날 때 메뉴 숨김
        submenu.addEventListener("mouseleave", function() {
            submenu.style.display = "none";
        });
    };

    // 검색 기능 초기화
    performSearch();
});

function navigateTo(page) {
    // 모든 카테고리 클릭 시 동일한 페이지로 이동
    window.location.href = '/mainPost/list';
}







function performSearch() {
    const search = document.querySelector(".search");
    const btn = document.querySelector(".search-btn");
    const input = document.querySelector(".input");

    // 검색 기능 구현 추가
}
