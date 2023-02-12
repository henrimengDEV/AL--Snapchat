import 'package:camera/camera.dart';
import 'package:final_flutter_project/domain/firebase/conversation_firebase.dart';
import 'package:final_flutter_project/domain/user/user_repository.dart';
import 'package:final_flutter_project/persistence/conversation/conversation_bloc.dart';
import 'package:final_flutter_project/persistence/friend/friend_bloc.dart';
import 'package:final_flutter_project/persistence/message/message_bloc.dart';
import 'package:final_flutter_project/persistence/provider/camera_provider.dart';
import 'package:final_flutter_project/persistence/session/session_bloc.dart';
import 'package:final_flutter_project/persistence/user/user_bloc.dart';
import 'package:final_flutter_project/persistence/user/firebase_user_repository.dart';
import 'package:final_flutter_project/presentation/auth/form_birthday/screen_birthday.dart';
import 'package:final_flutter_project/presentation/auth/form_password/screen_password.dart';
import 'package:final_flutter_project/presentation/auth/form_username/screen_username.dart';
import 'package:final_flutter_project/presentation/auth/login/screen_login.dart';
import 'package:final_flutter_project/presentation/auth/sign_up/screen_sign_up.dart';
import 'package:final_flutter_project/presentation/camera/screen_camera.dart';
import 'package:final_flutter_project/presentation/chat/screen_chat.dart';
import 'package:final_flutter_project/presentation/conversation/screen_conversation.dart';
import 'package:final_flutter_project/presentation/map/screen_map.dart';
import 'package:final_flutter_project/presentation/profile/bitmoji/screen_bitmoji.dart';
import 'package:final_flutter_project/presentation/profile/screen_profile.dart';
import 'package:final_flutter_project/presentation/screen_snapchat.dart';
import 'package:final_flutter_project/presentation/story/screen_story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final List<CameraDescription> cameras = await availableCameras();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  if (cameras.isNotEmpty) {
    final CameraDescription firstCamera = cameras.first;
    CameraProvider.instance.firstCamera = firstCamera;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => FirebaseUserRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ConversationBloc>(
            create: (BuildContext context) => ConversationBloc(),
          ),
          BlocProvider<FriendBloc>(
            create: (BuildContext context) => FriendBloc(),
          ),
          BlocProvider<MessageBloc>(
            create: (BuildContext context) => MessageBloc(),
          ),
          BlocProvider<UserBloc>(
            create: (BuildContext context) => UserBloc(),
          ),
          BlocProvider<SessionBloc>(
            create: (BuildContext context) => SessionBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          routes: {
            ScreenBitmoji.routeName: (_) => const ScreenBitmoji(),
            ScreenMap.routeName: (_) => const ScreenMap(),
            ScreenChat.routeName: (_) => const ScreenChat(),
            ScreenCamera.routeName: (_) => const ScreenCamera(),
            ScreenConversation.routeName: (_) => const ScreenConversation(),
            ScreenStory.routeName: (_) => const ScreenStory(),
            ScreenProfile.routeName: (_) => const ScreenProfile(),
            ScreenLogin.routeName: (_) => ScreenLogin(),
            ScreenSignUp.routeName: (_) => ScreenSignUp(),
            ScreenBirthday.routeName: (_) => ScreenBirthday(),
            ScreenUsername.routeName: (_) => ScreenUsername(),
            ScreenPassword.routeName: (_) => ScreenPassword(),
          },
          onGenerateRoute: (RouteSettings settings) {
            // Widget screen = const PageNotFound();
            Widget screen = const ScreenSnapchat();

            switch (settings.name) {
              case ScreenConversation.routeName:
                final argument = settings.arguments;
                // if (argument != null && argument is ConversationFirebase) {
                //   screen = ScreenConversation(conversation: argument);
                // }
                break;
            }

            return MaterialPageRoute(builder: (context) => screen);
          },
        ),
      ),
    );
  }
}
