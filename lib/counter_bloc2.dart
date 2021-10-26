import 'dart:async';

import 'package:bloc_counter/counter_event2.dart';

class CounterBLoc2 {

  int _counter = 0;
  final _counterSinkController = StreamController<int>();

  StreamSink<int> get _inCounter => _counterSinkController.sink;

  Stream<int> get counter => _counterSinkController.stream;
  final _counterEventConroller = StreamController<CounterEvent2>();

  Sink<CounterEvent2> get sink => _counterEventConroller.sink;

  CounterBLoc2() {
    _counterEventConroller.stream.listen((event) {
      _map(event);
    });
  }

  _map(CounterEvent2 event) {
    if(event is incrementEvent2){
      _counter++;
    }else{
      _counter--;
    }
    _inCounter.add(_counter);
  }

  void dispose(){
    _counterSinkController.close();
    _counterEventConroller.close();
  }
}