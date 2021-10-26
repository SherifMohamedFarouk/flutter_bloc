import 'package:bloc_counter/counter_bloc2.dart';
import 'package:flutter/material.dart';

import 'counter_event2.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
 final _bloc = CounterBLoc2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.counter,
            initialData: 0,
            builder:(context, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${snapshot}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              );
            },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children:
        [
          FloatingActionButton(
          onPressed:() => _bloc.sink.add(incrementEvent2()),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
          const SizedBox(width:10.0),
          FloatingActionButton(
            onPressed:() =>  _bloc.sink.add(decrementEvent2()),
            tooltip: 'decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
