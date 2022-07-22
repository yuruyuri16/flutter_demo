import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/app/app.dart';
import 'package:flutter_demo/bootstrap.dart';
import 'package:flutter_demo/firebase_options/firebase_options_development.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  final userBox = await Hive.openBox<User>('userBox');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await bootstrap(() async {
    final authenticationRepository = AuthenticationRepository(userBox: userBox);
    await authenticationRepository.user.first;
    return App(authenticationRepository: authenticationRepository);
  });
}
