> <Youtube> [코딩애플] 쉬운 플러터 5~강 (2021.12.22~2021.12.)
>





# 쉬운 플러터 5강

> Flexible과 Expanded



- 박스 폭을 비율로 설정하려면 - `Flexible()`로 감싸야 함

```dart
body: Row(
          children: [
            Flexible(child: Container(color: Colors.green,), flex: 3,),
            Flexible(child: Container(color: Colors.yellow,), flex: 7,),
          ],
        )
```

> `flex:` 가 비율로 퍼센트를 나눈다 (green컨테이너 : yellow컨테이너 = 3 : 7)



- `Expanded()`는 `flex:1` 인 Flexible 박스와 같다



## 콘솔창과 Devtools

> 콘솔창을 키는 단축키 - alt+4
>
> Devtools는 콘솔창의 **왼쪽위의 파란아이콘**

Devtools로 전체적인 위젯의 화면을 볼 수 있다. (디버깅기능)





## 과제

```dart
import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Text(' 금호동3가',
                style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 40,),
            ],
          ),
          actions: [Row(
              children: [
                Icon(Icons.zoom_in_outlined, size: 40, color: Colors.black,), SizedBox(width: 25,) ,
                Icon(Icons.menu, size: 40, color: Colors.black,), SizedBox(width: 25,),
                Icon(Icons.doorbell, size: 40, color: Colors.black,), SizedBox(width: 25,),]
          ),
          ],
        ),
        body: Container(
          height: 300,
          padding: EdgeInsets.all(10),
          child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 300, height: 250, margin: EdgeInsets.fromLTRB(5, 5, 20, 5),
                  child: Image.asset('nugul.jpg', height: 200, width: 200, alignment: Alignment.topLeft, ),
                ),
                Expanded(child:
                 Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [SizedBox(child: Text('캐논 DSLR 100D (단렌즈,\n충전기 16기가SD포함)', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30)),),
                      SizedBox(child: Text('성동구 행당동 - 끌올 10분 전 ', style: TextStyle(color: Colors.grey, fontSize: 15))),
                      SizedBox(child: Text('210,000원', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.favorite),
                          Text('4'),
                        ],
                      ),
                    ],
                  ),
                ),
              ]
          ),
        ),
        bottomNavigationBar: Container(
          child: Text('네비게이션바'),
        ),
      ),
    );
  }
}

```





# 쉬운 플러터 6강



## 커스텀 위젯

> 커스텀 위젯은 class로 만듬 ( class - 변수 함수 보관함)
>
> 이미 완성된 위젯 복사해서 class만듬 (ex - StatelessWidget)
>
> @override - 중복 발생 시 내꺼먼저 적용 (덮어쓰기)
>
> class안에 build라는 함수 만드는 부분 필요
>
> return에 반환할 내용 입력



```dart
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: HiClass(),	//커스텀 위젯
      ),
    );
  }
}

class HiClass extends StatelessWidget {
  const HiClass({Key? key}) : super(key: key);
  //파라메터 정의 부분

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text('안녕'),
    );
  }
}
```

### 목적

1. 축약
2. 재사용



```dart
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: hi,	//변수
      ),
    );
  }
}

var hi = SizedBox(
  child: Text('안녕'),
);
```

변수, 함수 문법으로도 축약은 가능하지만
변하지 않는 UI만 해야한다 (StatelessWidget). - 성능이슈



## ListView

> column은 스크롤바가 없고 children이 많아지면 불편한 반면
>
> ListView는 스크롤바가 생성되고, 스크롤 위치 감시도 가능
>
> 메모리 절약기능이 있음 (성능개선)

```dart
body: ListView(
    children: [
        Text('ListView'),
        Text('ListView'),
        Text('ListView'),
    ],
),
```



## 과제

```dart
import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        // body: HiClass(),
        body: ListView(
          children: [
            Names(),
            Names(),
            Names(),
          ],
        ),
        bottomNavigationBar: BottomIcons(),
      ),

    );
  }
}

class Names extends StatelessWidget {
  const Names({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          Icon(Icons.person_pin),
          Text(' 홍길동', style: TextStyle(
            fontSize: 10,
            letterSpacing: 1,
          ),)
        ],
      ),
    );
  }
}

class BottomIcons extends StatelessWidget {
  const BottomIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.call),
          Icon(Icons.list_alt),
          Icon(Icons.person_pin_outlined),
        ],
      ),
    );
  }
}
```

