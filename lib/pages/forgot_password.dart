import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/constant/colors.dart';
import 'package:mini_ecommerce_app/constant/snackbar.dart';
import 'package:mini_ecommerce_app/constant/textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isloading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Forgot Password'),
          backgroundColor: appbarGreen,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(33.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Enter you email to reset your password',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 33,
                ),
                TextFormField(
                  validator: (email) {
                    return email!.contains(RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                        ? null
                        : "Enter a valid email";
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: emailController,
                  decoration: decorationTextfield.copyWith(
                      hintText: 'Enter your email',
                      suffixIcon: const Icon(Icons.email)),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 33,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                    } else {
                      showSnackBar(context, 'Form not validated');
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(BTNgreen),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(12),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: isloading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Reset password',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
