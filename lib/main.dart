import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_sample/bloc/bloc.dart';
import 'package:giphy_sample/di/di.dart';
import 'package:giphy_sample/ui/list_screen.dart';
import 'package:injector/injector.dart' show Injector;

Future<Widget> main() async {
  await Di().setup();
  Widget widget = const MyApp();
  runApp(widget);
  return widget;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Giphy sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (context) => Injector.appInstance.get<ListBloc>(),
        child: const ListScreen(),
      ),
    );
  }
}
