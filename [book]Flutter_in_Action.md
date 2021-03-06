> Flutter in Action [에릭 윈드밀 지음, 우정은 옮김] <한빛미디어>



![](md-images/Flutter_in_Action.jpg)



# 1장 플러터

> 개발자로 반드시 알아야 할 플러터의 네 가지 주요 개념
>
> > 플러터는 리액티브다
> >
> > 모든 것은 위젯이다
> >
> > State 객체는 오래 살아남으며 종종 재사용된다
> >
> > 위젯의 제약은 부모가 서술한다



## 1.6 다른 모바일 개발 옵션

> 플러터와 다른 개발환경 비교



### 1.6.1 네이티브 개발

- 장점
  - 앱을 가장 완벽하게 제어하고, 디버깅 도구, 성능을 최대로 활용할 수 있음
- 단점
  - 플랫폼별로 앱을 두 번 구현해야 함



### 1.6.2 자바스크립트 기반 크로스 플랫폼

> 웹뷰, 리액트 네이티브 같은 자바스크립트 기반의 크로스 플랫폼

- 단점
  - 네이티브 개발 경험을 쌓을 수 없음
  - 자바스크립트 다리 - 병목현상 발생, 디버깅이 어려움, 속도가 느림
- 장점
  - 모든 프런트엔드 웹 개발자가 모바일 앱 개발에 참여하고 도울 수 있다



- 비교 - 플러터

  > 두 가지 요소 덕분에 앱이 네이티브로 구동됨

  - ARM 코드로 컴파일
    - ARM : 최신 모바일 디바이스, 웨어러블, 사물인터넷 기기 등에 사용하는 프로세서
  - 자체 렌더링 엔진 탑재



#### 렌더링 엔진

