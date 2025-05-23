import 'package:flutter/material.dart';
import 'package:pm_blog_app/core/theme/app_pallete.dart';
import 'package:pm_blog_app/features/auth/presentation/pages/login_page.dart';
import 'package:pm_blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:pm_blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignUpPage());

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
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
      appBar: AppBar(),

      // backgroundColor: Colors.black, // optional background color
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign Up.',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              AuthField(hintText: 'Name', controller: nameController),
              const SizedBox(height: 30),
              AuthField(hintText: 'Email', controller: emailController),
              const SizedBox(height: 30),
              AuthField(
                hintText: 'Password',
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(height: 30),
              AuthGradientButton(buttonText: 'Sign Up'),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, LoginPage.route());
                },
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account?  ",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    children: [
                      TextSpan(
                        text: 'Sign In',
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
