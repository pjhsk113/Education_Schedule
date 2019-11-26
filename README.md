# 교육 일정 관리 웹 사이트
- 투비소프트 고객지원 벤치마킹 http://support.tobesoft.co.kr/Support/index.html

## 개발환경
- 언어
  - Java, JavaScript, Jsp, JSTL, Ajax
- 프레임워크
  - Spring, MyBatis
- 라이브러리
  - JQuery, Lombok, tiles
- DB
  - MySQL
- WAS
  - Tomcat 8.5
- JDK
  - jdk1.8
  
## 교육일정 캘린더
- Controller
    - `src`-`com.spring.board.controller`-`ScheduleController.java `
- View
    - `WebContent`-`WEB-INF`-`views`-`calendar`-`education_calendar.jsp`

![](img/edu_image1.JPG)

## 교육 일정 만들기
- View
    - `WebContent`-`WEB-INF`-`views`-`calendar`-`add_Schedule.jsp`

![](img/edu_image5.JPG)

## 교육 신청
- Controller
    - `src`-`com.spring.board.controller`-`RegisterController.java `
- View
    - `WebContent`-`WEB-INF`-`views`-`apply`-`apply_register.jsp`
    
![](img/edu_image2.JPG)

## 교육 신청 현황
- Controller
    - `src`-`com.spring.board.controller`-`StatusController.java `
- View
    - `WebContent`-`WEB-INF`-`views`-`status`-`status_info.jsp`
    
![](img/edu_image3.JPG)

## 교육 신청자 정보수정/ 신청취소
- 휴대폰 번호 확인을 통해 수정/취소 가능

![](img/edu_image4.JPG)
