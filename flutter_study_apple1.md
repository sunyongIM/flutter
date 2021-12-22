> 유튜브 [코딩애플] 쉬운 플러터 1~4강	(2021.12.14~2021.12.19)
>
> 1강 : [플러터 기본 위젯 넣는 법 - 코딩애플 온라인 강좌 (codingapple.com)](https://codingapple.com/unit/flutter-basic-layout-widget/?id=19933)
>
> 2강 : [플러터 기본 앱 레이아웃 만드는 법 (Scaffold) - 코딩애플 온라인 강좌 (codingapple.com)](https://codingapple.com/unit/flutter-basic-layout-design/?id=19933)





# 쉬운 플러터 1강

> 기본 위젯 4개 알면 기초 끝
>
> 위젯은 주로 첫 글자가 대문자로 시작
>
> Flutter에서 앱 디자인 넣는 법 : **위젯 짜깁기**



## analysis_options.yaml 설정

```yaml
  rules:
    prefer_typing_uninitialized_variables : false
    prefer_const_constructors_in_immutables : false
    prefer_const_constructors : false
    avoid_print : false
    prefer_const_literals_to_create_immutables : false
```

초보는 지키기 어려운 Lint (규칙) 중지



## main.dart

- `void main()` - 앱의 최초의 구동체이다
  - `runApp()` - 앱 실행 위젯



## 꼭 알아야 할 위젯 4개

1. 글자 위젯

   - `Text('')`
     - Text의 속성은 `style:` 에서 설정한다

2. 이미지 위젯

   > 실제 Directory명은 영어로 작명해야함

   - `Image.asset('경로')`

     1. 이미지가 프로젝트 폴더 내에 존재해야함
        - 이미지 보관용 "경로" Directory 생성

     2. 이미지를 등록 해야함

        - pubspec.yaml

        - ```yaml
          flutter:
            assets:
              - 경로/
          ```

3. 아이콘 위젯

   - `Icon(Icons.star, size: , color:)`
     - size, color등의 스타일이 있음

4. 박스 위젯

   - `Container()`
     - width, height, color와 같은 스타일이 있음
   - `SizedBox()`





# 쉬운 플러터 2강

> 머리! 가슴! 몸통!



## layout 위젯



### MaterialApp

> 구글이 제공해주는 디자인 양식

### Scafford

> 앱을 상-중-하로 나눠주는 위젯

상 - `appBar:`

중 - `body:`

하 - `bottomNavigationBar`

### Row

> 여러 위젯을 한 줄로 배열

- `children: []`
- `mainAxisAlignment:` - 가로축 정렬
- `crossAxisAlignment:` - 세로축 정렬

### Column

> 여러 위젯을 한 열로 배열

- `children: []`
- `mainAxisAlignment:` - 세로축 정렬
- `crossAxisAlignment:` - 가로축 정렬





# 쉬운 플러터 3강

> 박스 잘 그려야 앱 잘 만듭니다



## Row의 상하 폭 조정

> SizedBox또는 Container로 감싼다

- Container의 height을 조정하면 Row도 바뀜
- 상하 폭 조정하는 용도로는 SizedBox사용



## 박스 디자인하는 법

```dart
body: Container(
          width: 50, height: 50, color: Colors.blue, //color
          margin: EdgeInsets.all(20), padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.red
            //이미 컨테이너의 색을 컨테이너의 color스타일에 지정했기에 에러가 생김
            //둘 중 하나의 색만 표기할 것
          )
        )
```

- 박스의 폭(width)과 높이(height) 지정
  - 폭을 무한으로 만드는 법
    - `width: double.infinity`
- 바깥여백 주는 법 - `margin`  |  내부여백 주는 법 - `padding`
  - `EdgeInsets`와 함께 사용해야한다
    - `.all()` - 상하좌우 동시 적용
    - `.fromLTRB(left, top, right, bottom)` - 상하좌우 분리 적용
- 테두리 - `decoration: BoxDecoration()`
  - `decoration`에서는 박스의 색깔, 그림자, 테두리 등의 디자인이 있다



## 박스의 위치를 조정하는 법

- `Center` - 화면의 가운데

- `Align` - 다양한 위치로 정렬
  - `alignment : Alignment.bottomCenter,`





# 쉬운 플러터 4강

> AppBar (아빠)



## 글자와 아이콘 스타일

### `Style:`

- 글자 색깔
  1. 지정된 칼라 - `style: TextStyle( color: Colors.red)`
  2. 헥스 칼라 - `style: TextStyle( color: Color(0xff??????))`
     - Color()내부에 0xff를 기입하고 시작한다
  3. RGB 칼라 - `style: TextStyle( color: Color.fromRGBO(r, g, b, opacity))`

- 글자 크기 - `style: TextStyle( fontSize:)`
- 글자 두께 - `style: TextStyle( fontWeight: FontWeight.w900)`
- 자간 - `style: TextStyle( letterSpacing:)`
- 배경색 등등...



## 버튼 위젯

`TextButton()`,`IconButton()`,`ElevatedButton()`

```dart
body: SizedBox(
    child: TextButton(
        child: Text('버튼'),
        onPressed: (){},
    ),
),
////////////////////////////////////////////
body: SizedBox(
    child: IconButton(
        icon: Icon(Icons.star),
        onPressed: (){},
    ),
),
```

> `child:` , `onPressed:(){}` 필수로 추가 할 것

- 버튼의 스타일 - `style: ButtonStyle()`



- Scaffold()위젯의 자식 위젯인 **AppBar()**의 파라미터들
  - `title:` - 왼쪽 제목
  - `leading:` - 제일 왼쪽에 넣을 아이콘 (주로 메뉴바)
  - `actions:` - [우측아이콘들]

