---
layout: "post"
title: "Generics - WildCard"
date: "2017-08-11 04:07"
categories : java
tags : generics WildCard
---


## 타입 변수의 제한

제네릭은 'T'와 같은 타입 변수(type variable)를 사용하여 타입을 제한합니다.
이때 extends 키워드를 사용하면 타입 변수에 특정 타입만을 사용하도록 제한할 수 있습니다.

#### 예제

```java
class AnimalList<T extends LandAnimal> { ... }
```

위와 같이 클래스의 타입 변수에 제한을 걸어 놓으면 클래스 내부에서 사용된 모든 타입 변수에 제한이 걸립니다.
이때에는 클래스가 아닌 인터페이스를 구현할 경우에도 implements 키워드가 아닌 extends 키워드를 사용해야만 합니다.

#### 예제

```java
interface WarmBlood { ... }
...
class AnimalList<T extends WarmBlood> { ... } // implements 키워드를 사용해서는 안됨.
 ```

클래스와 인터페이스를 동시에 상속받고 구현해야 한다면 엠퍼센트(&) 기호를 사용하면 됩니다.

#### 예제

```java
class AnimalList<T extends LandAnimal & WarmBlood> { ... }
```

```java
import java.util.*;

class LandAnimal { public void crying() { System.out.println("육지동물"); } }
class Cat extends LandAnimal { public void crying() { System.out.println("냐옹냐옹"); } }
class Dog extends LandAnimal { public void crying() { System.out.println("멍멍"); } }
class Sparrow { public void crying() { System.out.println("짹짹"); } }

class AnimalList<T extends LandAnimal> {
    ArrayList<T> al = new ArrayList<T>();

    void add(T animal) { al.add(animal); }
    T get(int index) { return al.get(index); }
    boolean remove(T animal) { return al.remove(animal); }
    int size() { return al.size(); }
}

public class Generic02 {
    public static void main(String[] args) {
        AnimalList<LandAnimal> landAnimal = new AnimalList<>(); // Java SE 7부터 생략가능함.

        landAnimal.add(new LandAnimal());
        landAnimal.add(new Cat());
        landAnimal.add(new Dog());
        // landAnimal.add(new Sparrow()); // 오류가 발생함.

        for (int i = 0; i < landAnimal.size() ; i++) {
            landAnimal.get(i).crying();
        }
    }
}
```

#### 실행 결과

```
육지동물
냐옹냐옹
멍멍
```

위의 예제는 타입 변수의 다형성을 이용하여 'extends AnimalList' 구문을 생략해도 제대로 동작합니다.
하지만 코드의 명확성을 위해서는 위와 같이 타입의 제한을 명시하는 편이 더 좋습니다.

## 제네릭 메소드(generic method)

제네릭 메소드란 메소드의 선언부에 타입 변수를 사용한 메소드를 의미합니다.
이때 타입 변수의 선언은 메소드 선언부에서 반환 타입 바로 앞에 위치합니다.

#### 예제

```java
public static <T> void sort( ... ) { ... }
 ```

다음 예제의 제네릭 클래스에서 정의된 타입 변수 T와 제네릭 메소드에서 사용된 타입 변수 T는 전혀 별개의 것임을 주의해야 합니다.

#### 예제

```java
class AnimalList<T> {
    ...
    public static <T> void sort(List<T> list, Comparator<? super T> comp) {
        ...
    }
    ...
}
```

## 와일드카드의 사용

와일드카드(wild card)란 이름에 제한을 두지 않음을 표현하는 데 사용되는 기호를 의미합니다.
자바의 제네릭에서는 물음표(?) 기호를 사용하여 이러한 와일드카드를 사용할 수 있습니다.

#### 문법

```
<?>           // 타입 변수에 모든 타입을 사용할 수 있음.
<? extends T> // T 타입과 T 타입을 상속받는 자손 클래스 타입만을 사용할 수 있음.
<? super T>   // T 타입과 T 타입이 상속받은 조상 클래스 타입만을 사용할 수 있음.
 ```


다음 예제는 클래스 메소드(static method)인 cryingAnimalList() 메소드의 매개변수의 타입을 와일드카드를 사용하여 제한하는 예제입니다.

#### 예제

```java
import java.util.*;

class LandAnimal { public void crying() { System.out.println("육지동물"); } }
class Cat extends LandAnimal { public void crying() { System.out.println("냐옹냐옹"); } }
class Dog extends LandAnimal { public void crying() { System.out.println("멍멍"); } }
class Sparrow { public void crying() { System.out.println("짹짹"); } }

class AnimalList<T> {
    ArrayList<T> al = new ArrayList<T>();

    public static void cryingAnimalList(AnimalList<? extends LandAnimal> al) {
        LandAnimal la = al.get(0);
        la.crying();
    }

    void add(T animal) { al.add(animal); }
    T get(int index) { return al.get(index); }
    boolean remove(T animal) { return al.remove(animal); }
    int size() { return al.size(); }
}

public class Generic03 {
    public static void main(String[] args) {
        AnimalList<Cat> catList = new AnimalList<Cat>();
        catList.add(new Cat());
        AnimalList<Dog> dogList = new AnimalList<Dog>();
        dogList.add(new Dog());

        AnimalList.cryingAnimalList(catList);
        AnimalList.cryingAnimalList(dogList);
    }
}
```
#### 결과
```
냐옹냐옹
멍멍
```


[참고 : TCPSCHOOL - 다양한 제네릭표현](http://tcpschool.com/java/java_generic_various)
