---
layout: "post"
title: "select 후 update하는 2가지 방법(oracle)"
date: "2017-02-07 21:32"
tags : oracle
categories : db
---

# Oracle 에서 select 후 update 하는 방법 2가지



## 서브쿼리이용시

```sql
UPDATE tb_table1 a
  id = (SELECT ep_id FROM tb_table2 WHERE ep_id = a.id)
 WHERE or_no IN ('201205020001')
   AND EXISTS (SELECT 1 FROM tb_table2 WHERE ep_id = a.id) ;


 UPDATE book a1
 SET ( name, date ) = ( SELECT name, date FROM a2 WHERE a1.bookid = a2.bookid )
 WHERE a1.bookid IS NOT NULL   
```

## join View 이용시

```sql
UPDATE
/*+ bypass_ujvc */
( SELECT a.content as A,
              b.content as B
  FROM tb_table1 a, tb_table2 b
 WHERE  a.id = b.id
)
SET  A = B  ;

```
