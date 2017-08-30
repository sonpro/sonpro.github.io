---
layout: "post"
title: "Access specifier in JAVA "
date: "2017-08-30 23:10"
categories : JAVA
tags : AccessSpecifier
---


# 접근 지정자

클래스의 멤버 각각에 외부에서 접근할 수 있는 범위를 지정하는 접근 지정자를 둘 수 있다.

  |접근지정자  | 접근범위  | 동일클래스  |동일패키지   |  다른패키지의 자식클래스|다른패키지|
--|---|---|---|---|--
  |public   |접근제한없음   |yes   |yes   | yes| yes|
  |protected   |동일 패키지와 상속받은 클래스 내부   |yes   |yes   |  yes||
  |default   |동일 패키지 내에서만   |yes   |yes   |  |
  |private   |동일 클래스 내에서만   |yes   |   |

## public
공개정도가 가장 높고 어디에서든 자유롭게 접근할 수 있다

## protected
같은 패키지 내에서 접근이 가능하고 다른 패키지에서도 상속을 받은 클래스 내부에서는 사용 가능하다.
public 과 다른 점은 다른 패키지의 자식 클래스 외부에서는 접근 할 수 없다는 것이다.

## default(package private)
같은 패키지 내에서만 접근이 가능하다.아무런 접근 지정자도 없을 경우 이 옵션이 자동으로 적용된다

## private
동일 클래스 내에서만 접근이 간으한 가장 낮은 단계의 자유도를 갖는다
