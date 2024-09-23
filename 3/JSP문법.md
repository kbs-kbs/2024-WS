get 방식은 브라우저의 인코딩 방식을 따라가는데   
post 방식은 요청 파일에서 지정한 인코딩 방식으로 따라간다.

## request 객체 예제

**form.jsp**

```
<%@ page contentType = "text/html; charset=utf-8"%>
<html>
<head><title>폼 생성</title></head>
<body>

<form action="viewParameter.jsp" method="post">
이름: <input type="text" name="name" size="10"> <br>
주소: <input type="text" name="address" size="30"> <br>
좋아하는 동물:
	<input type="checkbox" name="pet" value="dog">강아지
	<input type="checkbox" name="pet" value="cat">고양이
	<input type="checkbox" name="pet" value="pig">돼지
<br>
<input type="submit" value="전송">
</form>
</body>
</html>
```

**viewParameter.jsp**

```
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
    <title>요청 파라미터 출력</title>
</head>
<body>
    <b>request.getParameter() 메서드 사용</b><br>
    name 파라미터 = <%= request.getParameter("name") %><br>
    address 파라미터 = <%= request.getParameter("address") %>
    <p>
        <b>request.getParameterValues() 메서드 사용</b><br>
        <%
            String[] values = request.getParameterValues("pet");
	    if (values != null) {
	        for (int i = 0 ; i < values.length ; i++) {
        %>
	<%= values[i] %>
        <%
		}
	}
%>
<p>
<b>request.getParameterNames() 메서드 사용</b><br>
<%
	Enumeration paramEnum = request.getParameterNames();
	while(paramEnum.hasMoreElements()) {
		String name = (String)paramEnum.nextElement();
%>
		<%= name %>
<%
	}
%>
<p>
<b>request.getParameterMap() 메서드 사용</b><br>
<%
	Map parameterMap = request.getParameterMap();
	String[] nameParam = (String[])parameterMap.get("name");
	if (nameParam != null) {
%>
name = <%= nameParam[0] %>
<%
	}
%>
</body>
</html>

```

## 기본객체pageContext

|리턴 타입|메서드|설명|
|---|---|---|
|*ServletRequest*|getRequest()| |
|*ServletResponse*|getResponse()| |
|*HttpSession*|getSession()| |
|*ServletContext*|getServletContext()| |
|*ServletConfig*|getServletConfig()| |
|*JspWriter*|getOut()| |
|*Exception*|getException()||
|*Object*|getPage()| |

