---
layout: "post"
title: "Template - Callback Pattern"
date: "2017-01-22 16:53"
categories : java
tags : designpattern
---

# Template - Callback Pattern

여러개의 메소드를 가진 일반적인 인터페이스를 사용할 수 있는 전략 패턴의 전략과 달리 템플릿/콜백 패턴의 콜백은 보통 단일 메소드 인터페이스를 사용

![TemplateCallbackPattern](https://ww1.sinaimg.cn/large/006tKfTcgy1fbzgow4mnsj30cy04q74q.jpg)

1. 클라이언트의 역할은 템플릿 안에서 실행될 로직을 담은 콜백 오브젝트를 만들고 콜백이 참조할 정보를 제공하는 것이다. 만들어진 클라이언트가 템플릿의 메소드를 호출할 때 파라미터로 전달된다.
<span style="color:blue">여기서 콜백은 Anonymous Inner Class로 구현이 되며 템플릿에 파라미터로 전달되는 인터페이스의 메소드를 구현한다 </span>

2. 템플릿은 정해진 작업 흐름에 따라 작업을 진행하다가 내부에서 생선한 참조정보를 가지고 콜백 오브젝트의 메소드를 호출한다.
콜백은 클라이언트 메소드에 있는 정보와 템플릿이 제공한 참조정보를 이용해서 작업을 수행하고 그 결과를 다시 템플릿에 돌려준다.

3. 템플릿은 콜백이 돌려준 정보를 사용해서 작업을 마저 수행한다. 경우에 따라 최종 결과를 클라이언트에 다시 돌려주기도 한다.

<span style="color:red">콜백 재활용을 위하여 꼭 클라이언트에 콜백을 만들기 보다 템플릿에 콜백을 만들어 다른 클라이언트에서도 공통으로 쓸 수 있게 구현하기도 함</span>

<br>
<br>

#### Callback method
![callback method](https://ww3.sinaimg.cn/large/006tKfTcgy1fbzh99ywbcj30hy04ht9e.jpg)

#### Template
![Template](https://ww3.sinaimg.cn/large/006tKfTcgy1fbzh9e490yj30gp086dgq.jpg)
