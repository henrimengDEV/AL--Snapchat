import 'package:final_flutter_project/domain/friend.dart';
import 'package:final_flutter_project/persistence/store/friend_cubit.dart';
import 'package:final_flutter_project/persistence/store/store_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyStory extends StatefulWidget {
  const BodyStory({super.key});

  @override
  State<BodyStory> createState() => _BodyStoryState();
}

class _BodyStoryState extends State<BodyStory> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => _showSimpleModalDialog(context),
        child: const Text('open modal'),
      ),
    );
  }

  _foo() {

  }

  _showSimpleModalDialog(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Row(
          children: [
            Column(
              children: [
                Text('Users'),
                BlocBuilder<StoreCubit, StoreState>(
                  builder: (context, store) => Column(
                    children: store.user.entities
                        .map((user) => ElevatedButton(
                              onPressed: () {
                                context.read<StoreCubit>().addFriend(Friend(
                                      id: 2000,
                                      firstUserId: store.user.currentUser.id,
                                      secondUserId: user.id,
                                    ));
                              },
                              child: Text(user.pseudo),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text('Friends'),
                BlocBuilder<StoreCubit, StoreState>(
                  builder: (context, store) => Column(
                    children: store.friend
                        .map((friend) => ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                  '${friend.firstUserId} with ${friend.secondUserId}'),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
