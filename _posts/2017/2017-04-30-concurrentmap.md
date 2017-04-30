---
layout: "post"
title: "concurrenthashmap"
date: "2017-04-30 12:54"
categories : java
tags : map,thread, concurrenthashmap,hashmap,hashtable
---

# Hashtable, HashMap, concurrenthashmap
위에 나열된 클래스들은 Map 인터페이스를 구현한 콜렉션입니다.
기본적으로 map 인터페이스를 구축한다면 <key,value> 구조를 가지게 됩니다

## hashtable
hashtable 은 put,get 과 같은 주요 메소드에 synchronized 키워드가 선언되어 있습니다.
또한, key, value 에 null을 허용하지 않습니다.


## hashmap
hashmap은 주요 메소드에  synchronized 키워드가 없습니다. 또한, hashtable과 다르게 key, value에 null을 입력할 수 있습니다.

## ConncurrentHashMap
hashmap을 thread-safe 하도록 만든 클래스가 concurrenthashmap입니다. 하지만 hashmap과는 다르게 key value에 null을 허용하지않습니다. 또한 putIfAbsent라는 메소드를 가지고 있습니다.

```java
package Post197;

import java.util.concurrent.ConcurrentHashMap;

public class ConcurrentHashMapBasic {

	public static void main(String[] args) {

		ConcurrentHashMap<String, Integer> chm = new ConcurrentHashMap<>();

		// 값 입력
		chm.put("key", 0);

		/*
		 * ConcurrentHashMap은 값에 null을 허용하지 않는다.
		 */
		try{
			chm.put("key1", null); // error!
		} catch( Exception e ){
			e.printStackTrace();
		}

		/*
		 * ConcurrentHashMap은 키값에 null을 허용하지 않는다.
		 */
		try{
			chm.put(null, 0); // error!
		} catch( Exception e ){
			e.printStackTrace();
		}

		/*
		 * putIfAbsent 메소드는 키값이 존재하면 기존의 값을 반환하고
		 * 없다면 입력한 값을 저장한 뒤 반환한다.
		 * 따라서 아래의 코드는 이미 key라는 값에 0이라는 값이 있으므로
		 * key 값은 0을 반환한다.
		 */
		chm.putIfAbsent("key", 1);

		/*
		 * 아래 코드는 key2의 값이 없기 때문에 -1을 저장하고 반환한다.
		 */
		chm.putIfAbsent("key2", -1);

		for( String s : chm.keySet() ){
			System.out.println(chm.get(s)); // print -1, 0
		}
	}
}
```


## Common Methods
위의 세종류의 클래스들은 put, get 메소드 외에도 기본적인 메소드들을 구현하고 있습니다.
대표적인 몇가지의 메소들만 알아봅시다

- clear()
  - 해당 콜렉션의 데이터를 초기화합니다
- containsKey(key)
  - 해당 콜렉션에 입력받은 key를 가지고 있는지 체크합니다
- containsValue(value)
  - 해당 콜렉션에 입력 받은 value 를 가지고 있는지 체크
- remove(key)
  - 해당 콜렉션에 입력받은 key의 데이터(key도 포함)를 제거합니다
- isEmpty()
  - 해당 콜렉션이 비어있는지 체크
- size()
  - 해당 콜렉션의 엔트리 또는 세그먼트 사이즈를 반환합니다.
