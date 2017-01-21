---
layout: "post"
title: "StringUtil"
date: "2017-01-21 11:14"
categories : java
tags : StringUtil
---
### StringUtil

#### substring
문자열의 좌측에서 range만큼 잘라낸다,(-)값인 경우 우측에서 range만큼 잘라낸다
```java
private static String substr(String str, int range){

		if(str ==  null) return "";
		if(str.length() < Math.abs(range)) return str;

		if(range < 0 ){
			str = str.substring(str.length() + range, str.length());			
		}else{
			str = str.substring(0, range);
		}
		return str;
	}
```
