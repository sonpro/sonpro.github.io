---
layout : post
comments : true
title : string format util
---

### String.format 형식

```java
String str = String.format("p1:[%s],p2:[%10s]", "arg1","arg2").replace(" ", "_");
System.out.println(str);
```

![](https://ww2.sinaimg.cn/large/006tNbRwgw1fb9v9d6ikyj30a6018q2y.jpg)

arg값을 format 형식에 맞게 바인딩하여 출력

| 항목 | 내용                                      |
|------|-------------------------------------------|
| %s   | 스트링으로 대치                           |
| %5s  | 숫자 길이만큼 문자열 좌측에 공백을 채운다 |
| %-5s | 숫자 길이만큼 문자열 우측에 공백을 채운다 |
| %.2s | 점오른쪽 숫자만큼 문자열을 자른 후 출력   |

### String Left Padding util

**ex) 문자열 좌측에 0을 채운다**

```java
String str = String.format("%10s", "arg").replace(" ", "0");
```
