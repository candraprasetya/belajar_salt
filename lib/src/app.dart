import 'dart:io';

import 'package:belajar_flutter/src/blocs/blocs.dart';
import 'package:belajar_flutter/src/cubits/cubits.dart';
import 'package:belajar_flutter/src/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductBloc()),
        BlocProvider(create: (context) => ProductDetailBloc()),
        BlocProvider(create: (context) => CheckLoginCubit()),
        BlocProvider(create: (context) => ColorSelectBloc()),
        BlocProvider(create: (context) => ColorSelectCubit()),
      ],
      child: (Platform.isAndroid)
          ? const MaterialApp(
              title: 'Belajar Dengan SALT',
              home: SplashScreen(),
            )
          : const CupertinoApp(
              title: 'Belajar Dengan SALT - iOS',
              home: SplashScreen(),
            ),
    );
  }
}
