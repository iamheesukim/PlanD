# 우리어디가(WhereWeGO)

비트캠프 파이널 프로젝트

## 0. 협업 공지사항(by 김승규)

- 작업 효율의 향상을 위해 Front/Back을 분리하였습니다.
- 현재 학원에서 수강 중인 MVC 모델을 활용한 웹 페이지 구현은 back-end 폴더에서 배운 대로 적용해 주시면 됩니다. front-end 폴더의 내용은 대부분 저만 사용할 것 같습니다. 필요한 내용이 생기면 back-end 폴더에도 셋업해 두겠습니다. 문제가 생기면 말씀해 주세요.
- front-end 폴더의 작업물을 확인하시려면 http://localhost:3000/ 으로 접속하시거나, 로고/홈 버튼을 누르시면 됩니다.
- 아래 3, 4번 항목에 현재까지 적용시킨 스택 및 라이브러리를 작성해 두었습니다. 서버 제작에 참고해 주세요.
- 헤더는 모든 페이지에서 스크롤 되어도 항상 화면의 최상단 60px만큼의 공간을 차지하도록 position: fixed 속성을 적용했습니다. 따라서 바디에 다른 요소들을 배치할 때, margin-top: 60px을 적용해야 헤더에 가려지지 않습니다.

## 1. 프로젝트 목표

- 사용자로부터 날짜 및 시간, 장소(역), 관심사를 입력받아 데이트 코스를 추천해 주는 웹 어플리케이션 제작
- MVC 모델을 활용한 웹 페이지 제작

## 2. 구현 기능

## 3. 스택

### back-end

- Java 14.0.2.
- Spring Framework 5.2.10.
- Oracle 18.4.0.
- Servlet
- JSP

### front-end

- HTML5
- CSS
- JavaScript ES6
- React.js

## 4. 라이브러리

### back-end

- ojdbc 8
- spring-jdbc 5.2.10.
- gson 2.8.8.
- json-simple 1.1.1.
- JSTL

### front-end

- JQuery
- styled-components
- react-router
- axios
