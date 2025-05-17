import 'package:flutter/material.dart';
import 'package:pm_blog_app/core/theme/app_pallete.dart';
import 'package:pm_blog_app/features/auth/presentation/pages/signup_page.dart';
import 'package:pm_blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:pm_blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginPage());

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onSignUpPressed() {
    if (formKey.currentState!.validate()) {
      // Proceed with signup logic
      debugPrint('Form is valid. Proceed with sign up.');
    } else {
      debugPrint('Form is invalid.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In.',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              AuthField(hintText: 'Email', controller: emailController),
              const SizedBox(height: 30),
              AuthField(
                hintText: 'Password',
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(height: 30),
              AuthGradientButton(buttonText: 'Sign In'),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, SignUpPage.route());
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account?  ",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color: AppPallete.gradient2,
                          fontWeight: FontWeight.bold,
                        ),
                        // You can add a TapGestureRecognizer here for navigation
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
