import 'dart:async';

import 'package:bloc/bloc/counter_event.dart';
import 'package:bloc/bloc/counter_state.dart';

class CounterBloc {
  CounterBloc() {
    _stream.listen(
      (CounterEvent event) {
        if (event is IncrementCounterEvent) {
          // counterState.increment();
          _sink.add(counterState..increment());
        } else {
          _sink.add(counterState..decrement());
        }
      },
    );
  }

  final _streamControllerEvent = StreamController<CounterEvent>();
  final _streamControllerState = StreamController<CounterState>();

  Stream<CounterEvent> get _stream => _streamControllerEvent.stream;
  Stream<CounterState> get stream => _streamControllerState.stream;
  StreamSink<CounterEvent> get sink => _streamControllerEvent.sink;
  StreamSink<CounterState> get _sink => _streamControllerState.sink;

  CounterState counterState = CounterState();
}
