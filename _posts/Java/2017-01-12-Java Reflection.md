---
layout : post
title : java-reflection
---



Java Reflection
리플렉션이란 객체를 통해 클래스의 정보를 분석해 내는 프로그램 기법을 말한다. 투영, 반사 라는 사전적인 의미를 지니고 있다.

Reflection으로 동적으로 인스턴스를 생성 할 수 있다

if/else 문을 이용한 Factory

```java
public class MouseFactory{
 public Object getInstance(String name){
     if(name.equals("a")){
         return new MouseA();
     }else if(name.equals("b"){
         return new MouseB();
     }
     return null;
 }
}
```


Reflection 을 이용한 Factory

```java
public class MouseFactoryReflection{
    public Object getInstance(String className) throws Exception{
    Class cls = Class.forName(className);
    Constructor constructor = cls.getConstructor();
    return constructor.newInstance();
    }
}
```
