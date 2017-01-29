---
layout: "post"
title: "@SuppressWarning"
date: "2017-01-29 23:21"
categories : java
tags : spring annotation
---

# @SuppressWarning

컴파일러에서 제공하는 경고 중 제외하고자 할때 사용하는 어노테이션이다.

## Options

| Option | Description |
|:--:|:--:|
| all | 모든 경고를 억제 |
|cast | 캐스트 연산자 관련 경고 억제 |
| dep-ann | 사용하지 말아야 할 주석 관련 경고 억제 |
| deprecation | 사용하지 말아야 할 메소드 관련 경고 억제 |
| fallthrough | switch 문에서의 break 누락 관련 경고 억제 |
| finally | 반환하지 않는 finally 블럭 관련 경고 억제 |
|null | null 분석 관련 경고 억제 |
| rawtypes | 제네릭을 사용하는 클래스 매개 변수가 불특정일 때의 경고 억제 |
|uncheched | 검증되지 않은 연산자 관련 경고 억제 |
|unused | 사용하지 않는 코드 관련 경고 억제 |

## 사용 예

```java
    @SuppressWarning("unused")

```

> [참고:블로그](http://jinwoonote.tistory.com/entry/SuppressWarnings-%EC%9D%B4%EA%B1%B4-%EB%AD%90%EC%A7%80)