> Rendering engine - 화면상에 텍스트와 이미지를 그려주는 소프트웨어
>
> A **rendering engine** is software that draws text and images on the screen.
> The engine draws structured text from a document (often [HTML](https://developer.mozilla.org/en-US/docs/Glossary/HTML)), and formats it properly based on the given style declarations (often given in [CSS](https://developer.mozilla.org/en-US/docs/Glossary/CSS)). Examples of layout engines: [Blink](https://developer.mozilla.org/en-US/docs/Glossary/Blink), [Gecko](https://developer.mozilla.org/en-US/docs/Glossary/Gecko), EdgeHTML, [WebKit](https://developer.mozilla.org/en-US/docs/Glossary/WebKit).



## 1.7 플러터의 장점



### 1.7.1 자바스크립트 다리가 없음

- 플러터는 실제 네이티브 코드로 컴파일
- 크롬이 사용하는 렌더링 엔진 (스키아 [ Skia ])를 사용하여 실행 시 다트를 변환하지 않는다
- 따라서 사용자의 디바이스에서 플러터 앱을 실행해도 성능이나 생산성이 저하되지 않는다



### 1.7.2 컴파일 시간

- 플러터에서 전체 컴파일은 보통 30초가 걸리며, 핫 리로드 덕분에 점진적 컴파일은 1초 내외이다



### 1.7.3 한 번 구현하고, 한 번 테스트하고 모든 곳에 배포

- 다트 유닛 테스트는 아주 쉬우며, 플러터는 테스팅 위젯 라이브러리를 제공한다



### 1.7.4 코드 공유



## 1.8 플러터가 앞으로 제공할 혜택 : 웹&데스크톱 앱



## 1.9 플러터 동작 원리 간단 소개

> 넓은 의미로 플러터는 웹의 리액트처럼 **리액티브**, **선언형**, 조합할 수 있는 **뷰 계층 라이브러리**다
> (플러터는 **렌더링 엔진도 포함**하므로 **리액트와 브라우저를 합한 것** 과 비슷하다)
>
> 즉 위젯이라는 작은 컴포넌트를 조합해 모바일 UI를 만든다
> 플러터의 모든 것은 위젯이며, 위젯은 뷰를 묘사하는 다트 클래스이다



### 1.9.1 모든 것이 위젯

- 레이아웃 : Row, Column, Scaffold, Stack
- 구조 : Button, Toast, MenuDrawer
- 스타일 : TextStyle, Color
- 애니메이션 : FadeInPhoto, Transform
- 위치와 정렬 : Center, Padding



### 1.9.2 위젯으로 UI 만들기

> 플러터는 상속(inheritance)보다 조합(composition)을 우선시하며, 이를 이용해 고유한 위젯을 만든다
>
> 위젯은 다양한 생명주기(life cycle) 메서드와 객체 멤버를 포함한다
> 가장 중요한 메서드 중 하나는 build()이다. 모든 플러터 위젯은 build() 메서드를 반드시 정의해야 한다
> build()메서드는 반환하는 위젯을 통해 뷰를 실질적으로 묘사한다

```dart
Class CustomWidget extends Button{}
///상속으로 커스텀 위젯을 만들지 않기 때문에, 위의 코드는 올바른 코드가 아니다
```

```dart
Class CustomWidget extends StatelessWidget{
    @override
    build(){
        return Center(
            child: Button(
                child: Text('조합으로 만드는 올바른 커스텀 위젯의 예시'),
            ),
        );
    }
}
```



### 1.9.3 위젯 형식

> p46 그림 1-9 참고

- 상태가 없는 위젯 (StatelessWidget)
  - 어떠한 정보를 저장하지 않으므로 위젯이 사라져도 별 일이 없다 (상태 정보가 없음)
  - 언제 리빌드해야 하는지  프레임워크에 알리지 않는다
  - 프레임워크가 위젯을 언제 리빌드해야 하는지 알려준다
  - 생명주기가 없다 (?)
- 상태가 있는 위젯 (StatefulWidget)
  - 항상 State 객체를 갖는다 (상태 정보가 필수)
  - setState라는 특별한 메서드로, 언제 리빌드해야 하는지를 프레임워크에 알린다
  - 생명주기
    1. 객체가 만들어 질 때, 위젯과 관련된 State 객체를 만든다
    2. 위젯이 마운트되면 플러터가 initState를 호출한다
    3. 상태를 초기화하면 플러터가 위젯을 빌드한다 (화면에 위젯이 그려짐)
    4. 다음 세 가지 이벤트 중 하나를 기다린다
       1. 사용자가 앱의 다른 화면으로 이동하면서 **폐기(dispose)**됨
       2. 트리의 다른 위젯이 갱신되면서 위젯이 의존하는 설정이 바뀜, 위젯의 상태는 didUpdateWidget을 호출하며 필요하면 **리빌드(rebuild)**함
       3. (버튼 등을 통한) 사용자의 **setState 호출**로, 위젯의 내부 상태가 갱신되어 위젯을 플러터가 **리빌드(rebuild)**함



## 1.10 플러터 렌더링: 내부 동작 원리

> **제약(constraint)정보**를 **부모위젯에서 자식위젯**으로 **트리를 타고 내려가며** 전파
> **정보**(각 위젯의 크기와 위치 등)를 **자식위젯에서 부모위젯**으로 **트리를 타고 올라가며** 전파



- **플러터 위젯은 리액티브**이다
  - 외부(또는 setState)에서 새 정보를 얻으면 이에 반응하고, 필요하면 플러터가 리빌드를 진행한다
- 버튼을 통한 setState 호출 예시
  1. 사용자가 버튼을 누름
  2. Button.onPressed 콜백에서 setState를 호출
  3. Button의 상태가 dirty로 바뀌었으면, 플러터는 이 위젯을 리빌드함
  4. 트리에서 기존 위젯을 새 위젯으로 바꿈
  5. 플러터가 새 트리를 그림



### 1.10.1 위젯 트리와 레이아웃 조립

- 렌더링의 단계
  1. 애니메이트 - 애니메이션 티커 타이머 시작
  2. 빌드 - 플러터가 위젯 트리를 빌드함
  3. 레이아웃 - 플러터가 트리를 내려갔다가 거슬러 올라오면서 대상 위젯의 레이아웃을 결정함
  4. 조립 - 각 픽셀 준비
  5. 그리기 - 플러터가 위젯을 그림



### 1.10.2 조립 과정

> 조립 과정은 그리기 과정과 별도이고,
> 조립 과정과 그리기 과정을 분리함으로 성능을 높일 수 있다
> (조립된 위젯 재사용 가능)

1. 각 위젯의 레이아웃을 결정하고 다른 위젯과 충돌하지 않음을 확인
2. 플러터가 위젯을 그릴 준비를 함 (조립 과정)
3. 플러터가 위젯에 실제 화면상의 좌표를 제공하고, 위젯은 자신이 차지할 실제 픽셀의 수를 알게 됨



### 1.10.3 화면에 그리기

> 래스터라이징(rasterizing) - 텍스트와 이미지를 프린트 가능한 형태로 전환

4. 엔진이 전체 트리를 그릴 수 있는 뷰로 모은다

5. 운영체제를 통해 화면에 그리도록 요청 (래스터라이징)



## 정리

- 플러터는 모바일 SDK이며 다트로 구현된다
- 다트는 구글이 만든 언어로 자바스크립트로 컴파일 할 수 있다
- 다트는 빠르며, 엄격한 형식을 지원하고 배우기 쉽다
- 플러터는 네이티브 디바이스 코드로 컴파일되므로 다른 크로스 플랫폼 기술보다 성능이 뛰어남
- 다트의 JIT, 플러터의 핫 리로드 덕분에 최상의 개발자 경험을 제공한다
- 이미 두 개의 네이티브 팀을 보유한 회사에게는 좋은 선택지가 아닐 수 있다
- 플러터의 모든 것은 위젯이다
- 위젯은 뷰를 묘사하는 단순한 다트 클래스이고, 여러 작은 위젯을 조립해 위젯 트리를 완성하며 UI를 만든다
- 위젯은 크게 상태가 없는 위젯과 상태가 있는 위젯으로 분류된다
- 플러터는 위젯 생명주기 메서드, 특별한 State 객체 등 상태 관리 도구를 제공한다





# 2장 다트



## 2.2 다트의 프로그래밍 개념

- 다트는 객체지향 언어이며 단일 상속(single inheritance)을 지원한다
- 다트에서 모든 것이 객체이며 모든 객체는 클래스의 인스턴스이다
- 모든 객체는 Object 클래스를 상속받는다 (심지어 숫자도 기본형이 아니라 객체)
- 다트는 형식을 갖는다 (문자열을 반환한다고 선언한 함수에서 숫자를 반환할 수 없다)
  - 형식 시스템의 가장 큰 장점 : 버그를 줄일 수 있다
- 다트는 최상위 수준 함수와 변수를 지원하며 이를 라이브러리 멤버라 부른다
- 다트는 어휘적(exically)으로 한정된다



### 2.2.1 다트의 형식 시스템



**복합 데이터 형식**

> List나 Map을 사용할때는 <>사이에 요소의 형식을 정의한다



**함수의 형식**

> 부작용을 활용하는 모든 함수는 void형식을 반환 (아무 값도 반환하지 않음)
>
> 보통 함수는 반환하는 값의 형식을 선언 해야한다



**동적 형식**

> 다트는 동적 형식 (dynamic type)도 지원한다
>
> 변수를 dynamic으로 설정하면 컴파일러가 해당 변수에 모든 형식을 허용한다
>
> 형식을 dynamic으로 설정하면 결과적으로 다트를 선택적 형식(optionally typed)으로 바꾼다
>
> 변수의 형식을 한번 결정하면 이를 바꿀 수 없다
>
> 함수도 반환 형식을 생략 할 수 있다



**언제 동적 형식을 사용할까**

> 보통 맵에 dynamic을 사용한다
>
> JSON과 같이 값(value)이 복잡한 map형식에 사용



**dynamic과 var**

> dynamic과 달리 var는 변수를 정의할 때만 사용할 수 있다 (형식에 사용할 수 없다)



**final**

> 변수에 다시 값을 할당 할 수 없으면 final을 사용한다



### 2.2.2 주석

> 다트는 세 가지 주석을 지원한다

- //
  - 인라인 주석
- /* */
  - 블록 주석 - 사용하기 불편함
- ///
  - 문서 - 클래스의 문서화에 사용



### 2.2.3 변수와 할당



**final, const, static**

> 이 세 키워드는 변수의 형식을 **확장**한다

- final
  - 변수의 값을 바꿀 수 없게(immutable)한다
  - 한번만 할당 할 수 있으며 클래스 수준에서 **변수를 할당하기 전에 선언** (클래스의 생성자에서 할당하는 모든 변수에 final사용)
- const
  - 변수의 값을 바꿀 수 없게(immutable)한다
  - 할당하기 전에 선언하지 않는다
  - 컴파일 이후로 항상 같은 값을 갖는 변수를 상수라 한다
  - const를 사용하면 성능이 개선된다
- static
  - 변경자(modifier)이다
  - 클래스에서만 사용된다



### 2.2.4 연산자

- 산술 연산자
  - *, /, %, ~/, +, -
- 관계와 형식 검사 연산자
  - <, <=, >, >=, as, is, is!
- 등가 연산자
  - ==, !=
- 논리 연산자
  - &&, ||
- 할당 연산자
  - =, *=, /=, ~/=, +=, -=, <<=, >>=, &=, ^=, |=
- 단일 연산자
  - a++, a--, ., -a, !a, ~a, ++a, --a



## 2.3 제어흐름

> 컴퓨터는 사람이 모든 것을 지시해야 한다
>
> 모든 상황에서 컴퓨터가 어떻게 대처해야 할지 지시한다는 것은 쉽지 않기 때문에
>
> 기본적으로 모든 로직을 처리하려면 **제어흐름(control flow)**을 이용해야한다
>
> 다트는 대부분의 고수준 언어와 비슷한 제어 흐름 기능을 사용한다 **(if 문, 삼항 연산자, switch 문 등)**



### 2.3.1 if와 else

> 다트의 조건문에는 반드시 boolean(true, false)사용



### 2.3.2 switch와 case

> 값 하나가 여러 조건을 가질 가능성이 있는 경우 switch 구문 활용
>
> int, String, ==을 사용해 컴파일 타임 상수를 비교한다 (같은 형식의 값만 비교가능)

```dart
int number = 1;
switch(number){
    case 0:
        print('zero!');
        break;
    case 1:
        print('one!');
        break;
    case 2:
        print('two!');
        break;
    default:
        print('choose a different number!');
}
```



### 2.3.3 고급 switch 사용

> switch 문에서 case에 break나 return 문을 사용하지 않으면 자동으로 다음 case를 실행한다

```dart
int number = 1;
switch(number){
    case -1:
    case -2:
    case -3:
	case -4:
    case -5:
        print('negative');
        break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
        print('positive');
        break;
    case 0:
    default:
        print('zero!');
        break;
}
```



### switch 문 탈출

> switch 문의 각 case에 switch를 탈출하는 키워드 (break, return 또는 throw)을 추가해야 한다
>
> continue와 레이블로 해당 case 문부터 실행 할 수 있다

```dart
String animal = 'tiger';
switch(animal){
    case 'tiger':
        print("it's a tiger");
        continue alsoCat;
    case 'lion':
        print("it's a lion");
        continue alsoCat;
    ///continue이후 해당 레이블을 찾아옴
    alsoCat:
    case 'cat':
        print("it's a cat");
        break;
}
```



### 삼항 연산자

> 조건(Boolean) **?** 참일때 반환 옵션 : 거짓일때 반환 옵션



### 2.3.4 루프

- 표준 for 루프

  - index가 필요한 경우

- for-in 루프

  - index 필요없을 경우

    ```dart
    List<String> fruits = ['apple', 'banana', 'peach'];
    for (var fruit in fruits){
        print(fruit);
    }
    ```

    

- forEach 메서드

  > 특징
  >
  > > 1. List에서 호출하는 함수 - 새로운 범위를 만들고, forEach에서 접근한 모든 값은 이 블록 밖에서 접근할 수 없다
  > > 2. 부작용만 제공할 가능성이 있다 - 반환값을 이용할 수 없고, 자료구조를 새롭게 만들지 않고 기존 객체를 변환할 때 유용하다

  - index 필요없을 경우

    ```dart
    List<String> fruits = ['apple', 'banana', 'peach'];
    fruits.forEach((fruit)=> print(fruit));
    ```

  cf) map 메서드

  > map과 forEach는 함수를 인수로 받고 리스트의 각 멤버를 인수로 받은 함수를 호출한다는 점은 같지만,
  >
  > map은 각 함수 호출 결과를 반환하고, 그 결과를 다시 새 리스트로 추가한다

  ```dart
  List<int> smallNums = [1,2,3];
  Iterable<int> biggerNums = smallNums.map((int n) => n*2);
  ```

- while 루프

- do while 루프



**break과 continue**

> break - 루프 탈출
>
> continue - 루프의 다음 차례로 넘어감



## 2.4 함수

> 함수는 객체이며 Function이라는 형식을 갖는다
>
> 함수의 바디에 한 행의 코드가 있을 때는 `=>`를 사용하여 단축해서 표현이 가능하다
>
> `=>`은 화살표 함수(arrow function)이라 부르며 return과 같은 역할을 한다



**고차함수(high-order function)**

- 함수를 인수로 전달하거나 함수에서 함수를 반환하는 언어의 기능



### 2.4.2 파라미터

> 다트 함수는 
>
> > 위치 지정 파라미터 - positional
> >
> > 이름 지정 파라미터 - named
> >
> > 선택형 위치 지정 파라미터 - optional positional
> >
> > 선택형 이름 지정 파라미터 - optional named
>
> 등을 지원한다



**이름 지정 파라미터**

> 이름 지정이란 함수를 호출할 때 인수를 레이블과 쌍으로 제공한다는 의미
>
> 중괄호`{}` 로 이름 지정 파라미터를 감싸서 구현
>
> @required를 붙이면 필수 파라미터로 지정할 수 있다

```dart
void example({String exampleString, int exampleInt}){
    
}
```



**선택형 위치 지정 파라미터**

> 마지막으로 []를 이용해 선택형 위치 지정 파라미터를 정의한다
>
> 선택형 위치 지정 파라미터에는 인수를 전달하지 않아도 괜찮다



### 2.4.3 파라미터 기본값

> 함수 시그니처에 = 연산자를 이용해 파라미터의 기본값을 정의한다

```da
addSomeNums(int x, int y, [int z = 5]) => x + y + z;
```



### 2.4.4 고급 함수 개념

> 프로그램에서 자신만의 기능을 구현하려면, 코드 재사용의 핵심인 함수를 사용해야 한다
>
> 고차 함수를 이용해 코드의 추상 계층을 추가하면 이해하기 쉬운 코드를 만들 수 있다



## 추상화

> 함수를 쪼개서 자신만의 기능을 구현하는 행위를 추상화(abstraction)라 한다
>
> 추상화를 활용해 저수준의 명시적 명령어를 구현하며, 이를 작은 함수로 감싸 이용한다



```dart
List<int> nums = [1,2,3];
nums.forEach((number) => print(number + 1));
///위의 forEach 메서드는 [number을 인수로 갖는 무명 함수(anonymous function)]를 사용했다
///이 무명 함수는 forEach 실행이 종료되면 사라진다
```

```dart
List<int> nums = [1,2,3];
void addOneAndPrint(int num){
	print(num+1);
}
nums.forEach(addOneAndPrint);
///위의 forEach는 인수를 함수로 받으므로 고차 함수이다
```



### 2.4.5 어휘 스코프

> 다트는 어휘 스코프(lexical scope)를 갖는다
>
> 각 코드 블록은 위에서 정의한 모든 변수에 접근할 수 있다
>
> 코드의 구조로 범위를 결정하며 중괄호가 열리는 부분부터 닫히는 부분까지로 현재 범위를 확인한다



## 2.5 다트의 객체지향 프로그래밍



**트렌젝션(transaction)**

> 하나의 작업을 수행하기 위해 필요한 데이터베이스의 연산들을 모아놓은 것으로, 데이터베이스에서 논리적인 작업의 단위가 된다
>
> 장애가 발생했을 때 데이터를 복구하는 작업의 단위도 됨 (작업 수행에 필요한 SQL문들의 모임으로 이해해도 무난)



### 2.5.1 클래스

> 확신이 서지 않으면 메서드보단 클래스를 생성하자
>
> 명백하게 어떤 동장이나 사물의 세부를 묘사하는 단어가 아니라면 일단 클래스로 표현

- 거의 모든 다트 코드는 클래스에 포함된다
- 클래스는 객체의 청사진이다 (즉, 클래스는 객체를 묘사한다)
- 객체 자체는 데이터와 로직을 포함하는 알맹이이다
- 클래스를 구현한 다음에는 클래스가 아니라 클래스의 인스턴스와 상호작용



### new 키워드 사용 X

> 클래스의 인스턴스 객체를 만들 때 new나 const를 사용할 필요 없음



### 2.5.2 생성자(constructor)

> 새 인스턴스를 만들 때 수행할 동작을 지정하는 역할



```dart
class Animal{
    String? name,type;
    Animal(this.name, this.type);
    ///같은 이름의 프로퍼티에 인수로 전달받은 값을 자동으로 할당한다
}
```



### 2.5.3 상속

> 객체지향 프로그래밍의 상속이란, 한 클래스가 다른 클래스를 상속받거나 다른 클래스의 슈퍼클래스(superclass)가 될 수 있음을 의미한다
>
> 상속받은 클래스는 부모클래스의 모든 기능을 포함하고, 필요에 따라 기능을 추가한다
>
> extends로 상속받는다

```dart
class Animal{
    String? name;
    int? legCount;
}

class Cat extends Animal{
    String makeNoise(){
        print('purrrrr');
    }
}
```



### 2.5.4 factory와 지정 생성자

> factory와 지정 생성자는 미리 정해진 프로퍼티를 포함하는 - 클래스의 특별한 메서드

**지정 생성자**

- 항상 클래스의 새 인스턴스를 반환

**factory**

- 캐시된 인스턴스 또는 서브 형식의 인스턴스 반환



### 2.5.5 열거자

**열거자[ enumerator ]**

- 보통 enum이라 부르며 상수 집합을 표현하는 특별한 클래스



### 2.6 마치며 (요약)

- 다트 문법은 C 언어를 기반으로 만들어진 언어와 비슷하다
- 다트는 객체지향이며 엄격한 형식 언어다
- 모든 다트 프로그램의 진입점은 main 함수이다
- 형식은 특정 상황에 올바른 값을 할당하도록 코드를 강제한다 (버그를 줄이는데 도움이 된다)
- 함수는 형식 또는 void를 반환해야 한다
- 다트의 대부분의 연산자는 다른 연산자와 비슷하다
- 다트는 if/else, switch, 삼항 연산자 등의 제어 흐름을 제공한다
- switch문에 enum을 사용하면 모든 enum의 형식을 case로 확인하도록 컴파일러가 강제한다
- 다트의 루프는 다른 언어와 비슷하다 (for, for-in, while, do while)
- 다트의 함수는 객체이므로 값처럼 함수를 전달할 수 있다 (다른 언어에서 이를 **고차 함수**라고 함)
- 다트는 진정한 객체지향 프로그래밍 언어이므로 클래스, 생성자, 상속을 자주 사용한다
- 다트는 기본 생성자, factory 생성자, 지정 생성자 등 다양한 생성자를 지원한다
- enum은 프로퍼티나 변수에 정해진 범위의 형식을 지정하므로 형식 안정성을 제공하는 특별한 클래스이다



# 3장 플러터의 세계로



### 3.1.3 모든 것은 위젯

> 플러터에서 거의 모든 것이 위젯이며, 위젯은 뷰를 묘사하는 다트 클래스이다 (뷰 모델)
>
> 위젯은 요소를 화면에 표시할 때 플러터가 사용하는 청사진이다
>
> 위젯에는 컨트롤러나 뷰가 따로 없다
>
> 웹 등 다른 프레임워크에서는 위젯을 **컴포넌트**라 부른다 (특정 UI를 정의하는 클래스)

모든 UI는 위젯

- 레이아웃 : Row, Column, Scaffold, Stack
- 구조 : Button, Toast, MenuDrawer
- 스타일 : TextStyle, Color, Padding
- 애니메이션 : FadeInPhoto, Transform
- 위치와 정렬 : Center, Padding



### 3.1.4 build 메서드

> 모든 위젯은 다른 위젯을 반환하는 **build메서드를 반드시 포함해야 한다**



### 3.1.5 플러터의 new, const 생성자

> 플러터에서는 한 위젯의 여러 인스턴스를 만든다
>
> 변경할 수 없는 위젯 인스턴스를 const로 생성하면 성능이 개선된다
>
> 클래스 인스턴스를 만들 때 **new 키워드를 사용할 필요가 없다**



### 3.1.6 핫 리로드

> 다트는 AOT 컴파일러이면서 JIT 컴파일러이다
>
> 컴퓨터로 앱을 개발할 때는 JIT [ Just In Time ]을 사용한다
>
> 앱을 제품으로 배포할 때는 AOT 컴파일러를 사용한다
>
> hot reload

**JIT [ Just In Time ]**

- 실시간으로 코드를 컴파일하고 실행한다는 의미

**AOT [ ahead-of-time ]**

- 목표 시스템의 기계어와 무관하게 중간 언어 형태로 배포된 후, 목표 시스템에서 인터프리터나 JIT 컴파일 등 기계어 번역을 통해 실행되는 **중간 언어를 미리 목표 시스템에 맞는 기계어로 번역하는 방식**을 지칭한다
- 개발자 입장에서 개발 시에는 코드를 빨리 개발하고 재컴파일 할 수 있으며,  제품 배포 시에도 네이티브 성능을 희생하지 않아도 된다



## 3.2 위젯 트리와 형식 , State 객체

> 두 가지 형식 외에 더 높은 수준의 형식을 갖는 위젯이 있지만,
> 거의 모든 위젯은 StatelessWidget이나 StatefulWidget의 형식을 갖는다
>
> 마치 브라우저에서 DOM [ Document Object Model ]으로 트리 구조를 구현하듯이
>
> 플러터 UI를 개발한다는 것은 수많은 **위젯을 조합**해 **위젯 트리를 완성하는 것**을 의미한다



### 3.2.2 상태를 갖는 위젯

> 상태를 갖는 모든 위젯은 상태 객체를 갖는다

```dart
class MyHomePage extends StatefulWidget {	//<= StatefulWidget을 상속받는다
    @override	//<= 슈퍼클래스의 메서드 createState를 오버라이드한다
    _MyHomePageState createState() => _MyHomePageState();
//모든 StatefulWidget은 State객체를 반환하는 createState 메서드를 반드시 정의해야한다
}

class _MyHomePageState extends State<MyHomePage> {
    @override
    Widget build(BuildContext context) {
        
    }
}
```

> 모든 위젯 클래스는 build 메서드를 갖는다고 했지만, StatefulWidget 클래스는 build 메서드를 포함하지 않는다. 대신 모든 StatefulWidget은 상태 객체(State<`StatefulWidget 클래스명`>)를 포함한다



**다트의 비공개(private) 값은 언더바(`_`)로 시작한다**



### 3.2.3 setState

> setState는 build, createState 다음으로 중요한 메서드이다
>
> 이 메서드는 객체의 상태와 관련이 있고 rebuild에 직접적인 영향을 끼친다
>
> **setState는 비동기 코드를 실행할 수 없다!!**
> 따라서 setState를 실행하기 전에 모든 비동기 작업을 완료해야 한다



### 3.2.4 initState

> 상태 객체는 위젯이 트리에 마운트되면 호출되는 initState 메서드도 포함한다
>
> 플러터가 화면에 위젯을 그리기 전에 필요한 모든 초기화를 State.initState에서 수행한다
>
> 
