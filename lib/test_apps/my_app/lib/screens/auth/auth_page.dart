import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:my_app/repositories/auth/auth_imp.dart';
import 'package:my_app/repositories/auth/auth_int.dart';
import 'package:my_app/screens/auth/auth_view.dart';

class AuthPage extends StatelessWidget {
  final IAuth authRepo = AuthRepo();
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(authRepo: authRepo),
      child: AuthView(),
    );
  }
}
