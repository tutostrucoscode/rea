import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rea/ui/cubit/auth_cubit.dart';
import 'package:rea/ui/screens/homeScreen.dart';
import 'package:rea/ui/utils/theme/style.dart';
import 'ui/screens/loginScreen.dart';
import 'package:rea/config/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<AuthCubit>()..appStarted(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rea',
        theme: ThemeData(primaryColor: primaryColor),
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return HomeScreen();
                }
                if (authState is UnAuthenticated) {
                  return LoginScreen();
                }
                return LoginScreen();
              },
            );
          }
        },
      ),
    );
  }
}
