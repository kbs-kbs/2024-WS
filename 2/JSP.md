## Jakarta Server Pages(JSP; JavaServer Pages)란
자바 WAS를 만들 때 사용하는 HTML과 Java가 합쳐진 언어입니다.


```
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head><title>현재 시간</title></head>
<body>
현재 시각: <%= new java.util.Date() %>
</body>
</html>
```

```
<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>1-10까지의 합</title></head>
<body>
<%
	int sum = 0;
	for (int i = 1 ; i <= 10 ; i++) {
		sum = sum + i;
	}
%>
1 부터 10까지의 합은 <%= sum %> 입니다.
</body>
</html>
```

```
<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>1-10까지의 합:표현식만 사용</title></head>
<body>
1 부터 10까지의 합은 
<%= 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 %>
입니다.
</body>
</html>
```
