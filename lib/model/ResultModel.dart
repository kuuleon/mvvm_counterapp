import 'package:flutter_riverpod/flutter_riverpod.dart';

// ResultModel自体はint属性のcounterを持っているだけ
// 本件ではDIを意識した実装をしたかったので、ProviderにResultModelのインスタンスを保持するようにしています。
// 要するにProvider＝DIコンテナの役割を持たせました。
final resultModelProvider = Provider((ref) => ResultModel());

class ResultModel {
  int counter = 0;
}
