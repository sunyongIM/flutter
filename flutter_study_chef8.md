> <Youtube> [코딩셰프] 플러터(flutter) 강좌 조금 매운맛 20~ (2021.09.04~2021.07.06)









*플러터(flutter) 강좌 조금 매운맛 20~21*

# 채팅 앱(chatting app) UI 디자인

> 





학습목표

![](md-images/study_purpose.jpg)



## Stack

> children에 나열한 여러 위젯을 순서대로 겹치게 함



### Positioned

> Stack내에서 위치설정



## MediaQuery

> 스마트폰의 크기와 사양에 맞춰 화면 조절

```dart
Positioned(
            top: 180,
            child: Container(
              height: 280,
              width: MediaQuery.of(context).size.width-40,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5
                  )
                ]
              ),
            ),
          ),
```



## TextFormField

> TextField는 TextEditingController의 변수가 필요해서 입력받을 TextField가 많아지면 관리하기 어려움
>
> TextFormField는 



# 삼항연산자

> [06화 다트 연산자 (Dart Operator) (brunch.co.kr)](https://brunch.co.kr/@mystoryg/120)



![](md-images/Three_way_operator.jpg)





# Firebase

> 참고 : [Form 으로 손쉽게 여러개의 텍스트필드 상태관리하기! | 코드팩토리 블로그 (codefactory.ai)](https://blog.codefactory.ai/flutter/form/)
>
> flutter에서 firebase를 사용하기 위해선 `Firebase.initializeApp()`메서드를 호출필요
>
> Firebase.initializeApp은 비동기 방식으로 실행되기에 다른 방식으로 initialize해야함



*main함수에 `WidgetsFlutterBinding.ensureInitialized()` 추가*

```dart
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
```



# Stream의 개념

> .

![Stream_example](md-images/Stream_example.jpg)



