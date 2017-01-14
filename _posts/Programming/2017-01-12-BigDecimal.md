---
layout : post
titile : BigDecimal을 사용해야하는 이유
---


>저자 JZ Ventures사의 사장 겸 대표 컨설턴트 John Zukowski

>이 아티클의 영문 원본은 http://java.sun.com/mailers/techtips/corejava/2007/tt0707.html#2
에서 볼수 있습니다.

부동 소수점 숫자 사용은 재미있는 작업이 될 수 있다. 일반적으로 양을 다룰 때 정수가 아니라면 double 형식을 사용하려고 한다. 정수인 경우 일반적으로 int 형식이면 충분하다. 값의 크기에 따라 float나 long도 효과적일 수 있다. 그러나 화폐를 다룰 경우, 이 형식들은 최악의 선택이 되는데, 정확한 값을 제공하지 않을 때도 있기 때문이다. 단지 이진수 형식에 저장 가능한 값만 제공한다. 다음은 합계를 계산하거나 할인을 반영하거나 부가가치세를 추가할 때 double을 사용하면 겪게 되는 문제를 보여주는 간단한 예제이다.

Calc 프로그램은 금액 $100.05로 시작한 다음 사용자에게 10% 할인을 적용하고 다시 5% 부가가치세를 추가한다. 부가가치세율은 다를 수 있지만, 이 예제에서는 5%를 사용한다. 그 결과를 보자면, 이 클래스는 NumberFormat 클래스를 사용하여 결과의 형식을 지정하는데, 이 결과는 통화로 표시되어야 한다.

```java
public class Calc {
 public static void main(String args[]) {
   double amount = 100.05;
   double discount = amount * 0.10;
   double total = amount - discount;
   double tax = total * 0.05;
   double taxedTotal = tax + total;
   NumberFormat money = NumberFormat.getCurrencyInstance();
   System.out.println("Subtotal : "+ money.format(amount));
   System.out.println("Discount : " + money.format(discount));
   System.out.println("Total : " + money.format(total));
   System.out.println("Tax : " + money.format(tax));
   System.out.println("Tax+Total: " + money.format(taxedTotal));
 }
}
```

모든 내부 계산에 double 형식을 사용하면 결과는 다음과 같다.

**
Subtotal : $100.05
Discount : $10.00
Total : $90.04
Tax : $4.50
Tax+Total: $94.55
**

가운데의 Total이 기대하는 값일 수 있으나, 맨 끝의 Tax+Total 값에서 끝난다. 할인은 $10.01이 되어야 $90.04의 금액을 얻는다. 해당 부가가치세를 추가하고 나면 최종 합계가 1센트 늘어나 있다. 세무 당국은 이 점을 이해하지 못할 것이다. 반올림 오류가 문제이다. 이 반올림 오류를 바탕으로 계산한 것이다. 다음은 형식이 지정되지 않은 값이다.

**
Subtotal : 100.05
Discount : 10.005
Total : 90.045
Tax : 4.50225
Tax+Total: 94.54725
**


형식이 지정되지 않은 값을 살펴보자면, 맨 처음 떠오르는 질문은 왜 90.045가 90.05 대신 90.04가 되었는가이다. (즉, 왜 10.005가 10.00으로 반올림되는가?) 이는 소위 RoundingMode에 의해 제어되는데, 이는 Java SE 1.6에 도입된 계수법으로서 이전 릴리스에서는 그러한 제어가 없었다. 통화를 위해 도입된 NumberFormat은 기본 반올림 모드가 HALF_EVEN이다. 즉, 남은 값이 등거리(equidistant)이면 짝수 쪽으로 라운딩된다. 이 계수법에 대한 Java 플랫폼 설명서에 따르면, 통계상 이 방법은 여러 차례의 계산을 거친 후 누적 오류를 최소화한다.

RoundingMode 계수법에서 사용 가능한 또 하나의 모드는 다음과 같다.

CEILING 항상 양수 무한대로 라운딩한다.

DOWN 항상 0으로 라운딩한다.

FLOOR 항상 음수로 라운딩한다.

UP 항상 0으로부터 벗어나서 라운딩한다.

HALF_DOWN 항상 가장 가까운 인접 수로 라운딩한다. 단, 두 인접 수 모두 등거리라면 버림한다.

HALF_UP 항상 가장 가까운 인접 수로 라운딩한다. 단, 두 인접 수가 모두 등거리라면 올림한다.

UNNECESSARY 라운딩할 필요 없이 정확한 결과를 선언한다.

이 문제의 해결 방법을 알아보기에 앞서, 약간 다른 결과를 살펴 보도록 한다. 70센트로 시작하고 할인이 없는 경우이다.


