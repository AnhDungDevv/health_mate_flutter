import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class VerifyPhoneScreen extends StatefulWidget {
  const VerifyPhoneScreen({super.key});

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  String otp = '';
  Timer? _timer;
  int _countDown = 30;
  bool _canResend = false;
  final OtpFieldController _otpFieldController = OtpFieldController();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countDown > 0) {
          _countDown--;
        } else {
          _timer?.cancel();
          _canResend = true;
        }
      });
    });
  }

  void _resendOtp() {
    if (_canResend) {
      setState(() {
        _countDown = 30;
        _canResend = false;
        otp = '';
      });
      startTimer();
      _otpFieldController.clear();
      // TODO:  OTP từ server
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Enter Verification Code',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'We have sent a 6-digit code to',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              // Text(
              //   // Hash.formatPhoneNumber(widget.phoneNumber),
              //   // style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // ),
              const SizedBox(height: 40),

              // OTP Input
              OTPTextField(
                controller: _otpFieldController,
                fieldWidth: 50,
                fieldStyle: FieldStyle.box,
                length: 6,
                keyboardType: TextInputType.number,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceBetween,
                onChanged: (pin) => setState(() => otp = pin),
                otpFieldStyle: OtpFieldStyle(
                  borderColor: Colors.blueAccent,
                  enabledBorderColor: Colors.grey.shade300,
                  focusBorderColor: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),

              // Countdown & Resend
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _countDown > 0
                        ? 'Resend code in 00:${_countDown.toString().padLeft(2, '0')}'
                        : 'Didn\'t receive code?',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(width: 5),
                  _canResend
                      ? GestureDetector(
                          onTap: _resendOtp,
                          child: Text(
                            'Resend',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              const SizedBox(height: 40),
            ],
          )),
          // Continue Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: otp.length == 6
                  ? () {
                      // TODO: Verify OTP from server
                      context.push('/onboarding-selection');
                    }
                  : null,
              child: Text(
                'Verify & Continue',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
