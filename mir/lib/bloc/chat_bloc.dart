import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/openia_service.dart';
import '../models/chat_model.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ApiService apiService = ApiService();

  ChatBloc() : super(ChatInitial()) {
    on<SendMessageEvent>((event, emit) async {
      emit(ChatLoading());
      try {
        print("⏳ Llamando a apiService con: ${event.message}");
        final reply = await apiService.sendMessage(event.message);
        print("📩 Respuesta: $reply");

        final messages = [
          ChatMessage(role: 'user', content: event.message),
          ChatMessage(role: 'assistant', content: reply),
        ];

        emit(ChatSuccess(messages));
        print("✅ Emití ChatSuccess");
      } catch (e) {
        print("❌ Error: $e");
        emit(ChatError(e.toString()));
      }
    });
  }
}
