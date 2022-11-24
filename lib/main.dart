import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_counterapp/MyApp.dart';

void main() {
  //MyAppをProviderScopeで包む
  //RiverpodのProviderScope配下で動くことを前提とする
  runApp(ProviderScope(child: MyApp()));
}
