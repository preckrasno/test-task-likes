import 'package:dreambit/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:dreambit/injection.dart';
import 'package:dreambit/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjection();
  runApp(BlocProvider(
    create: (_) => NavigationBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Dreambit',
      home: FlowBuilder(
        state: context.watch<NavigationBloc>().state,
        onGeneratePages: _appRouter.onGeneratePages,
      ),
    );
  }
}
