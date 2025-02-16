import 'package:bein_mobile/blocs/auth/auth_bloc.dart';
import 'package:bein_mobile/blocs/theme/theme_bloc.dart';
import 'package:bein_mobile/blocs/theme/theme_state.dart';
import 'package:bein_mobile/repositories/auth_repository.dart';
import 'package:bein_mobile/services/navigation/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final Dio dio = Dio();
  final authRepository = AuthRepository(dio);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloc(authRepository: authRepository)
              ..add(CheckAuthStatus())),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'BEIN Mobile App',
            theme: state.themeData,
            routerConfig: appRouter,
          );
        },
      ),
    ),
  );
}

// class BeinApp extends StatelessWidget {
//   const BeinApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => ThemeBloc()),
//       ],
//       child: BlocBuilder<ThemeBloc, ThemeState>(
//         builder: (context, state) {
//           return MaterialApp.router(
//             title: 'Flutter MultiBloc Demo',
//             theme: state.themeData,
//             routerConfig: appRouter,
//           );
//         },
//       ),
//     );
//   }
// }