**
Total : $0.70
Tax : $0.03
Tax+Total: $0.74
**


70센트 거래의 경우, 단순히 라운딩 문제가 아니다. 형식 지정 없이 값을 보자면 다음과 같다.

**
Total : 0.7
Tax : 0.034999999999999996
Tax+Total: 0.735
**

부가가치세인 0.035는 double로 저장할 수 없다. 즉, 이진 형식에서 double로 표현할 수 없다.

BigDecimal 클래스는 float 및 double을 사용하는 부동 소수점 연산에서 생기는 문제 몇 가지에서 도움이 된다. BigDecimal 클래스는 사실상 무제한적인 정밀도로 부동 소수점 숫자를 저장한다. 이 데이터를 다루기 위해 add(value), subtract(value), multiply(value) 또는 divide(value, scale, roundingMode) 메소드를 호출한다.

BigDecimal 값을 출력하려면 setScale(scale, roundingMode)로 단위 및 라운딩 모드를 설정하거나 toString() 또는 toPlainString() 메소드를 사용한다. toString() 메소드는 과학적 표기를 사용할 수 있지만, toPlainString()은 그렇지 않다.

BigDecimal을 사용하도록 프로그램을 변환하기 전에 그 생성 방법을 확인하는 것이 중요하다. 이 클래스에는 16개의 구성자가 있다. BigDecimal의 값을 double과 같은 primitive 객체에 저장할 필요는 없으므로 String으로부터 BigDecimal 객체를 만드는 것이 가장 좋다. 이 오류를 보여 주기 위해 간단한 예제를 소개한다.

 double dd = .35;
 BigDecimal d = new BigDecimal(dd);
 System.out.println(".35 = " + d);


예상했던 출력이 아닐 것이다.

 .35 = 0.34999999999999997779553950749686919152736663818359375


그보다는 여기서 보여주는 것처럼 string "35"를 직접 사용하여 BigDecimal을 만들어야 한다.

 BigDecimal d = new BigDecimal(".35");


그 결과 다음과 같은 출력을 얻는다.

 .35 = 0.35   

값을 생성한 후 숫자의 단위와 라운딩 모드를 setScale()을 사용하여 명시적으로 설정할 수 있다. Java 플랫폼의 다른 Number 하위 클래스와 마찬가지로, BigDecimal은 변경할 수 없다. 따라서 setScale()을 호출할 경우 반환 값을 "저장"해야 한다.

 d = d.setScale(2, RoundingMode.HALF_UP);


BigDecimal을 사용하여 수정된 프로그램은 다음과 같다. 계산마다 또 다른 BigDecimal을 사용하고 그 단위를 설정해야 달러 및 센트에 대한 수학 연산이 수행된다. 분할 페니를 사용하려는 경우 단위에서 3개의 소수 자리로 갈 수도 있지만, 꼭 그럴 필요는 없다.

```java
import java.math.BigDecimal;
import java.math.RoundingMode;

public class Calc2 {
 public static void main(String args[]) {
   BigDecimal amount = new BigDecimal("100.05");
   BigDecimal discountPercent = new BigDecimal("0.10");
   BigDecimal discount = amount.multiply(discountPercent);
   discount = discount.setScale(2, RoundingMode.HALF_UP);
   BigDecimal total = amount.subtract(discount);
   total = total.setScale(2, RoundingMode.HALF_UP);
   BigDecimal taxPercent = new BigDecimal("0.05");
   BigDecimal tax = total.multiply(taxPercent);
   tax = tax.setScale(2, RoundingMode.HALF_UP);
   BigDecimal taxedTotal = total.add(tax);
   taxedTotal = taxedTotal.setScale(2, RoundingMode.HALF_UP);
   System.out.println("Subtotal : " + amount);
   System.out.println("Discount : " + discount);
   System.out.println("Total : " + total);
   System.out.println("Tax : " + tax);
   System.out.println("Tax+Total: " + taxedTotal);
 }
}
```


여기서는 NumberFormat이 사용되지 않았다. 하지만 통화 기호를 보여주고 싶다면 다시 추가할 수 있다.

이제 프로그램을 실행하면 훨씬 나은 계산이 수행된다.

**
Subtotal : 100.05
Discount : 10.01
Total : 90.04
Tax : 4.50
Tax+Total: 94.54
**

BigDecimal은 이 예제에서 보여준 것보다 더 다양한 기능을 제공한다. 정수를 사용하는데 무한대의 정밀도가 필요한 경우를 위한 BigInteger 클래스도 있다. 두 클래스에 대한 Java 플랫폼 설명서에서는 단위, MathContext 클래스, 정렬 및 동등(equality)에 대한 정보를 비롯하여 이 클래스와 관련된 자세한 내용을 확인할 수 있다.
