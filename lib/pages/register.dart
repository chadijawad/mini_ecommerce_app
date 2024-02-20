import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/constant/colors.dart';
import 'package:mini_ecommerce_app/constant/textfield.dart';
import 'package:mini_ecommerce_app/pages/login.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 179, 166, 166),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(33.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextFieldInput(
                    text: 'Enter Your Username',
                    inpuType: TextInputType.text,
                    isObscure: false),
                const SizedBox(
                  height: 33,
                ),
                const TextFieldInput(
                    text: 'Enter Your Email',
                    inpuType: TextInputType.emailAddress,
                    isObscure: false),
                const SizedBox(
                  height: 33,
                ),
                const TextFieldInput(
                    text: 'Enter Your Password',
                    inpuType: TextInputType.text,
                    isObscure: true),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
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
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already Have An Account?',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
