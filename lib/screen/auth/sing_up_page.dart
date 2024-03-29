import 'package:device_shop_app/screen/auth/widget/my_rich_text.dart';
import 'package:device_shop_app/utils/my_utils.dart';
import 'package:device_shop_app/view_models/auth_view_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.onClickedSignIn}) : super(key: key);

  final VoidCallback onClickedSignIn;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text(
        "Sign Up",
      )),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? "Enter a valid email"
                          : null,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black)),
                    errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (password) =>
                      password != null && password.length < 6
                          ? "Enter at least 6 charcter !"
                          : null,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black)),
                    errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: confirmPasswordController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (password) =>
                      password != null && password.length < 6
                          ? "Enter at least 6 charcter !"
                          : null,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black)),
                    errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black)),
                  ),
                ),
              ),
              SizedBox(height: 50),
              TextButton(onPressed: signUp, child: Text("Sign Up")),
              SizedBox(height: 20),
              MyRichText(
                onTap: widget.onClickedSignIn,
              ),
            ],
          ),
        ),
      ),
    );
  }

  signUp() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (confirmPassword == password) {
      Provider.of<AuthViewModel>(context,listen: false).signUp(
        email: email,
        password: password,
      );
    } else {
      MyUtils.getMyToast(message: "Passwords don't match!");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}