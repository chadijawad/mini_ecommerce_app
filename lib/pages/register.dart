import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/constant/colors.dart';
import 'package:mini_ecommerce_app/constant/snackbar.dart';
import 'package:mini_ecommerce_app/constant/textfield.dart';
import 'package:mini_ecommerce_app/pages/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final titleController = TextEditingController();
  final ageController = TextEditingController();
  bool isloading = false;
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool isPassword8Charecters = false;
  bool hasUppercase = false;
  bool hasDigits = false;
  bool hasLowercase = false;
  bool hasSpecialCharacters = false;
  onPasswordChanges(String password) {
    setState(() {
      isPassword8Charecters = false;
      if (password.contains(RegExp(r'.{8,}'))) {
        isPassword8Charecters = true;
      }
      hasLowercase = false;
      if (password.contains(RegExp(r'[a-z]'))) {
        hasLowercase = true;
      }
      hasSpecialCharacters = false;
      if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        hasSpecialCharacters = true;
      }
      hasDigits = false;
      if (password.contains(RegExp(r'[0-9]'))) {
        hasDigits = true;
      }
      hasUppercase = false;
      if (password.contains(RegExp(r'[A-Z]'))) {
        hasUppercase = true;
      }
    });
  }

  register() async {
    setState(() {
      isloading = true;
    });

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users
          .doc(credential.user!.uid)
          .set({
            'username': usernameController.text,
            'age': ageController.text.toString(),
            'title': titleController.text,
            'email': emailController.text
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
      // showSnackBar(context, 'Registration successful!');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
        showSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'The account already exists for that email.');
      } else {
        showSnackBar(context, 'Error-please try again later');
      }
    } catch (e) {
      // print(e);
      showSnackBar(context, '$e\nPlease check your internet connection.');
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    titleController.dispose();
    ageController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          backgroundColor: appbarGreen,
        ),
        backgroundColor: const Color.fromARGB(255, 179, 166, 166),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(33.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: usernameController,
                          decoration: decorationTextfield.copyWith(
                              hintText: 'Enter your username',
                              suffixIcon: const Icon(Icons.account_box_sharp)),
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 33),
                        TextFormField(
                          controller: ageController,
                          decoration: decorationTextfield.copyWith(
                            hintText: 'Enter your age',
                            suffixIcon: const Icon(Icons.view_agenda_rounded),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 33),
                        TextFormField(
                          controller: titleController,
                          decoration: decorationTextfield.copyWith(
                            hintText: 'Enter your title',
                            suffixIcon: const Icon(Icons.title),
                          ),
                          keyboardType: TextInputType.text,
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
                        TextFormField(
                          onChanged: (value) {
                            onPasswordChanges(value);
                          },
                          validator: (value) {
                            return value!.length < 8
                                ? "Enter at least 6 characters"
                                : null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: passwordController,
                          decoration: decorationTextfield.copyWith(
                            hintText: 'Enter your password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              icon: Icon(isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: isObscure,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: isPassword8Charecters
                                ? Colors.green
                                : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 189, 189, 189))),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('At least 8 characters'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: hasDigits ? Colors.green : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 189, 189, 189))),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('At least 1 number'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: hasUppercase ? Colors.green : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 189, 189, 189))),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('Has Uppercase'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: hasLowercase ? Colors.green : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 189, 189, 189))),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('Has LowerCase'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: hasSpecialCharacters
                                ? Colors.green
                                : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 189, 189, 189))),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('Has special charecters'),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        register();
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
                            'Register',
                            style: TextStyle(fontSize: 15, color: Colors.white),
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
                        style: TextStyle(fontSize: 16),
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
                          style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
