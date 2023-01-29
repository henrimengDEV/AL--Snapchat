import 'package:final_flutter_project/persistence/store/store_cubit.dart';
import 'package:final_flutter_project/presentation/chat/header_chat.dart';
import 'package:final_flutter_project/presentation/chat/item_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyChat extends StatelessWidget {
  const BodyChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const HeaderChat(),
            const SizedBox(height: 20),
            Column(
              children: context
                  .read<StoreCubit>()
                  .getFriendsOfCurrentUser()
                  .map(
                    (item) => Column(
                      children: [
                        ItemChat(item: item),
                        const Divider(thickness: 1, height: 0),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
