// login.dart
import 'package:flutter/material.dart';
import 'package:quizapp/screens/login/signup_screen.dart';
import 'package:quizapp/screens/quiz_screen.dart';

import '../../services/cognito_service.dart';
import '../profile_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _error = '';
  bool _isResetPassword = false;
  final _resetCodeController = TextEditingController();
  final _newPasswordController = TextEditingController();

  Future<void> _handleSubmit() async {
    try {
      // Validate email and password are not empty
      if (_emailController.text.trim().isEmpty ||
          _passwordController.text.isEmpty) {
        setState(() {
          _error = 'Email and password are required';
        });
        return;
      }

      // Add email format validation
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(_emailController.text.trim())) {
        setState(() {
          _error = 'Please enter a valid email address';
        });
        return;
      }

      // Add password minimum length validation
      if (_passwordController.text.length < 8) {
        setState(() {
          _error = 'Password must be at least 8 characters long';
        });
        return;
      }

      final signInResult = await CognitoService().signIn(
        _emailController.text.trim(),
        _passwordController.text,
      );

      if (signInResult == null) {
        setState(() {
          _error = 'Login failed - please check your credentials';
        });
        return;
      }

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const QuizScreen()));
    } catch (e) {
      setState(() {
        // Provide a more user-friendly error message
        if (e.toString().contains('NotAuthorizedException')) {
          _error = 'Invalid email or password';
        } else if (e.toString().contains('UserNotFoundException')) {
          _error = 'No account found with this email';
        } else {
          _error = 'Login failed - please try again';
        }
      });
    }
  }

  Future<void> _handleForgotPassword() async {
    try {
      if (_emailController.text.trim().isEmpty) {
        setState(() {
          _error = 'Please enter your email address';
        });
        return;
      }

      await CognitoService().forgotPassword(_emailController.text);
      setState(() {
        _isResetPassword = true;
        _error = '';
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to send reset code - please try again';
      });
    }
  }

  Future<void> _handleResetPassword() async {
    // Validate reset code is not empty
    if (_resetCodeController.text.trim().isEmpty) {
      setState(() {
        _error = 'Reset code is required';
      });
      return;
    }

    // Validate new password is not empty and contains at least 2 non-whitespace characters
    if (!RegExp(r'^[\S]{8,}$').hasMatch(_newPasswordController.text)) {
      setState(() {
        _error = 'Password must be at least 8 characters long';
      });
      return;
    }

    try {
      await CognitoService().confirmForgotPassword(
        _emailController.text,
        _resetCodeController.text.trim(),
        _newPasswordController.text,
      );
      setState(() {
        _isResetPassword = false;
        _error = '';
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to reset password - please try again';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _isResetPassword
                          ? 'Reset Password'
                          : 'Sign in to your account',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    if (_error.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          border: Border.all(color: Colors.red[400]!),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          _error,
                          style: TextStyle(color: Colors.red[700]),
                        ),
                      ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email address',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    if (!_isResetPassword) ...[
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          helperText: 'Minimum 8 characters',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _handleSubmit,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                        ),
                        child: const Text('Sign in'),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () =>
                            setState(() => _isResetPassword = true),
                        child: const Text('Forgot Password?'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SignUpScreen()));
                        },
                        child: const Text("Don't have an account? Sign up"),
                      ),
                    ] else ...[
                      TextField(
                        controller: _resetCodeController,
                        decoration: const InputDecoration(
                          labelText: 'Reset Code',
                          border: OutlineInputBorder(),
                          helperText: 'Enter the code sent to your email',
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _newPasswordController,
                        decoration: const InputDecoration(
                          labelText: 'New Password',
                          border: OutlineInputBorder(),
                          helperText: 'Minimum 8 characters',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _handleResetPassword,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                        ),
                        child: const Text('Reset Password'),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: _handleForgotPassword,
                        child: const Text('Resend Code'),
                      ),
                      TextButton(
                        onPressed: () =>
                            setState(() => _isResetPassword = false),
                        child: const Text('Back to Sign In'),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
