import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_flutter_project/domain/firebase/message_firebase.dart';
import 'package:final_flutter_project/file_utils.dart';
import 'package:final_flutter_project/persistence/conversation/conversation_bloc.dart';
import 'package:final_flutter_project/persistence/session/session_bloc.dart';
import 'package:final_flutter_project/presentation/camera/screen_camera.dart';
import 'package:final_flutter_project/presentation/shared/snap_icon.dart';
import 'package:final_flutter_project/presentation/shared/snap_text_field_rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FooterConversation extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  FooterConversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => FileUtils.goTo(context, ScreenCamera.routeName),
              child: SnapIcon(
                icon: Icons.camera_alt,
                onPressed: () => FileUtils.goTo(
                  context,
                  ScreenCamera.routeName,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: SnapTextFieldRounded(
                controller: controller,
                onSubmitted: (String value) => _onSubmitted(context, value),
              ),
            ),
            const SizedBox(width: 5),
            Wrap(
              spacing: 15,
              children: const [
                Icon(Icons.account_circle_outlined),
                Icon(Icons.photo_library_outlined),
                Icon(Icons.rocket_launch_outlined),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _onSubmitted(BuildContext context, String value) async {
    if (!context.mounted) return;

    CollectionReference messagesCollection =
        FirebaseFirestore.instance.collection('messages');

    DocumentReference<Object?> newMessage = await messagesCollection.add(
      MessageFirebase(
        text: value,
        user: context.read<SessionBloc>().state.user!.id,
        createAt: DateTime.now(),
      ).toJson(),
    );

    await messagesCollection.doc(newMessage.id).update({'id': newMessage.id});

    ConversationBloc currentConversation = context.read<ConversationBloc>();

    currentConversation.add(UpdateConversation(
      conversationFirebase: currentConversation.state.entity!.copyWith(
        messages: [
          ...currentConversation.state.entity!.messages,
          newMessage.id
        ],
      ),
    ));

    await FirebaseFirestore.instance
        .collection('conversations')
        .doc(currentConversation.state.entity!.id)
        .update({
      'messages': [...currentConversation.state.entity!.messages, newMessage.id]
    });

    controller.text = "";
  }
}
