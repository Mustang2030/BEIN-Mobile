import 'package:bein_mobile/blocs/auth/auth_bloc.dart';
import 'package:bein_mobile/misc/buttons.dart';
import 'package:bein_mobile/misc/forms.dart';
import 'package:bein_mobile/services/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                ),
                const Text(
                  "Login to continue",
                  style: TextStyle(fontSize: 18),
                ),
                const ValName(
                  name: "Email",
                ),
                StyledFormField(
                  controller: emailController,
                  decoration: formS('Email', 'Enter your password her please',
                      Icons.email_outlined,
                      iconColor: Colors.white, hintTextColor: Colors.white),
                ),
                const SizedBox(height: 25),
                const ValName(name: "Password"),
                StyledFormField(
                  controller: passwordController,
                  decoration: formS('Password',
                      'Enter your password her please', Icons.password,
                      iconColor: Colors.white, hintTextColor: Colors.white),
                ),
                const SizedBox(height: 25),
                SubmitButton(
                    na: "Log In",
                    onPressed: () {
                      // final signIn = SignIn(
                      //   email: emailController.text.trim(),
                      //   password: passwordController.text.trim(),
                      // );
                      context.read<AuthBloc>().add(
                            SignInRequest(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ),
                          );
                    }),
                const SizedBox(height: 25),
                NavButton(
                  what: "Forgot Password?",
                  onPressed: () {},
                ),
                NavButton(
                  what: "Register!",
                  onPressed: () {
                    AppNavigator.pushReplacement(context, '/registrationPage');
                    // Navigator.pushNamed(context, RouteManager.register);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
