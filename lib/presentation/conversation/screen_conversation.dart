import 'package:final_flutter_project/persistence/store/store_cubit.dart';
import 'package:final_flutter_project/presentation/conversation/body_conversation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenConversation extends StatelessWidget {
  final int userId;

  const ScreenConversation({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<StoreCubit>().updateCurrentFriend(userId);
    return Scaffold(
      body: BodyConversation(),
    );
  }
}
