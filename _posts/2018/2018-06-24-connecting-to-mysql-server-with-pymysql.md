---
layout: "post"
title: "Connecting to mysql server with pymysql"
date: "2018-06-24 16:18"
categories: "python"
tags: "python mysql"

---

# pymysql library를 사용하여 mysql server(docker container)연결

**client** : eclipse + pydev + pymysql

**server** : docker for windows(mysql server image)

위의 환경으로 진행을 했으나 연결에서 계속 오류가 발생하였다.

>"Access denied for user 'user'@'172.17.0.1'(Using password : no)"

처음에는 권한문제인줄 알고 새로운 계정을 만들기도 하고 database를 변경하기도 하고 client ip에 권한은 등록하기도 했는데 모두 안되었음.

원인은 mysql server 버전이 8.0.11 이였는데 pymysql에서 지원이 원활하지 않은듯 하다.
*'password 접속 방식이 다른가 봄. 정확한 원인은 ...'*

google에서 찾아보면 pymysql을 downgrade 했다는 글을 찾기도 했는데 나는 mysql server를 다운그레이드 하기로 함.

mysql server 5.7 version image를 찾아서 실행하고 다시 pymysql로 connect하니깐 정상적으로 접속되더라

docker 사용도 처음이고 mysql image로 컨테이너 구동하는것도 처음해봤는데 큰 어려움없이 진행할 수 있을 정도로 간단한 편이다.
