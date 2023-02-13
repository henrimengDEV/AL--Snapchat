import 'package:final_flutter_project/persistence/conversation/conversation_bloc.dart';
import 'package:final_flutter_project/persistence/user/user_bloc.dart';
import 'package:final_flutter_project/presentation/conversation/body_conversation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenConversation extends StatefulWidget {
  static const routeName = 'screen_conversation';

  const ScreenConversation({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenConversation> createState() => _ScreenConversationState();
}

class _ScreenConversationState extends State<ScreenConversation> {
  late ConversationBloc conversationBloc;
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    conversationBloc = context.read<ConversationBloc>();
    userBloc = context.read<UserBloc>();

    return const Scaffold(
      body: BodyConversation(),
    );
  }

  @override
  void dispose() {
    conversationBloc.add(ResetAllConversation());
    userBloc.add(ResetOneUser());
    super.dispose();
  }
}
