---
layout: "post"
title: "오라클에서 테이블별 레코드수 count 조회"
date: "2017-01-17 00:26"
categories : db
tags : oracle count
---

```sql
SELECT table_name
          , num_rows -- 통계정보 건수
           , TO_NUMBER(
             dbms_xmlgen.getxmltype('SELECT COUNT(*) c FROM ' || table_name).Extract('//text()')
         ) num_rows2 -- 실제측정 건수
FROM user_tables
ORDER BY num_rows2 desc;

```
