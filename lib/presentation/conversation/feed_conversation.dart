import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_flutter_project/domain/firebase/conversation_firebase.dart';
import 'package:final_flutter_project/domain/firebase/message_firebase.dart';
import 'package:final_flutter_project/persistence/conversation/conversation_bloc.dart';
import 'package:final_flutter_project/presentation/conversation/item_conversation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedConversation extends StatelessWidget {
  const FeedConversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: BlocBuilder<ConversationBloc, ConversationState>(
          builder: (context, state) {
            return _messages(context, state);
          },
        ),
      ),
    );
  }

  Widget _messages(BuildContext context, ConversationState state) {
    // if (state.entity!.messages.isEmpty) {
    //   return const Text("");
    // }

    return BlocBuilder<ConversationBloc, ConversationState>(
      builder: (_, state) {
        return StreamBuilder<ConversationFirebase>(
          stream: FirebaseFirestore.instance
              .collection("conversations")
              .doc(state.entity!.id)
              .snapshots()
              .map(
                (event) => ConversationFirebase.fromJson(event.data()!),
              ),
          builder: (_, snapshotConversation) {
            if (snapshotConversation.hasError) {
              return Text(snapshotConversation.error.toString());
            }
            if (!snapshotConversation.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return StreamBuilder<List<MessageFirebase>>(
              stream: messages(context, snapshotConversation.data!.messages),
              builder: (_, snapshotMessages) {
                if (snapshotMessages.hasError) {
                  return Text(snapshotMessages.error.toString());
                }
                if (!snapshotMessages.hasData) {
                  return const CircularProgressIndicator.adaptive();
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: snapshotMessages.data!
                        .where((element) => snapshotConversation
                            .data!.messages
                            .contains(element.id))
                        .map(
                      (e) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: ItemConversation(message: e),
                        );
                      },
                    ).toList(),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Stream<List<MessageFirebase>> messages(
      BuildContext context, List<String> messages) {
    return FirebaseFirestore.instance
        .collection("messages")
        .orderBy("createAt", descending: false)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => MessageFirebase.fromJson(doc.data()))
              .toList(),
        );
  }
}
