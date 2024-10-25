import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pinput.dart';
import 'package:craft_my_plate/screens/HomeScreen.dart';

class LoginScreen2 extends StatefulWidget {
  @override
  _LoginScreen2State createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  String? verificationId;
  String? phoneNumber;
  bool _isResending = false;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    verificationId = args?['verificationId'];
    phoneNumber = args?['phoneNumber'];
  }

  void _verifyOtp() async {
    if (pinController.text.length != 6) {
      Fluttertoast.showToast(msg: "Please enter a complete OTP", backgroundColor: Colors.red);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: pinController.text,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      Fluttertoast.showToast(msg: "OTP Verified!", backgroundColor: Colors.green);

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() => _isLoading = false);
      Fluttertoast.showToast(msg: e.message ?? "Verification failed", backgroundColor: Colors.red);
    }
  }

  void _resendOtp() async {
    if (_isResending) return;

    setState(() => _isResending = true);

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        verificationFailed: (FirebaseAuthException e) {
          setState(() => _isResending = false);
          Fluttertoast.showToast(msg: e.message ?? "Verification failed", backgroundColor: Colors.red);
        },
        codeSent: (String newVerificationId, int? resendToken) {
          setState(() {
            verificationId = newVerificationId;
            _isResending = false;
          });
          Fluttertoast.showToast(msg: "OTP Resent Successfully!", backgroundColor: Colors.green);
        },
        codeAutoRetrievalTimeout: (String newVerificationId) {},
      );
    } catch (e) {
      setState(() => _isResending = false);
      Fluttertoast.showToast(msg: e.toString(), backgroundColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(
        fontSize: 24,
        color: Colors.black,
      ),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black, width: 2)),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: const Border(bottom: BorderSide(color: Color(0xFF6318AF), width: 2)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "OTP Verification",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            const Text(
              "We have sent a verification code to",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "+91-${phoneNumber?.replaceAll(RegExp(r'\d(?=\d{4})'), 'X') ?? ''}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const Icon(Icons.check_circle, color: Colors.green),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Pinput(
                length: 6,
                controller: pinController,
                focusNode: focusNode,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                onCompleted: (pin) => _verifyOtp(),
              ),
            ),
            const SizedBox(height: 30),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
              onPressed: _verifyOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6318AF),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _isResending ? null : _resendOtp,
              child: const Text.rich(
                TextSpan(
                  text: "Didn't receive code? ",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                  children: [
                    TextSpan(
                      text: "Resend Again.",
                      style: TextStyle(
                        color: Color(0xFF6318AF),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            if (_isResending)
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
