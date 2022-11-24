import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_counterapp/viewModel/MyHomeViewModel.dart';

// StatefulWidgetからConsumerWidgetに変更
class MyHomePage extends ConsumerWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  // buildメソッドの実装が強要されるため、_MyHomePageStateのreturn内容をそのまま入れる
  // buildメソッドのWidgetRefを利用し、ref.watch()メソッドの引数にViewModelのProvider「myHomeViewModelProvider」を指定することで、
  // Providerに保持しているMyHomeViewModelを取得できる。
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watchメソッドのパラメータにChangeNotifierProviderに格納したMyHomeViewModelを取得する
    // これによって、_viewModelでnotifyListeners()が実行された場合、本Widgetのリビルドが走る
    final _viewModel = ref.watch(myHomeViewModelProvider);

    // _MyHomePageStateのreturn内容をそのまま入れる
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${_viewModel.getCounter()}', // <-- _viewModelのgetCounter()に置き換え
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            _viewModel.incrementCounter, // <-- _viewModelのincrementCounterに置き換え
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

// Stateは削除
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
