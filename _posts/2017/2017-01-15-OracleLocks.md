---
layout : post
title : oracle lock의 종류
categories : db
tags : lock oracle

---


### Lcok 이란

락이란 멀티유저가 사용하는 데이터 베이스 환경에서 Concurrency 와 Consistency, 그리고 무결성을 유지하기 위한 기능이다 래치가 SGA를 보호 한다면, 락은 데이터베이스 전체를 보호한다고 할 수 있다.

테이블, 트랜잭션, 언두세그먼트, 테이블 스페이스, 잡(JOB)등 데이터베이스 단위에서 필요한 대부분의 리소스들은 락의 보호를 필요로 한다 데이터베이스가 세션의 데이터 변경 작업을 허용하기 전에 먼저 세션은 변경 할 데이터에 대해 반드시 잠금을 설정해야 한다 잠금은 세션에게 배타적 제어권을 부여하며, 잠금이 해소되기 전까지 다른 트랜잭션이 해당 데이터를 변경하지 못하도록 한다.

트랜잭션은 데이터의 개별행, 복수 개의 행 또는 전체 테이블에 잠금을 설정 할 수 있다. Oracle database 10g는 수동 및 자동 잠금을 모두 지원하며, 자동으로 설정된 잠금ㅇ느 다른 트랜잭션과의 잠재적 혼란을 최소화하기 위해 최소한의 수준의 락이 설정된다

### Types of Locks

락은 매우 쉬운 개념이지만, 실제로는 상당히 혼란스러운 면이 있다. 첫째 락에 대한 정확한 분류가 존재하지 않는다는 것과 둘째 Enqueue락과 일반 락과의 정확한 구분이 존재하지 않는다는 것에 기인한다.

아래의 분류는 상당히 논리적인 측면이 강하며 락의 활용도를 이해하는데는 도움이 되지만 락의 실제 작동 매커니즘을 이해하는데는 오히려 혼란을 야기하는 측면이 있다

**오라클 concept 매뉴얼에서의 락분류**

-	DML Locks(data locks)
	-	Row locks(TX)
	-	Table locks(TM) : None, Null, RX, RS, S SRX, X
-	DLL Locks(dictionary locks)
	-	Exclusive DDL locks
	-	Share DDL locks
	-	Breakable Parse Locks
-	Internal locks and latches
	-	Latches
	-	Internal locks
	-	Dictionary Cache locks
	-	File and log management locks
	-	tablespace and rollback segment locks

**OWI에서의 락의 분류**

-	Enqueue Lock
	-	User Type Lock : TX, TM UL
	-	System Type Lock : CF, US, CI, TC, JS, ....
-	Normal Lock
	-	row cache lock
	-	library cache lock, library cache pin
	-	buffer lock

### DATA LOCK

유저가 `insert, delete, update, select..from FOR UPDATE OF` 문장을 실행하면, 변경되는 ROW에 대한 ROW LOCK과 TABLE에 대한 TABLE LOCK이 생긴다

**ROW LOCK(TX)** : `insert into...value...;` , `delete from... where ...`,`update...set...where...for update of...` sql 문장에서 where 조건에 해당되는 row에 대하여 다른 유저들이 변경할 수 없도록 EXCLUSIVE LOCK 이 생긴다. TX LOCK이 걸린 ROW는 DML문장을 실행한 유저가 commit이나 rollback을 할 때 까지 걸리므로 다른 유저들이 변경할 수 없다.

**TABLE LOCK(TM)** : TX LOCK이 걸린 ROW가 저장된 TABLE에 대한 LOCK이다.DML SQL문장을 수행하는 중에, 해당 테이블이 ALTER나 DROP되는 것을 방지하기 위해서 TM LOCK을 사용한다. 또 TM LOCK에는 RS(ROW SHARE), RX(ROW EXCLUSIVE), S(SHARE), SRX(SHARE ROW EXCLUSIVE), X(EXCLUSIVE) 가 있다. 이런 TABLE LOCK MODE는 같은 테이블에서 실행 할 수 있는 SQL문장과 실행할 수 없는 SQL문장을 구분하기 위해서다. 예를 들어서 한 유저가 사원 테이블을 UPDATE할때, 다른 유저가 사원 테이블을 DROP하려고 한다고 가정하자

### TABLE LOCK MODE

