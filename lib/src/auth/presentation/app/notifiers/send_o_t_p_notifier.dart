import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/auth/domain/usecases/otp_usecase.dart';
import 'package:health_mate/src/auth/presentation/app/states/send_o_t_p_state.dart';

class SendOTPNotifier extends StateNotifier<SendOTPState> {
  final SendOtpUseCase _sendOtpUseCase;

  SendOTPNotifier(this._sendOtpUseCase) : super(SendOTPState());
  Future<void> sendOtp(String phoneNumber) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _sendOtpUseCase(phoneNumber);

    result.fold(
        (failure) => state = state.copyWith(
            isLoading: false, errorMessage: _mapFailureToMessage(failure)),
        (verificationId) => state =
            state.copyWith(isLoading: false, verificationId: verificationId));
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
