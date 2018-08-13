---
layout: "post"
title: "convert multi index to single index  reset_index"
date: "2018-07-28 15:36"
categories : python
tags: dataframe index
---

#Panas dataframe 의 index 변경하기

Pandas dataframe 자료구조는 index 와 column을 가진다

아래의 data를 보면 index가 여러개(symbol, date)를 가지는 multi index 구조다

```python
data.head()
Out[217]:
                     Close     High      Low     Open     Volume
Symbol Date
AAPL   2010-01-01  30.1046  30.4786  30.0800  30.4443          0
       2010-01-04  30.5729  30.6429  30.3400  30.5000  123432050
       2010-01-05  30.6257  30.7986  30.4643  30.6843  150476004
       2010-01-06  30.1386  30.7471  30.1071  30.6257  138039594
       2010-01-07  30.0829  30.2857  29.8643  30.2400  119282324
```

## reset_index

index 중에 symbol을 제거하고 싶은 경우 아래와 같이 한다

바로 삭제할수는 없어서(?).. 일반 열 데이터로 올리고 해당 컬럼을 삭제하는 방식
아마 바로삭제도 할수있을것같지만 더 찾아보지는 않음 -_-;

```python


In [224]: data=data.reset_index('Symbol')

In [226]: data.head()
Out[226]:
           Symbol    Close     High      Low     Open     Volume
Date
2010-01-01   AAPL  30.1046  30.4786  30.0800  30.4443          0
2010-01-04   AAPL  30.5729  30.6429  30.3400  30.5000  123432050
2010-01-05   AAPL  30.6257  30.7986  30.4643  30.6843  150476004
2010-01-06   AAPL  30.1386  30.7471  30.1071  30.6257  138039594
2010-01-07   AAPL  30.0829  30.2857  29.8643  30.2400  119282324


In [227]: data = data.drop('Symbol',axis=1)

In [228]: data.head()
Out[228]:
              Close     High      Low     Open     Volume
Date
2010-01-01  30.1046  30.4786  30.0800  30.4443          0
2010-01-04  30.5729  30.6429  30.3400  30.5000  123432050
2010-01-05  30.6257  30.7986  30.4643  30.6843  150476004
2010-01-06  30.1386  30.7471  30.1071  30.6257  138039594
2010-01-07  30.0829  30.2857  29.8643  30.2400  119282324

```

### 인덱스 삭제

찾아보니 DataFrame의 인덱스도 바로 삭제가 가능하다!

 ```python
del df.index.name
 ```
