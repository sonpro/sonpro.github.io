---
layout: "post"
title: "Redirection"
date: "2017-01-17 00:10"
categories : tips
tags : Redirection pipe
---

# Redirection

데이터 입출력 방향을 바꾸어 주는 것

```shell
dir > test.txt
```
> dir 명령어에 대한 출력방향을 화면이 아닌 파일로 redirect 해라(output redirection)

```shell
sort < test.txt
```
> test.txt의 내용을 sort해라(input redirection)

<br><br>



# Piping

복수의 명령어들을 서로 결합시키는 것

```shell
dir | sort
```

>dir 명령의 화면 출력 결과를 sort라는 명령으로 보내라

[출처:mwultong's blog](http://mwultong.blogspot.com/2006/07/redirection-piping.html)
