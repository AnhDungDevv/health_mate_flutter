import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/auth/domain/usecases/otp_usecase.dart';
import 'package:health_mate/src/auth/presentation/app/states/verify_o_t_p_state.dart';

class VerifyOtpNotifier extends StateNotifier<VerifyOtpState> {
  final VerifyOtpUseCase _verifyOtpUseCase;

  VerifyOtpNotifier(this._verifyOtpUseCase)
      : super(VerifyOtpState(errorMessage: null));

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
