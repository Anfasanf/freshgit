import 'package:fidemo/providers/emailAndpasswd.dart';
import 'package:fidemo/providers/visibility.dart';
import 'package:fidemo/screen/screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/theme/maintheme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>Passwordcontroller(),),
      ChangeNotifierProvider(create: (context)=>Logincontroller(),),
      ChangeNotifierProvider(create: (context)=>googlecontrlr())
    ],
    child:  MaterialApp(debugShowCheckedModeBanner: false,
      theme: maintheme.lighttheme,
      darkTheme: maintheme.darktheme,
      home: Myscreen(),
    ));

  }
}
