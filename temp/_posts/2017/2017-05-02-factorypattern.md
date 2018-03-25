---
layout: "post"
title: "FactoryPattern"
date: "2017-05-02 00:38"
categories : java
tags : designpattern, FactoryPattern

---

# Super class
factory pattern 에서 super class는 interface, abstract class 또는 일반적인 java class가 될수 있다.

```java
public abstract class Product{
    public abstract String getName();
    public abstract int getPrice();

    @override
    public String toString(){
      return "product name : " + getName() + ", price : " + getPrice();
    }
}
```

# Sub class

product class 를 상속받은 Computer와 Ticket class 를 구현한다. 아래의 클래스들은 super class 하위의 sub class를 정의한 것이다.

```java
public class Computer extend Product {
  private String name;
  private int price;

  public Computer(String name, int price){
    this.name = name;
    this.price = price;
  }

  @override
  public String getName(){
    return this.name;
  }

  @override
  public int getPrice(){
    return this.price;
  }

  public void toString(){
    System.out.println("항목 :: "+ this.name + "가격 :: "+ this.price);
  }
}
```

```java
public class Ticket extends Product {
    private String name;
    private int price;

    public Ticket (String name, int price) {
        this.name = name;
        this.price = price;
    }

    @Override
    public String getName() {
        return this.name;
    }
    @Override
    public int getPrice () {
        return this.price;
    }

    public void toStrig () {
        System.out.println("항목 :: " + this.name + ", 가격 :: "+ this.price);
    }
}
```

## Factory class

```java
public class ProductFactory {
  public static Product getProduct(String type, String name, int price){
    if("ticket".equals(type)){
      return new Ticket(name, price);
    }else if("computer".equals(type)){
      return new Computer(name, price);
    }
    return null;
  }
}

```java
public class main{
  public static void main(){
    Product p1 = ProductFactory.getProduct("Ticket"," travel", 1000);
    Product p2 = ProductFactory.getProduct("computer","pc",500);

  }
}
```

>Factory Pattern 은 구현체보다는 인터페이스 코드 접근에 좀 더 용이하다
> Factory Pattern은 클라이언트 클래스로부터 인스턴스를 구현하는 코드를 떼어내서, 코드를 더욱 탄탄하게 하고 결합돌르 낮춘다
>  Factory pattern은 구현과 클라이언트 클래스들의 상속을 통해 추상적인 개념을 제공한다.


[출처:Seotory](https://blog.seotory.com/post/2016/08/java-factory-pattern)
