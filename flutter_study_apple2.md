> 유튜브 [코딩애플] 쉬운 플러터 5~강	(2021.12.22~2021.12.)
>
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



### 콘솔창과 Devtools

> 콘솔창을 키는 단축키 - alt+4
>
> Devtools는 콘솔창의 **왼쪽위의 파란아이콘**

Devtools로 전체적인 위젯의 화면을 볼 수 있다. (디버깅기능)





### 과제

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

