import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Talks to POST /auth/login and POST /auth/register (see the
/// "Modules back-end" table in the technical proposal doc).
/// Stubbed for now — wire to the real NestJS API once it is reachable.
class AuthController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> login({required String phone, required String pin}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // TODO: POST /auth/login { phone, pin } once api/ exposes it.
      await Future<void>.delayed(const Duration(milliseconds: 400));
    });
  }

  Future<void> register({required String phone, required String pin}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // TODO: POST /auth/register { phone, pin }.
      await Future<void>.delayed(const Duration(milliseconds: 400));
    });
  }
}

final authControllerProvider =
    AsyncNotifierProvider<AuthController, void>(AuthController.new);
