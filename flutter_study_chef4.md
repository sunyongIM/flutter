> <Youtube> [코딩셰프] 플러터(flutter) 강좌 순한맛 19~	(2020.01.07~2020.01.28)



*완전 초보용 플러터 강좌 19*

## 빌더 위젯 없이 스낵바 만들기 + 토스트 메세지 구현하기

> Making Snack bar without Builder widget + using Toast message



```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Builder&SnackBar&ToastMessage',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack Bar & Toast Message'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [MySnackBar(), Toast()],
        ),
      ),
    );
  }
}

class MySnackBar extends StatelessWidget {
  const MySnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('SnackBarButton'),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Hello!',
              textAlign: TextAlign.center,
            ),
            duration: Duration(milliseconds: 2000),
          ),
        );
      },
    );
  }
}

class Toast extends StatelessWidget {
  const Toast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text('Toast'),
        style: TextButton.styleFrom(
          backgroundColor: Colors.amber,
        ),
        onPressed: () {
          flutterToast();
        },
      ),
    );
  }
}

void flutterToast() {
  Fluttertoast.showToast(
    msg: 'flutter Toast!',
    gravity: ToastGravity.BOTTOM,
    webPosition: "Right",
    backgroundColor: Colors.redAccent,
    fontSize: 20.0,
    textColor: Colors.deepPurple,
  );
}
```





*완전 초보용 플러터 강좌 20~21*

# 위젯 레이아웃

> [Layout widgets | Flutter](https://docs.flutter.dev/development/ui/widgets/layout)
>
> > Flutter 공식 레이아웃 설명 사이트
>
> [Flutter Layout Cheat Sheet. Do you need simple layout samples for… | by Tomek Polański | Flutter Community | Medium](https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e)
>
> > Row&Column 레이아웃 예시 사이트



## SafeArea

> 앱 화면 밖으로 나가지 않게 해주는 위젯



### 

*완전 초보용 플러터 강좌 22*

# Navigator 이해하기

1. Route의 개념
2. Navigator의 정의 와 push, pop함수, stack 자료구조
3. MaterialPageRoute 위젯과 context
4. 페이지 이동 기능 구현 완성



## Route

> 앱에서의 **하나의 페이지 (스크린)**



## Navigator

> Route를 관리하는 위젯

- Route의 스택 관리
  - `Navigator.push` , `Navigator.pop`



### Stack

> 자료 구조 중 하나 (Last In First Out)

- push로 데이터를 추가
- pop으로 데이터를 제거



```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Builder&SnackBar&ToastMessage',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondPage())
                // MaterialPageRoute(builder: (context) {return SecondPage();})
                );
          },
          child: Text('다음페이지로 ->'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator2'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(ctx);
          },
          child: Text('이전페이지로 <-'),
        ),
      ),
    );
  }
}
```

