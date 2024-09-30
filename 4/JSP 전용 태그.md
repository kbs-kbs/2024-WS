## JSP 전용 태그의 종류

1. 지시자(Directives): `<%@ ... %>`
2. 스크립트릿(Scriptlet): `<% ... %>`
3. Declarations: `<%! ... %>`
4. 표현식(Expressions): `<%= ... %>`
5. JSP 액션(JSP Action): `<jsp: />`

### Directives(지시자)

`<%@ 지시자 속성="값" 속성="값" ... %>`

JSP 지시자는 지시자, 속성에 따라 자바 코드를 생성한다.

JSP 지시자에는 page, taglib, include가 있다.

**page 지시자**

page 지시자는 JSP 페이지와 관련된 속성을 정의할때 사용하는 태그이다.

예:
`<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>`
 

|속성|설명|
|---|---|
|language|스크립트릿, 표현식, 선언부를 작성할때 사용할 프로그래밍 언어를 지정한다.즉 JSP 페이지에 삽엡되는 코드의 스크립팅 언어를 지정한다. JSP 2.2에서는 'java'만 허용된다. (모두 소문자로 작성)language 속성을 생략하면 기본값은 'java'이다.|
|contentType|출력할 데이터의 MIME 타입과 문자 집합을 지정한다.MIME 타입이 'text/html'이면 출력할 데이터가 HTML이라는 의미이다.문자 집합이 'charset=UTF-8'이면 출력할 데이터를 UTF-8로 인코딩한다.문자 집합을 생략하면 기본값 'ISO-8859-1'을 사용한다. 자바는 문자열을 다룰때 유니코드(UTF-16 BE)를 사용하는데 클라이언트로 문자열을 출력할때 유니코드를 contentType 혹은 pageEncoding에 설정된 문자 집합으로 인코딩하여 출력한다.|
|pageEncoding|출력할 데이터의 문자 집합을 지정한다. 기본값은 'ISO-8859-1'이다.|
|contentType|설정값보다 우선시된다. 이 속성을 생략하면 contentType에 설정된 값을 사용한다.|

 

page 지시자는 다음과 같은 자바 코드를 생성한다.

contentType과 pageEncoding 속성에 지정된 값으로 setContentType() 호출 코드가 생성된다.

language 속성은 JSP 엔진에 정보를 제공하는 역할이며 따로 코드를 생성하진 않는다.

**taglib 지시자**

taglib는 태그 라이브러리를 선언할때 사용한다.

예시 : JSTL Core 태그 라이브러리 선언

```
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
```
 

속성	설명
uri	사용할 태그 라이브러리 네임스페이스 식별자(URI)
prefix	태그 접두사
 

**Scriptlet Elements(스크립트릿):**
<% 자바 코드 %>
JSP에 자바 코드를 작성할 때 스크립트릿 태그 <% %> 안에 작성한다.

스크립트릿 태그 안에 작성한 코드는 서블릿 파일을 만들 때 그대로 복사된다.

 

JSP 스크립트릿 코드의 예


 

생성된 JAVA 코드


JSP에서 생성된 자바 서블릿 소스에서 _jspService() 안에 그대로 복사된다.

 

Declarations(선언문)
<%! %>
서블릿 클래스의 멤버(변수, 메소드)를 선언할 때 사용한다.

 

JSP 선언문의 예


 

JSP에서 작성 위치는 상관 없다.

선언문은 _jspService() 메소드 안에 복사되는 것이 아니라 _jspService() 밖의 클래스 블록 안에 복사되기 때문이다.

 

자바 서블릿 코드의 출력문으로 변환된 선언문의 예


 

**4. Expressions(표현식):**
<%= %>
문자열을 출력할 때 사용한다.

따라서 표현식 <%= %> 안에는 결과를 반환하는 자바 코드가 와야한다.

표현식은 출력문으로 만들어지며 스크립트릿과 같이 _jspService() 안에 순서대로 복사된다.

 

JSP 표현식의 예


 

자바 서블릿 코드의 출력문으로 변환된 표현식의 예


위와 같이 JSP 표현식 안의 자바 코드가 out.println() 출력문의 인자값으로 복사된다.

따라서 JSP 표현식 안에는 out.println()의 안자값으로 넣을 수 있는 결과를 반환하는 자바 코드가 와야한다.

**5. JSP Action**

JSP에서 기본으로 제공하는 태그들의 집합을 'JSP Action'이라 한다.

다음은 JSP 2.2에서 제공하는 Standard Action들이다.

- `<jsp:useBean />`: 자바 인스턴스를 준비한다. 보관소에서 자바 인스턴스를 꺼내거나 자바 인스턴스를 새로 만들어 보관소에 저장하는 코드를 생성한다. 자바 인스턴스를 자바 빈(Java Bean)이라고 부른다.
<jsp:setProperty>	자바 빈의 프로퍼티 값을 설정한다.
자바 객체의 settet()를 호출하는 코드를 생성한다.
<jsp:getProperty>	자바 빈의 프로퍼티 값을 꺼낸다.
자바 객체의 getter()를 호출하는 코두를 생성한다.
<jsp:include>	정적(HTML, 텍스트 파일 등) 또는 동적(서블릿/JSP) 자원을 including하는 자바 코드를 생성한다.
<jsp:forward>	현재 페이지의 실행을 멈추고 다른 정적, 동적 자원으로 forwarding하는 자바 코드를 생성한다.
<jsp:param>	jsp:include, jsp:forard, jsp:params의 자식 태그로 사용한다.
ServletRequest 객체에 매개변수를 추가하는 코드를 생성한다.
<jsp:plugin>	OBJECT 또는 EMBED HTML 태그를 생성한다.
<jsp:element>	임의의 XML 태그나 HTML 태그를 생성한다.
