---
layout: "post"
title: "특정컬럼명을 사용하는 테이블 검색"
date: "2017-08-31 00:40"
categories : db
tags : sql
---

## TABLE :  ALL_TAB_COLUMNS

ALL_TAB_COLUMNS 테이블은 각 테이블의 컬럼정보를 가지고 있다.


```sql

SELECT TABLE_NAME
    ,COLUMN_NAME
FROM ALL_TAB_COLUMN
WHERE COLULMN_NALME LIKE 'AW_NUMBER'
AND TABLE_NAME LIKE 'ALL%'

```
