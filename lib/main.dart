import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero/features/admin/screen/adminScreen.dart';
import 'package:zero/features/auth/screens/loginScreen.dart';
import 'package:zero/features/auth/screens/signUpScreen.dart';
import 'package:zero/features/auth/services/auth_service.dart';
import 'package:zero/provider/user_provider.dart';
import 'Home/Screens/StartScreen.dart';
import 'router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => userProvider())],
      child: myApp()));
}

class myApp extends StatefulWidget {
  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/auth-screen': (context) => authScreen(),
        // '/sign-up':(context)=>signUpScreen(),
      },
      onGenerateRoute: (settings) => generateRoutes(settings),

      home: Provider.of<userProvider>(context).user.token.isNotEmpty
          ? Provider.of<userProvider>(context).user.type == 'user'
              ? StartScreen()
              : adminScreen()
          : authScreen(),
    );
  }
}
