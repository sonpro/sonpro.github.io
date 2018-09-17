---
layout: "post"
title: "mysql 원격 접속하기"
date: "2018-09-17 23:01"
categories: "database"
tag: mysql remote db
---

#mysql 서버 원격 접속하기 

홈서버에 mysql docker image 를 받아 컨테이너 올리고 원격으로 접속해본다.

## server 

- windows 10 + docker(mysql)
- port forwarding(external port -> docker port)


## client

- ipad pro
- query db(app)
- openvpn + home router


홈공유기에 vpn 연결 후 내부ip로 접속하는 것이라 당연히 될 줄 알았지만...오류!!

오류 메시지를 캡처하지는 못했지만 메시지 내용은 

> 'caching_sha2_password' cannot be loaded ... 

위의 메시지 였는데 삽질끝에 [stackoverflow](https://stackoverflow.com/q/49194719) 를 참고하여 해결하였다.

계정 생성 구문에 identified with mysql_native password by 'password' 옵션을 준다

```sql
ALTER USER 'username'@'ip_address' IDENTIFIED WITH mysql_native_password BY 'password';
```


