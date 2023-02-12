import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_flutter_project/domain/firebase/conversation_firebase.dart';
import 'package:final_flutter_project/domain/firebase/user_firebase.dart';
import 'package:flutter/material.dart';

class BodyStory extends StatefulWidget {
  const BodyStory({super.key});

  @override
  State<BodyStory> createState() => _BodyStoryState();
}

class _BodyStoryState extends State<BodyStory> {
  final Stream<List<UserFirebase>> _users =
      FirebaseFirestore.instance.collection('users').snapshots().map(
            (snapshot) => snapshot.docs
                .map((doc) => UserFirebase.fromJson(doc.data()))
                .toList(),
          );

  final Stream<List<ConversationFirebase>> _conversations =
      FirebaseFirestore.instance.collection('conversations').snapshots().map(
            (snapshot) => snapshot.docs
                .map((doc) => ConversationFirebase.fromJson(doc.data()))
                .toList(),
          );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        StreamBuilder<List<UserFirebase>>(
          stream: _users,
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text(snapshot.error.toString());
            if (!snapshot.hasData) return const Text("Waiting for data");
            return Column(
              children: snapshot.data!.map((user) => Text(user.id)).toList(),
            );
          },
        ),
        StreamBuilder<List<ConversationFirebase>>(
          stream: _conversations,
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text(snapshot.error.toString());
            if (!snapshot.hasData) return const Text("Waiting for data");
            return Column(
              children: snapshot.data!
                  .map((conversation) => Column(
                        children: conversation.users.map((e) {
                          return FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('users')
                                .where('id', isEqualTo: e)
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError)
                                return Text(snapshot.error.toString());
                              if (!snapshot.hasData)
                                return const Text("Waiting for data");
                              return Text(
                                  snapshot.data!.docs.first.get("pseudo"));
                            },
                          );
                        }).toList(),
                      ))
                  .toList(),
            );
          },
        ),
      ]),
    );
  }
}
