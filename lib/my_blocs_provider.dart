import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramakerz_atendnace/features/auth/persentation/login/bloc/bloc/auth_bloc.dart';
import 'package:pyramakerz_atendnace/core/di/dependency_config.dart';
import 'package:pyramakerz_atendnace/features/home/presentation/cubit/home_cubit.dart';

class MyBlockProviders {
  static getAllProvider() => [
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeCubit>()..init(),
        ),
      ];
}
