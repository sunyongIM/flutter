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
        body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 300, height: 250, margin: EdgeInsets.fromLTRB(5, 5, 20, 5),
                child: Image.asset('nugul.jpg', height: 200, width: 200, alignment: Alignment.topLeft, ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [SizedBox(child: Text('캐논 DSLR 100D (단렌즈,\n충전기 16기가SD포함)', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30)),),
                  SizedBox(child: Text('성동구 행당동 - 끌올 10분 전 ', style: TextStyle(color: Colors.grey, fontSize: 15))),
                  SizedBox(child: Text('210,000원', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20))),
                  Row(
                    children: [
                      Icon(Icons.star),
                    ],
                    textDirection: TextDirection.rtl,
                  )


                  // Container(
                  //   alignment: Alignment.centerRight,
                  //     child:
                  //       Icon(Icons.star),
                  //    ),
                ],

              ),
            ]
        ),
        bottomNavigationBar: Container(
          child: Text('네비게이션바'),
        ),

      ),

    );

  }
}
