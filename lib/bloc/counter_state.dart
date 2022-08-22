class CounterState {
  int count = 0;

  void increment() => count++;
  void decrement() => count--;
}

// class IncrementCounterState extends CounterState {
//   IncrementCounterState() {
//     CounterState.count++;
//   }
// }

// class DecrementCounterState extends CounterState {
//   DecrementCounterState() {
//     CounterState.count--;
//   }
// }
