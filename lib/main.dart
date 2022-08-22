import 'package:bloc/bloc/counter_bloc.dart';
import 'package:bloc/bloc/counter_event.dart';
import 'package:bloc/bloc/counter_state.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyAppWidget());
}

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = CounterBloc();
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: StreamBuilder<CounterState>(
            stream: counterBloc.stream,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.connectionState == ConnectionState.none) {
                return const Text('Waiting...!!!');
              } else if (snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.done) {
                // print(snapshot.data.count.toString());
                return Text(snapshot.data!.count.toString());
              } else {
                return const Text('Something Went Wrong');
              }
            }),
          ),
        ),
        floatingActionButton: Row(children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.sink.add(IncrementCounterEvent());
            },
            child: const Icon(Icons.plus_one),
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.sink.add(DecrementCounterEvent());
            },
            child: const Icon(Icons.work_rounded),
          )
        ]),
      ),
    );
  }
}
