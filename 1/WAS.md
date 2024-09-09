## 웹 서버(Web Server, WS)
하는 일: HTML, CSS, Javascript 반환

## 웹 애플리케이션 서버(Web Application Server, WAS)
하는 일: 쿼리를 통한 요청 결과 반환

### 서버 사이드 렌더링

**JSP**: Java 기반의 서버 사이드 렌더링 기술입니다. Java 및 Apache Tomcat과 같은 서블릿 컨테이너에서 실행됩니다.
```
<p>페이지에 오신 것을 환영합니다, <%= request.getAttribute("name") %>님!
오늘은 <%= new java.text.SimpleDataFormat("MM/dd/yyyy").format(new java.util.Date()) %>입니다.</p>
```

**Flask와 Jinja2**: 파이썬을 기반으로하는 웹 프레임워크입니다. jinja2라는 템플릿 엔진을 사용해 서버 사이드 렌더링을 구현합니다.

```
<p>페이지에 오신 것을 환영합니다, {{ name }}님!
오늘은 {{ now.strftime("%m/%d/%Y") }}입니다.</p>
```


## Tomcat

Tomcat이란 아파치 재단에서 만든 오픈 소스 WAS(Web Application Server)입니다. Tomcat은 Java Servlet과 JSP가 실행할 수 있는 환경을 제공하여 동적인 페이지를 생성합니다. 그리고 DB 연결 및 데이터 조작, 다른 응용프로그램들과 상호 작용이 가능합니다.

기본적으로 WAS 내부에 Web Server가 있기 때문에 WAS만 사용하는 경우도 있지만, Web Server를 따로 뒀을 때의 장점도 분명히 존재한다.

장점
책임 분할을 통해 서버 부하를 방지한다.
정적 컨텐츠는 Web Server, 동적 컨텐츠는 WAS가 담당한다.
하나에 웹 서버에 여러개의 WAS를 연결시켜 웹 서버가 로드 밸런싱 역할을 수행하도록 한다.
앞에 웹 서버를 따로 둘 경우, 웹 서버가 health check를 통해 특정 WAS가 정상적으로 동작하는지 계속해서 확인한다.
제대로 동작하지 않는 WAS가 있는 경우, 웹 서버는 해당 WAS로 요청을 전달하지 않는다.
보안상의 이점이 있다.
WAS는 DB 접근 권한을 갖고 있기 때문에 유출될 경우 보안상의 위험이 있다. 앞단에 웹 서버를 두게되면 웹서버는 Reverse Proxy 역할을 하여 WAS가 외부에 노출되지 않게 할 수 있다.
