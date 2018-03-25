---
layout: "post"
title: "EncodingTest"
date: "2017-07-27 00:08"
categories: java
tags: encoding, euc-kr
---
# Java Encoding Test
## 현황 및 문제점
외부연계시 "딻","핣" 등 utf-8에서 표현가능한 문자가  euc-kr로 변환시 character set에 없는 문자의 경우 parsing exception이 발생함

## 해결
문자열을 euc-kr 로 선변환 후 값 전달
(character set 에 없는 문자의 경우 '?'로 표시됨)

## Test Code
```java
package Encoding;

import java.io.UnsupportedEncodingException;

public class EncodeTest {

	public static void main(String[] args) {
		char c;

//		String str = "꺟A아햛똠방";
		String str = "가aA1~!@#똚$%^합햛";


		for(int i=0; i<str.length();i++){
			c = str.charAt(i);
			System.out.println(c + " ascii ["+(int)c+"] hex ["+Integer.toHexString(c)+"]");
		}

		System.out.println("------------------------------------");

		try {
			str = new String(str.getBytes("euc-kr"),"euc-kr");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("encoded ["+str+"]");

		System.out.println("------------------------------------");

		for(int i=0; i<str.length();i++){
			c = str.charAt(i);
			System.out.println(c + " ascii ["+(int)c+"] hex ["+Integer.toHexString(c)+"]");
		}

//		for(int i=0; i<str.length();i++){
//			c = str.charAt(i);
//			if(c <= 0x00 || c >= 0xff){
//				System.out.println(c);
//			}
//
//		}
	}

}

```
