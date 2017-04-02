---
layout: "post"
title: "SpringConfiguration"
date: "2017-04-02 23:11"
tags : spring
categories : java
---


# Spring 환경설정

## Spring 3.x 에서 @configuration annotation 사용할 경우 문제

Spring에서 application-context.xml 설정파일을 사용하지 않고 다음과 같이 Configuration을 지정하여 Bean을 사용할 경우 오류가 발생한다.

**Source :**
```java
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {

	@Bean
   //...

}
```

**Error :**
```java
org.springframework.context.support.AbstractApplicationContext prepareRefresh
//...
Exception in thread "main" java.lang.IllegalStateException:
CGLIB is required to process @Configuration classes.
Either add CGLIB to the classpath or remove the following
@Configuration bean definitions: [appConfig]
//...
at com.mkyong.core.App.main(App.java:12)
```

문제원인은 @Configuration 어노테이션을 spring 3 에서 사용시  CGLIB  library를 추가해줘야한다.
(maven pom.xml파일에 dependency를 추가해주면 됨)

```xml
<dependency>
	<groupId>cglib</groupId>
	<artifactId>cglib</artifactId>
	<version>2.2.2</version>
</dependency>

```


[Ref:mkyong](https://www.mkyong.com/spring3/cglib-is-required-to-process-configuration-classes/)
