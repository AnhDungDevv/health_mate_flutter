import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/modules/auth/domain/usecases/otp_usecase.dart';
import 'package:health_mate/modules/auth/presentation/states/notifiers/otp/verification_state.dart';

class AuthOtpNotifier extends StateNotifier<AuthOtpState> {
  final SendOtpUseCase _sendOtpUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;

  AuthOtpNotifier(this._sendOtpUseCase, this._verifyOtpUseCase)
      : super(AuthOtpState(errorMessage: null));

  Future<void> sendOtp(String phoneNumber) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _sendOtpUseCase(phoneNumber);
    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: _mapFailureToMessage(failure),
      ),
      (verificationId) => state = state.copyWith(
        isLoading: false,
        verificationId: verificationId,
      ),
    );
  }

  Future<void> verifyOtp(String verificationId, String smsCode) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _verifyOtpUseCase(verificationId, smsCode);
    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: _mapFailureToMessage(failure),
      ),
      (_) => state = state.copyWith(isLoading: false),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return "Lỗi máy chủ: ${failure.message}";
    } else if (failure is NetworkFailure) {
      return "Lỗi kết nối mạng. Vui lòng thử lại.";
    } else {
      return "Đã xảy ra lỗi không xác định.";
    }
  }
}
