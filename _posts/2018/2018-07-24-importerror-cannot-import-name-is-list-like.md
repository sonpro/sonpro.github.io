---
layout: "post"
title: "ImportError : Cannot import name 'is_list_like'"
date: "2018-07-24 21:59"
tags: Python error
categories: python
---

python 실행콘솔(jupyter qtconsole)에서 예제 실행중 오류가 발생하였다
에러로그를 보면 is_list_like 모듈을 import 하지 못한다는 내용이다


```python
Jupyter QtConsole 4.3.1
Python 3.6.5 |Anaconda, Inc.| (default, Mar 29 2018, 13:23:52) [MSC v.1900 32 bit (Intel)]
Type 'copyright', 'credits' or 'license' for more information
IPython 6.4.0 -- An enhanced Interactive Python. Type '?' for help.

import pandas as pd

import pandas_datareader.data as web
---------------------------------------------------------------------------
ImportError                               Traceback (most recent call last)
<ipython-input-2-bc32bb8bec34> in <module>()
----> 1 import pandas_datareader.data as web

C:\DEV\Anaconda3\lib\site-packages\pandas_datareader\__init__.py in <module>()
      1 from ._version import get_versions
----> 2 from .data import (DataReader, Options, get_components_yahoo,
      3                    get_dailysummary_iex, get_data_enigma, get_data_famafrench,
      4                    get_data_fred, get_data_google, get_data_moex,
      5                    get_data_morningstar, get_data_quandl, get_data_stooq,

C:\DEV\Anaconda3\lib\site-packages\pandas_datareader\data.py in <module>()
     12     ImmediateDeprecationError
     13 from pandas_datareader.famafrench import FamaFrenchReader
---> 14 from pandas_datareader.fred import FredReader
     15 from pandas_datareader.google.daily import GoogleDailyReader
     16 from pandas_datareader.google.options import Options as GoogleOptions

C:\DEV\Anaconda3\lib\site-packages\pandas_datareader\fred.py in <module>()
----> 1 from pandas.core.common import is_list_like
      2 from pandas import concat, read_csv
      3
      4 from pandas_datareader.base import _BaseReader
      5

ImportError: cannot import name 'is_list_like'
```

아래와 같이 fred.py 파일의 is_list_like가 포함된 패키지를 변경하면 해결된다
>Because the is_list_like is moved to pandas.api.types, I change the fred.py file which is highlighted in the picture. I replace from pandas.core.common import is_list_like with from pandas.api.types import is_list_like, and it works.
>
