import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wow_shopping/features/main/bloc/nav_index_cubit.dart';

/// Loads the app
void bootstrap(Widget Function() builder) {
  runApp(
    BlocProvider<NavIndexCubit>(
      create: (BuildContext context) => NavIndexCubit(),
      child: builder(),
    ),
  );
}
