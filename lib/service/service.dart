import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class SearchNotifier extends StateNotifier<List> {
  SearchNotifier() : super([]);

  void addfun(val) {
    state = [...state, val];
  }

  void removefun(val) {
    state.remove(val);
  }
}

final medialist = StateNotifierProvider<SearchNotifier, List>((ref) {
  print(ref);
  return SearchNotifier();
});
