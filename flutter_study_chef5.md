> <Youtube> [코딩셰프] 플러터(flutter) 강좌 조금 매운맛 01~	(2020.03.19~2020..)



*플러터(flutter) 강좌 조금 매운맛 01*

# Stateful widget part 1



## State

> UI가 변경되도록 영향을 미치는 데이터
>
> App 수준과 Widget 수준의 데이터 등 데이터의 범위가 넓음을 인지



### Stateless widget

> (코드 변경없이) State가 변하지 않는 위젯



### Statefull widget

> State 클래스가 결합 돼있음

Stateful widget의 Rebuilding 시기

- Child 위젯의 생성자를 통해서 데이터가 전달 될 때
- Internal state가 바뀔 때



![](md-images/stateful_widget.jpg)





## Widget - Element - Render Tree

![](md-images/3trees.jpg)

> Widget - Element - Render 트리들의 구조 예시



![](md-images/Element_tree_reload.jpg)

> Element tree는 Hot reload시 rebuild대신 reload를 실행하게 해준다
> (모든 내용을 실행하는 것이 아닌 수정된 부분만 실행)





*플러터(flutter) 강좌 조금 매운맛 03~04*

# 로그인과 주사위 게임 플러터 앱 만들기



```dart
import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController? diceId = TextEditingController();
  TextEditingController? dicePwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.green,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 50.0)),
              Center(
                child: Image.asset(
                  'chef.gif',
                  width: 170.0,
                  height: 190.0,
                ),
              ),
              Form(
                  child: Theme(
                data: ThemeData(
                  primaryColor: Colors.teal,
                  inputDecorationTheme: InputDecorationTheme(
                      labelStyle:
                          TextStyle(color: Colors.teal, fontSize: 15.0)),
                ),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 0.0),
                  child: Column(
                    children: [
                      TextField(
                        autofocus: true,
                        controller: diceId,
                        decoration: InputDecoration(labelText: 'Enter "dice"'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        controller: dicePwd,
                        decoration:
                            InputDecoration(labelText: 'Enter Password'),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ButtonTheme(
                        minWidth: 100.0,
                        height: 50.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lime,
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 40.0,
                          ),
                          onPressed: () {
                            if (diceId!.text == 'dice' &&
                                dicePwd!.text == '1234') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DicePage()));
                            } else if (diceId!.text == 'dice') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  'Check Password',
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.red[400],
                              ));
                            } else if (dicePwd!.text == '1234') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  'Check "dice"',
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.red[400],
                              ));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  '정확한 값을 입력 해 주세요!',
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.red[400],
                              ));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int diceNum1 = Random().nextInt(6) + 1;
  int diceNum2 = Random().nextInt(6) + 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice Game',
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'dice$diceNum1.png',
                        // height: 150.0,
                        // width: 150.0,
                      ),
                    ),
                    SizedBox(width: 40.0,),
                    Expanded(
                      child: Image.asset(
                        'dice$diceNum2.png',
                        // height: 150.0,
                        // width: 150.0,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    diceNum1 = Random().nextInt(6) + 1;
                    diceNum2 = Random().nextInt(6) + 1;
                  });
                },
                child: Icon(
                  Icons.play_arrow,
                  size: 50.0,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

