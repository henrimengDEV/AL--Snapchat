import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_flutter_project/domain/firebase/message_firebase.dart';
import 'package:final_flutter_project/persistence/conversation/conversation_bloc.dart';
import 'package:final_flutter_project/presentation/conversation/item_conversation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedConversation extends StatelessWidget {
  const FeedConversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: StreamBuilder<List<MessageFirebase>>(
          stream: messages(context),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text(snapshot.error.toString());
            if (!snapshot.hasData) return const Text("Waiting for data");
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: snapshot.data!
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: ItemConversation(message: e),
                        ))
                    .toList(),
              ),
            );
          },
        ),
      ),
    );
  }

  Stream<List<MessageFirebase>> messages(BuildContext context) =>
      FirebaseFirestore.instance
          .collection("messages")
          .where(
            "id",
            whereIn: context.read<ConversationBloc>().state.entity!.messages,
          )
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map((doc) => MessageFirebase.fromJson(doc.data()))
                .toList(),
          );
}
