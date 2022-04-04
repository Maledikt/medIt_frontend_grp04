import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final GlobalKey<NavigatorState> navigatorKey;

  AppCubit({required this.navigatorKey}) : super(const AppState());

  void gotoNamedRoute(String route) =>
      navigatorKey.currentState?.pushReplacementNamed(route);
  void gotoRoute(Widget widget) => navigatorKey.currentState
      ?.pushReplacement(MaterialPageRoute(builder: (context) => widget));
  void pushNamedRoute(String route) =>
      navigatorKey.currentState?.pushNamed(route);
  void pushRoute(Widget widget) => navigatorKey.currentState
      ?.push(MaterialPageRoute(builder: (context) => widget));
  void popRoute() => navigatorKey.currentState?.pop();
}
