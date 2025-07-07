import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mir/models/chat_model.dart';
import 'package:mir/services/openia_service.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final List<ChatMessage> _messages = [];
  final ApiService _apiService = ApiService();

  ChatBloc() : super(ChatInitial()) {
    on<SendMessageEvent>((event, emit) async {
      _messages.add(ChatMessage(role: 'user', content: event.message));
      emit(ChatLoaded(List.from(_messages)));

      emit(ChatLoading());

      try {
        final aiResponse = await _apiService.sendMessage(event.message);
        _messages.add(ChatMessage(role: 'ai', content: aiResponse));
        emit(ChatLoaded(List.from(_messages)));
      } catch (e) {
        emit(ChatError(e.toString()));
      }
    });
  }
}
