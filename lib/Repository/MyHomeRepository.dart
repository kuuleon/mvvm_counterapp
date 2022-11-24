import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_counterapp/model/ResultModel.dart';

//modelのcounterをインクリメントし、model自体を呼び出し元に返すだけ
final myHomeRepositoryProvider = Provider(
    (ref) => MyHomeRepositoryImpl(model: ref.read(resultModelProvider)));

abstract class MyHomeRepository {
  Future<ResultModel> incrementCounter();
}

//実際の処理はMyHomeRepositoryImplクラスに委ねます。
//コンストラクタの引数にResultModelの受け口を用意し、
//本クラスをDIコンテナ（Provider）に保持するときに、
//ref.readでModelの実装時にDIコンテナに保持しているResultModelのインスタンスを引数に渡しています。
class MyHomeRepositoryImpl implements MyHomeRepository {
  MyHomeRepositoryImpl({required ResultModel model}) : _model = model;

  final ResultModel _model;

  @override
  Future<ResultModel> incrementCounter() {
    _model.counter = _model.counter + 1;
    return Future.value(_model);
  }
}
