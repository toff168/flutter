import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resource/top_banner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo?????',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

      /// home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        "/": (context) => const MyHomePage(
              title: "Home Page",
            ),
        "PageB": (context) => const PageB(
              title: "Page B",
            ),
        // "new_page":(context) => const PageB(title: "Page B"),
      },
      onGenerateRoute: (RouteSettings settings) {
        print(settings.name);
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const PageB(title: "404 page b"));
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final TextEditingController _controllerUser = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  @override
  void initState() {
    _counter = 20;
    print("initState");
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    print('didUpdateWidget');
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  void _addNum() {
    setState(() {
      print("setState");
      _counter++;
    });
  }

  void _toPageB() {
    Navigator.pushNamed(context, "PageB", arguments: "a to b")
        .then((value) => print(value.toString()));

    // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const PageB(title: 'PageBBBBBBBB'))).then((value) {
    //   print(value);
    // });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                cacheHeight: 100,
                cacheWidth: 100,
              ),
              Image.asset(
                'images/coin_log.png',
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
              const Text(
                'You have pushed the button this many times:',
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    TextButton(
                        onPressed: _addNum,
                        child: Container(
                          width: 200,
                          height: 30,
                          color: Colors.blue,
                          child: const Center(
                            child: Text(
                              "add",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        )),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 25,
                color: Colors.blue,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: 50,
                  color: Colors.red,
                ),
              ),
              Flexible(
                  flex: 2,
                  child: Container(
                    height: 50,
                    color: Colors.yellow,
                  ))
            ],
          ),
          TextButton(
              onPressed: _httpTest,
              child: Container(
                width: 200,
                height: 30,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    "网络测试",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              )),

          // const Text(
          //   "登录",
          //   style: TextStyle(
          //       color: Colors.blue, fontSize: 10, fontWeight: FontWeight.bold),
          // ),
          TextField(
            autofocus: false,
            controller: _controllerUser,
            decoration: const InputDecoration(
              labelText: "labelText",
              prefixIcon: Icon(Icons.person),
              hintText: "hintText",
              hintStyle: TextStyle(color: Colors.blueAccent),
              suffixIcon: Icon(Icons.clear),
            ),
          ),
          TextField(
            controller: _controllerPassword,
            decoration: const InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              prefixIcon: Icon(Icons.lock),
              suffixIcon: Icon(Icons.panorama_fish_eye_rounded),
            ),
            obscureText: true,
          ),
          TextButton(
              onPressed: () {
                print('帐号：' +
                    _controllerUser.text +
                    ' 密码：' +
                    _controllerPassword.text);
              },
              child: Container(
                width: 200,
                height: 44,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    "登录",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toPageB,
        tooltip: '_toPageB',
        child: const Icon(Icons.favorite),
      ),
    );
  }
}

void _httpTest() async {
  var url = Uri.parse('http://news.baidu.com/widget?ajax=json&id=ad');
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  TopBanner topBanner =
      TopBanner.fromJson(jsonDecode(response.body.toString()));

  print('requestId: ' + topBanner.requestId);
  print('timestamp: ' + topBanner.timestamp.toString());

  // print(await http.read(Uri.parse('https://example.com/foobar.txt')));
}

class PageB extends StatefulWidget {
  const PageB({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<PageB> createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  final int _counter = 0;
  void _toPageA() {
    Navigator.pop(context, 'b to a');
    // Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=> page))
  }

  @override
  Widget build(BuildContext context) {
    // var title = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        // title: Text(title.toString()),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'THIS IS PAGEb',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toPageA,
        tooltip: '_toPageA',
        child: Icon(Icons.attach_money),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
