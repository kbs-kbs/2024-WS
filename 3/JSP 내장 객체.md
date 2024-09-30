### out

JSP가 생성하는 모든 내용은 out 객체를 통해 전송

**out 객체의 버퍼 관련 메서드**

|리턴 타입|메서드|설명|
|---|---|---|
|*int*|**getBufferSize**()|버퍼의 크기를 반환|
|*int*|**getRemaining**()|현재 버퍼의 남은 크기를 반환|
|*void*|**clear**()|버퍼의 내용을 비운다. Flush한 뒤에는 IOException 발생|
|*void*|**clearBuffer**()|버퍼의 내용을 비운다. Flush한 뒤에도 IOException 발생하지 않는다.|
|*void*|**flush**()|버퍼의 내용을 클라이언트에 전송|
|*boolean*|**isAutoFlush**()|버퍼가 찼을 때 자동 flush 여부를 확인|



```
<% if(grade > 10) { %>
<%= “10보다 크다. %>
<% } else { %>
<%= “10이하 이다. %>
<% } %>
```

```
<% 
if(grade > 10) {
  out.println(“10보다 크다.” ); 
} else {
  out.println(“10이하 이다.”);
} 
%>
```

