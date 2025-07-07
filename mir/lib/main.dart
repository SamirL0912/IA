import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mir/bloc/chat_bloc.dart';
import 'package:mir/bloc/chat_state.dart';
import 'package:mir/views/failure_view.dart';
import 'package:mir/views/initial_view.dart';
import 'package:mir/views/loading_view.dart';
import 'package:mir/views/success_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if (state is ChatInitial) {
              return InitialView();
            } else if (state is LoadingView) {
              return LoadingView();
            } else if (state is ChatError) {
              return FailedView();
            }
            return InitialView();
          },
        ),
      ),
    );
  }
}
