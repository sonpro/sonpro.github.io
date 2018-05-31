---
layout: "post"
title: "Install Python"
date: "2018-05-26 02:10"
categories : python
tags : python

---

# 윈도우 파이썬 설치

윈도우10에서 파이썬을 설치하는 방법을 알아본다.<br>
사실은 버전업그레이드를 하려고 했으나, python 2.x 과 3.x은 패치 버전이 달라서 별도 설치를 해야하더라.

[How do I upgrade the Python installation in Windows 10?
](https://stackoverflow.com/questions/45137395/how-do-i-upgrade-the-python-installation-in-windows-10)

그래서 기존에 설치된 2.x를 삭제하고 3.x을 다시 설치할 예정.

python3.6 버전을 설치하고 테스트를 하기위하여 BautifulSoup 라이브러리를 설치한다.



### 설치실행 파일
[여기서](https://www.crummy.com/software/BeautifulSoup/bs4/download/4.6/) 파일다운로드 후 아래 명령어를 통하여 실행
```python
python setup.py install
```

### pip에서 다운로드gi
pip(python package manager)를 통하여 실행

```python
pip3 install bs4
```

#### 설치시 오류
설치 후 아래와 같은 오류가 발생함
>You are trying to run the Python 2 version of Beautiful Soup under Python 3. This will not work.''You need to convert the code.... blur blur

[구글링해보니 이전에 beautifulsoup 설치시 python2.x버전용 library가 설치되어 있어서 발생하는 오류](https://stackoverflow.com/questions/31730053/python-3-4-installing-bs4-running-python2-not-python3)라고 함.
기존 lib 파일 제거 후 재설치 필요


**Let's make this easy on you (If your using a 3x version of Python)**

- Go to your Python folder
- Open the scripts folder
- On the white space hold shift, right click and then open a command window
- Type "pip install beautifulsoup4"
- You are done.
