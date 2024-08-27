
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/bloc/bloc/auth_bloc.dart';
import 'package:pyramakerz_atendnace/core/di/dependency_config.dart';

class MyBlockProviders {
  static getAllProvider() => [
          BlocProvider(
          create: (context) => getIt<AuthBloc>(),
        ),
      ];
}
