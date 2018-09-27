---
layout: "post"
title: "Linux timezone 설정하기"
date: "2018-09-25 08:01"
categories: "linux"
tag: linux ubuntu timezone date
---

# Linux Timezone 설정하기



docker로 mysql-server 이미지를 받아서 컨테이너를 올리면 localtime 이 맞지않아 현재 시간과 다른경우가 있다.

이때 linux의 localtime 을 현지 시간으로 변경하여 시간을 맞추는 방법을 알아본다.

먼저 timezone의 지역 리스트를 확인한다.

### Step.1 timezone file list 확인

![step1](/images/20180925/IMG_0344.JPG)


### Step.2 설정할 timezone file 확인

Asia 폴더 내 seoul 파일 확인

![step2](/images/20180925/IMG_0346.JPG)

### Step.3 localtime link 생성하기

서울 timezone 파일을 localtime 으로 링크생성하기

![step3](/images/20180925/IMG_0348.JPG)