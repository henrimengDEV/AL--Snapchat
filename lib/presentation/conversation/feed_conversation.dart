import 'package:final_flutter_project/persistence/store/store_cubit.dart';
import 'package:final_flutter_project/presentation/conversation/item_conversation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedConversation extends StatelessWidget {
  const FeedConversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: BlocBuilder<StoreCubit, StoreState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: state.message.entities.map((e) =>
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ItemConversation(message: e),
                    )).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
