---
layout: post
categories:
  - db
tags:
  - db
  - oracle
---

#### 동시성 제어가 어려운 이유

동시성(Concurrency)과 일관성(Consistency)은 트레이드오프(Trade-off)관계에 있다. 도시성을 높이려고 Lock의 사용을 최소화하면 읽기 일관성을 유지하기 어렵고, 데이터 일관성을 높이기 위해 Lock을 많이 사용하면 동시성이 떨어진다

#### Dirty Read

커밋되지 않은 수정 중인 데이터를 달느 트랜잭션에서 읽을 수 있도록 허용할때 발생 갱신중인 레코드는 배타적 Lock 이 걸림, 이는 공유 Lock과 호환되지 않아 갱신중인 레코드는 읽지 못함


#### 비관적 동시성 제어]
nowait 옵션을 함께 사용하면 Lock을 얻기위해 무한정 기다리지 않아도 된다
-	wait 또는 nowait 옵션을 이용하면 다른 트랜잭션에 의해 Lock이 걸렸을 때 Exception을 만나게 되므로 alert을 출력하고 트랜잭션을 종료할 수 있다
-	select for update skip locked 라는 기존 locking 범위를 skip하는 옵션도 9i부터 지원되는 undocumented된 방법이며 과거부터 AQ(Advanced Queuing) 기능을 위해 존재했던 기능이기도 하다

**for update nowait** : 대기없이 Exception(ORA-00054)를 던짐

**for update wait 3** : 3초 대기 후 Exception(ORA-30006)을 던짐


#### 낙관적 동시성 제어

낙관적 동시성 제어는 (Optimistic Concurrency Control) 는 사용자들이 같은 데이터를 동시에 수정하지 않을 것이라고 가정한다. 읽는 시점에는 Lock을 사용하지 않지만 데이터를 수정하고자 하는 시점에 앞서 읽은 데이터가 다른 사용자에의한 변경여부를 반드시 확인해야 한다. 낙관적 동시성 제어를 사용하면 Lock이 유지된느 시간이 매우 짧아져서 동시성을 높이는데 유리하다. 낙관적 동시성 제어에도 update 전에 for update nowait문을 select절고 함께 한번 더 수행하면 다른 트랜잭션에 의해 설정된 Lock에 의한 동시성 저하를 예방할 수 있다.

오라클 10g부터 제공되는 pseudo컬럼 ora_rowscn을 활용하면 timestamp를 오라클이 직접 관리해 주므로 쉽고 완벽하게 동시성 제어가 가능하다 ora_rowscn pseudo컬럼을 이용하면 특정 레코드가 변경 후 커밋된 시점을 추적할 수 있다 단 이 값을 이용해 정확한 동시성을 제어하려면 테이블을 생성할때 아래와 같은 옵션을 사용해야 한다 아래와 같은 옵션을 사용해야 row단위로 scn을 기록하기 때문이다

```sql
create table t ROWDEPENDENCIES nologging as select * from scott.emp;
```

기본값은 norowdependencies 이며 이는 블록 단위로 기록한다.
이는 기본값으로 설정되어 있을때는 한 블록 내에서 레코드 하나만 변경하고 커밋하더라도 블록 내 모든 레코드의 ora_rowscn이 변경된다

-	ora_rowscn은 영구히 저장되는 값이지만 이는 시간정보로 변환하는 데는 정해진 기한이 있다. SMON 프로세스는 내부적으로 SCN과 Timestamp간 매핑정보를 관리, 오라클은 이 매핑 정보(sys.smon_scn_time테이블)를 이용 scn_to_timestamp 함수를 구현했다. 그러나 이 매핑 테이블의 보관 주기는 5일 이다. 이 시간이 지나면 매핑값을 찾을 수 없기에 오류(ORA-08181)를 발생한다. ORA-08181 Invalid system change number specified. 단순히 동시성 제어를 위해서만 사용하면 ora_rowscn을 활용하는 것이 효과적이다. 그러나 변경 일시 정보를 다른 용도로 사용할 것이라면 기존 방식대로 구현해야 한다.

> [출처:비관적 vs 낙관적 동시성 제어](http://wiki.gurubee.net/pages/viewpage.action?pageId=3900395)
