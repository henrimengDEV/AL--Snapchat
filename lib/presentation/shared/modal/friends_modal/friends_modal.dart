import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_flutter_project/domain/firebase/user_firebase.dart';
import 'package:final_flutter_project/file_utils.dart';
import 'package:final_flutter_project/presentation/shared/modal/friends_modal/item_friends_modal.dart';
import 'package:final_flutter_project/presentation/shared/snap_title_h2.dart';
import 'package:flutter/material.dart';

class FriendsModal extends StatelessWidget {
  static showIt(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => FriendsModal(),
    );
  }

  Stream<List<UserFirebase>> _usersStream() =>
      FirebaseFirestore.instance.collection('users').snapshots().map(
            (snapshot) => snapshot.docs
                .map((doc) => UserFirebase.fromJson(doc.data()))
                .toList(),
          );

  FriendsModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromRGBO(235, 235, 235, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 12,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => FileUtils.goBack(context),
                      child: const Icon(Icons.keyboard_arrow_down_outlined),
                    ),
                    const Expanded(child: Center(child: Text('Add Friends'))),
                    const Icon(Icons.more_horiz),
                  ],
                ),
              ),
              const SnapTitleH2(text: 'Quick Add'),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: StreamBuilder<List<UserFirebase>>(
                  stream: _usersStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) Text("Error: ${snapshot.error}");
                    if (snapshot.hasData) {
                      return Column(
                          children: snapshot.data!.map(
                        (user) {
                          return ItemFriendsModal(user: user);
                        },
                      ).toList());
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
