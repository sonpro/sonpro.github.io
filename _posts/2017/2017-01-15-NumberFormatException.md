---
layout : post
title : Mybatis에서 NumberFormatException
categories : db
tags : oracle mybatis NumberFormatException

---


**java**


```sql
item.setVal("Y");
sampleDao.select("sql",item);
```


**sqlmapper.xml**


```xml
<select id="sql">
    select col
    from tbl
    <if test="val=='Y'">
    where col='Y'
    </if>
</select>
```

<p>위와 같은 구조에서 NumberFormatException 이 발생하였다</p>

<p>위와 같은 상황을 피하기 위해서는 다음과 같은 해결책이 존재한다. <br>
1. <code>&lt;if test=’stringValue == “Y”‘&gt;</code> – 쌍따옴표와 홑따옴표의 위치를 변경 <br>
2. <code>&lt;if test=”stringValue == &amp;quot;Y&amp;quot;”&gt;</code> – 쌍따옴표를 HTML 코드로 변경 <br>
3. <code>&lt;if test=”stringValue == ‘Y’.toString()”&gt;</code> – toString() 함수를 사용해 String 형으로 변환</p>

<blockquote>
  <p>출처:<a href="http://t-ara72.blogspot.kr/2013/10/mybatis-numberformatexception.html?m=1">mybatis에서 NumberformatException이 나는 경우 <br>
  </a></p>
</blockquote>
