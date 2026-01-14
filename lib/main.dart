import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ui/App.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}


// Riverpod Example


// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';

// // We create a "provider", which will store a value (here "Hello world").
// // By using a provider, this allows us to mock/override the value exposed.

// // Provider
// final helloWorldProvider = Provider((ref) => 0);

// // StateProvider
// final counterProvider = StateProvider<int>((ref) => 0);

// final counterStateNotifierProvider =
//     StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

// class CounterNotifier extends StateNotifier<int> {
//   CounterNotifier() : super(0);

//   void increment() {
//     state++;
//   }

//   void decrement() {
//     if (state > 0) {
//       state--;
//     }
//   }
// }

// // ChangeNotifierProvider - Same as provider but without context
// final count = ChangeNotifierProvider((ref) => Counter());

// class Counter extends ChangeNotifier {
//   int _count = 0;

//   int get count => _count;

//   void increment() {
//     _count++;
//     notifyListeners();
//   }

//   void decrement() {
//     _count--;
//     notifyListeners();
//   }
// }

// void main() {
//   runApp(
//     // For widgets to be able to read providers, we need to wrap the entire
//     // application in a "ProviderScope" widget.
//     // This is where the state of our providers will be stored.
//     ProviderScope(child: MyApp()),
//   );
// }

// // Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
// class MyApp extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final value = ref.watch(helloWorldProvider);

//     final int value1 = ref.watch(counterProvider);

//     final counter = ref.watch(count);

//     final counterStateNotifier = ref.watch(counterStateNotifierProvider);

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Example')),
//         body: Center(child: Text(counterStateNotifier.toString())),

//         floatingActionButton: Row(
//           children: [
//             FloatingActionButton(
//               onPressed: () {
//                 // ref.read(counterProvider.notifier).state = count + 1;

//                 // counter.increment();

//                 ref.read(counterStateNotifierProvider.notifier).increment();
//               },
//               child: Icon(Icons.add),
//             ),
//             FloatingActionButton(
//               onPressed: () {
//                 // ref.read(counterProvider.notifier).state++;

//                 // counter.decrement();

//                 ref.read(counterStateNotifierProvider.notifier).decrement();
//               },
//               child: Icon(Icons.remove),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
