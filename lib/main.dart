import 'package:blogging/Core/Secrets/supabase_secrets.dart';
import 'package:blogging/Core/theme/theme.dart';
import 'package:blogging/Features/Auth/Presentation/Pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//need url and anon key to connect with supabase
//those url and key i have stored it in Secrets folder in Core

void main() async {
  //we are using async and await so need to bind widget properly, so that reduces the possibility of errors in future
  WidgetsFlutterBinding.ensureInitialized();

  // async and await for supabase
 final supabase = await Supabase.initialize(url: Secrets.url, anonKey: Secrets.anonKey);
//supabase initilizing part is done

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blogging',
      theme: AppTheme.darkThemeMode, //here the theme of the app is not matching
      // --as expected, want to modify the color of darkMode, go to theme.dart
      home: const LoginPage(),
    );
  }
}
