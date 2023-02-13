import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_flutter_project/domain/firebase/conversation_firebase.dart';
import 'package:final_flutter_project/domain/firebase/user_firebase.dart';
import 'package:final_flutter_project/persistence/session/session_bloc.dart';
import 'package:final_flutter_project/presentation/chat/header_chat.dart';
import 'package:final_flutter_project/presentation/chat/item_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyChat extends StatelessWidget {
  BodyChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const HeaderChat(),
              const SizedBox(height: 20),
              StreamBuilder<List<ConversationFirebase>>(
                stream: _conversationsStream(context),
                builder: (context, document) {
                  if (document.hasError)
                    return Text("Error : ${document.error}");
                  if (!document.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return Column(
                    children: document.data!
                        .map((conversation) => FutureBuilder(
                            future: _user(conversation, context),
                            builder: (context, userDocument) {
                              if (userDocument.hasError) {
                                return Text(userDocument.error.toString());
                              }
                              if (!userDocument.hasData) {
                                return const CircularProgressIndicator
                                    .adaptive();
                              }

                              return Column(
                                children: [
                                  ItemChat(
                                      item: UserFirebase.fromJson(
                                        userDocument.data!.docs.first.data(),
                                      ),
                                      conversationFirebase: conversation),
                                  const Divider(thickness: 1, height: 0),
                                ],
                              );
                            }))
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stream<List<ConversationFirebase>> _conversationsStream(
          BuildContext context) =>
      FirebaseFirestore.instance
          .collection('conversations')
          .where(
            "users",
            arrayContains: context.read<SessionBloc>().state.user!.id,
          )
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map((doc) => ConversationFirebase.fromJson(doc.data()))
                .toList(),
          );

  Future<QuerySnapshot<Map<String, dynamic>>> _user(
    ConversationFirebase conversation,
    BuildContext context,
  ) {
    return FirebaseFirestore.instance
        .collection("users")
        .where(
          "id",
          isEqualTo: conversation.users.firstWhere(
            (element) => element != context.read<SessionBloc>().state.user!.id,
          ),
        )
        .snapshots()
        .first;
  }
}
