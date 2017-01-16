---
layout: "post"
title: "OracleNullData"
date: "2017-01-15 09:42"
categories : db
tags : oracle null
comments : true
---


### Null Data

어떤 값인지는 알 수 없지만 공간을 점유하고 있는 데이터
값 자체의 정확한 수치를 나타낼 수는 없지만 상위 개념에서 null data 라 칭함

`IS NULL` : 해당 조건을 통해 널 데이터를 추출 할 수 있음

`IS NOT NULL` : 해당 조건을 통해 널 데이터를 제외하고 추출 할 수 있음

`<>=` : 비교조건을 통해 널 데이터를 ** 비교 불가능함 (false return)**

`+-\*/ ` : null이 들어간 산술 조건은 모든 값이 null이 됨

`COUNT(\*)` : null 데이터를 모두 인식 함

`MAX,SUM,MIN,AVG` : null 데이터 모두 무시 함

`ORDER BY` : null 값을 **제일 작은 값**으로 인식 함(ms-sql의 경우 제일 큰값 으로 인식)

`JOIN` : null 데이터 모두 무시 함(오라클 내부적으로 not null 조건이 추가 됨)

`‘’` :  null로 인식함


[출처] null이란?|작성자 Dr금
