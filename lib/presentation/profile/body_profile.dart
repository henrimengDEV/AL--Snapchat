import 'package:final_flutter_project/domain/friend.dart';
import 'package:final_flutter_project/file_utils.dart';
import 'package:final_flutter_project/persistence/session/session_bloc.dart';
import 'package:final_flutter_project/persistence/store/store_cubit.dart';
import 'package:final_flutter_project/presentation/profile/bitmoji/screen_bitmoji.dart';
import 'package:final_flutter_project/presentation/shared/modal/friends_modal/friends_modal.dart';
import 'package:final_flutter_project/presentation/shared/snap_title_h2.dart';
import 'package:final_flutter_project/presentation/shared/snap_avatar.dart';
import 'package:final_flutter_project/presentation/shared/snap_shadow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({Key? key}) : super(key: key);

  @override
  State<BodyProfile> createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(235, 235, 235, 1),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              BlocBuilder<SessionBloc, SessionState>(
                builder: (context, state) {
                  if (state.user != null && state.user!.avatar != null) {
                    return SnapAvatar(
                      avatar: state.user!.avatar!,
                      size: 100,
                    );
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    context.read<SessionBloc>().state.user!.pseudo,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SnapTitleH2(text: 'Friends'),
              SnapShadowButton(
                onPress: () {
                  FriendsModal.showIt(context);
                },
                label: 'Add Friends',
              ),
              const SnapTitleH2(text: 'Bitmoji'),
              SnapShadowButton(
                onPress: () => FileUtils.goTo(context, ScreenBitmoji.routeName),
                label: 'Edit my bitmoji',
                leadingIcon: Icons.edit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
