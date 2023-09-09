import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UITextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Text"),
      ),
      body: Column(
        children: [
          Text("Hello World!", textAlign: TextAlign.left),
          Text("Hellow World!" * 10),
          Text("Hello world", textScaleFactor: 1.5),
          Text(
            "红色字体+黑色删除线+18号+斜体+粗体",
            style: TextStyle(
                color: const Color(0xffff0000),
                background: Paint()..color = Colors.yellow,
                // 删除线
                decoration: TextDecoration.lineThrough,
                // 删除线颜色
                decorationColor: const Color(0xff000000),
                // 字体大小
                fontSize: 18.0,
                // 斜体
                fontStyle: FontStyle.italic,
                // 字体粗细
                fontWeight: FontWeight.bold,
                // 文字间距
                letterSpacing: 2.0),
          ),
          Text.rich(TextSpan(
            children: [
              TextSpan(text: "Home: "),
              TextSpan(
                text: "https://www.baidu.com",
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print("Tap");
                  },
              )
            ],
          )),
        ],
      ),
    );
  }
}