**RS(ROW SHARE LOCK)** `SELECT ... FROM ... WHERE ... FOR UPDATE OF ...;` 이나 `LOCK TABLE ... IN ROW SHARE MODE;` 명령에 의해 해당 테이블에는 RS LOCK 이 생긴다. RS LOCK이 걸린 테이블에는 RS, RX, S, SRX LOCK 을 걸 수 있고, X LOCK은 걸 수 없다. 단, SELECT ... FROM ... FOR UPDATE OF 명령에 의해 WHERE 조건에 걸린 ROW에 대해서는 TX LOCK이 생기므로 이 ROW에 대해서 UPDATE, DELETE, 를 실행할때는 테이블에 대해서는 RX LOCK이 생기므로 에러는 안나지만, COMMIT 이나 ROLLBACK 할때까지 WAITING을 한다. SELECT ... FOR UPDATE OF; 문장은 테이블에는 RS LOCK 이므로 에러는 안나지만, ROW에 대해서는 TX LOCK 이 걸리므로 WAITING한다.

**RX(ROW EXCLUSIVE LOCK)**`UPDATE...; INSERT INTO....; DELETE FROM...;` 이나 `lock...in row exclusive mode;` 명령에 의해 테이블에 걸리는 LOCK이다. RX LOCK도 RS LOCK과 비슷한 내용이고, 단지 S,SRX,X LOCK을 걸 수 없다.

**S(SHARE LOCK)**`lock...in share mode;` 에 의해 테이블에 생긴 lock 이다. s lock은 같은 테이블에 대해서 RS,S LOCK 만 가능하고, RX, SRX, X LOCK을 걸 수는 없다.

```sql
sql> lock table emp in share mode;
--사원 테이블에는 insert update, delete  할 수 없다
```

**SRX(SHARE ROW EXCLUSIVE)**`LOCK TABLE ... IN SAHRE ROW EXCLUSIVE MODE;` 에 의해 테이블에 생긴 lock이다 SRX LOCK은 같은 테이블에 대해서 RS LOCK만 가능하고 RX, SRX,S, X LOCK을 걸 수 없다

```sql
SQL> LOCK TABLE 사원 IN SHARE ROW EXCLUSIVE MODE;`
--사원 테이블에 select... for update of; 는 가능하지만 insert, delete, update는 할 수 없다
```

**X(EXCLUSIVE)**`lock table... in EXCLUSIVE mode;` 에 의해 테이블에 생긴 lock이다 x lock은 같은 테이블에선느 어떠한 lock도 걸 수 없다. 즉, drop table...; alter table...; 등의 DDL문장에 의해 테이블에 생기는 lock이다.

![sql locks](http://i.imgur.com/KCX2Axk.png)

**S** : 테이블 전체에 락을 건다. index 해결책**SRX** : DML금지 S락도 금지 index 해결책**RS** : row share**RX : row exclusive**S\** : share**SRX** : share row exclusive**X** : exclusive

### Data Dictionary lock

딕셔너리 잠금을 개체의 구조를 보호함. 딕셔너리 잠금은 테이블이나 뷰를 정의(스키마 정의)한 부분을 보호함 DDL잠금은 프로시저에서 참조된 개체가 이 프로시저의 컴파일이 완료되기 전에 변경되거나 삭제되는 것을 방지

#### Type

**Exclusive DDL Locks** : 특정 DDL작업은 동일한 개체를 수정하거나 참조할 수 있는 다른 DDL작업의 파괴를 막기위해 자원에 대해서 lock

**Share DDL Locks** : 서로 충돌하는 DDL작업의 파괴적인 방해 작용을 막기 위해 자원에 대한 공유 DDL Lock(이 트랜잭션이 진행되는 동안에는 참조된 개체 정의가 일정하게 됨)

**Breakable Parse Locks** : 공유 풀에 있는 SQL명령문 또는 PL/SQL 프로그램 단위는 자신이 참조하는 각 개체에 대한 구문 분석 잠금(참조된 개체가 변경되거나 삭제되면 관련된 공유 SQL영역이 무효화될 수 있도록 하기 위해)

> 출처 : [옹's : 오라클 lock의 종류](http://m.blog.daum.net/_blog/_m/articleView.do?blogid=0Frx9&articleno=7333091)
