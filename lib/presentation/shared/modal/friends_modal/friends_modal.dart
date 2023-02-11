import 'package:final_flutter_project/file_utils.dart';
import 'package:final_flutter_project/persistence/store/store_cubit.dart';
import 'package:final_flutter_project/presentation/shared/modal/friends_modal/item_friends_modal.dart';
import 'package:final_flutter_project/presentation/shared/snap_title_h2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendsModal extends StatelessWidget {
  static showIt(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const FriendsModal(),
    );
  }

  const FriendsModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) => SingleChildScrollView(
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
                  child: Column(
                    children: context
                        .read<StoreCubit>()
                        .getFriendSuggestionsOfCurrentUser()
                        .map(
                          (item) => Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: ItemFriendsModal(user: item),
                              ),
                              const Divider(thickness: 1, height: 0),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
