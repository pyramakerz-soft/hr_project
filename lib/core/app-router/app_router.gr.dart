// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/user_reponse.dart'
    as _i5;
import 'package:pyramakerz_atendnace/features/auth/persentation/login/login_page.dart'
    as _i2;
import 'package:pyramakerz_atendnace/features/dashboard/peresentation/pages/dashboard_page.dart'
    as _i1;

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i3.PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    _i4.Key? key,
    _i5.User? user,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          DashboardRoute.name,
          args: DashboardRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DashboardRouteArgs>(
          orElse: () => const DashboardRouteArgs());
      return _i1.DashboardPage(
        key: args.key,
        user: args.user,
      );
    },
  );
}

class DashboardRouteArgs {
  const DashboardRouteArgs({
    this.key,
    this.user,
  });

  final _i4.Key? key;

  final _i5.User? user;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i3.PageRouteInfo<void> {
  const LoginRoute({List<_i3.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginPage();
    },
  );
}
