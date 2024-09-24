import 'package:blogging/Core/Secrets/supabase_secrets.dart';
import 'package:blogging/Core/theme/theme.dart';
import 'package:blogging/Features/Auth/Data/DataSources/auth_remote_data_source.dart';
import 'package:blogging/Features/Auth/Data/Repositories/auth_repository_impl.dart';
import 'package:blogging/Features/Auth/Domain/usecase/user_sign_up.dart';
import 'package:blogging/Features/Auth/Presentation/Pages/login_page.dart';
import 'package:blogging/Features/Auth/Presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//need url and anon key to connect with supabase
//those url and key i have stored it in Secrets folder in Core

void main() async {
  //we are using async and await so need to bind widget properly, so that reduces the possibility of errors in future
  WidgetsFlutterBinding.ensureInitialized();

  // async and await for supabase
  final supabase =
      await Supabase.initialize(url: Secrets.url, anonKey: Secrets.anonKey);
//supabase initilizing part is done

  //blocprovider helps us to register bloc,
  // -- and since we will be creating multiple bloc so need use multiblocprovider

  //dependency injection is part where you need to add instance externally,
  // to avoid repetition of code
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => AuthBloc(
        userSignup: UserSignup(
          AuthRepositoryImpl(AuthRemoteDataSourceImpl(supabase.client)),
        ),
      ),
    )
  ], child: const MyApp()));
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
