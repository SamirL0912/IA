import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/chat_bloc.dart';
import 'bloc/chat_state.dart';
import 'views/failure_view.dart';
import 'views/initial_view.dart';
import 'views/loading_view.dart';
import 'views/success_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            print("🔄 State actual: $state");
            if (state is ChatInitial) {
              return const InitialView();
            } else if (state is ChatLoading) {
              return const LoadingView();
            } else if (state is ChatSuccess) {
              return SuccessView(messages: state.messages);
            } else if (state is ChatError) {
              return FailedView(message: state.error);
            }
            return const InitialView();
          },
        ),
      ),
    );
  }
}
