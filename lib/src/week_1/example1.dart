import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Example1(child: TextField(), foo: true,),
    );
  }
}

class Example1 extends StatefulWidget {
  const Example1({super.key, required this.child, required this.foo});
  final Widget child;
  final bool foo;
  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  final key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final child = KeyedSubtree(key: key, child: widget.child);

    if (widget.foo) {
      return Foo(child: child);
    }
    return child;
  }
}

class Foo extends StatelessWidget {
  const Foo({super.key, this.child});
  final child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}


