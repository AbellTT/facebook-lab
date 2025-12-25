import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:facebook/services/auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _mobileOrEmailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isGoogleLoading = false;
  final AuthService _authService = AuthService();

  @override
  void dispose() {
    _firstNameController.dispose();
    _surnameController.dispose();
    _mobileOrEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> createAccount() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _mobileOrEmailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    print("User created successfully!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // Facebook logo
                  const Center(
                    child: Text(
                      'facebook',
                      style: TextStyle(
                        color: Color(0xFF1877F2),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Center(
                    child: Text(
                      'Create a new account',
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Center(
                    child: Text(
                      "It's quick and easy.",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // First name
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      hintText: 'First name',
                      filled: true,
                      fillColor: const Color(0xFFF5F6F7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'What\'s your name?';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 12),

                  // Surname
                  TextFormField(
                    controller: _surnameController,
                    decoration: InputDecoration(
                      hintText: 'Surname',
                      filled: true,
                      fillColor: const Color(0xFFF5F6F7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'What\'s your surname?';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 12),

                  // Mobile number or email
                  TextFormField(
                    controller: _mobileOrEmailController,
                    decoration: InputDecoration(
                      hintText: 'Mobile number or email address',
                      filled: true,
                      fillColor: const Color(0xFFF5F6F7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter mobile number or email address';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 12),

                  // Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'New password',
                      filled: true,
                      fillColor: const Color(0xFFF5F6F7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Choose a password';
                      }
                      if (value.length < 6) {
                        return 'Password should be at least 6 characters';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'By tapping Sign Up, you agree to our Terms, Data Policy and Cookie Policy.',
                    style: TextStyle(fontSize: 11, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  // Sign Up button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        print("Starting sign up process...");
                        if (_formKey.currentState!.validate()) {
                          final messenger = ScaffoldMessenger.of(context);
                          final navigator = Navigator.of(context);
                          messenger.clearSnackBars();
                          try {
                            print("Starting account creation...");
                            await createAccount();
                            print("Account created successfully!");
                            if (!mounted) {
                              print("Widget not mounted, returning");
                              return;
                            }
                            print("Navigating to home screen...");
                            // Navigate to home screen
                            await navigator.pushNamed('/home');
                            print("Navigation completed!");
                            // Show success message after navigation
                            messenger.showSnackBar(
                              const SnackBar(
                                content: Text("Account created successfully"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            print("Firebase error: ${e.code} - ${e.message}");
                            String message;
                            if (e.code == 'email-already-in-use') {
                              message =
                                  'An account already exists with this email.';
                            } else if (e.code == 'weak-password') {
                              message = 'Password is too weak.';
                            } else {
                              message = e.message ?? 'Authentication error.';
                            }
                            messenger.showSnackBar(
                              SnackBar(content: Text(message)),
                            );
                          } catch (e) {
                            print("Unexpected error: $e");
                            messenger.showSnackBar(
                              SnackBar(content: Text("An error occurred: $e")),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00A400),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // OR divider
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Google Sign-In button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: _isGoogleLoading
                          ? null
                          : () async {
                              setState(() {
                                _isGoogleLoading = true;
                              });

                              final messenger = ScaffoldMessenger.of(context);
                              final navigator = Navigator.of(context);

                              try {
                                final userCredential = await _authService
                                    .signInWithGoogle();

                                if (userCredential != null) {
                                  if (!mounted) return;
                                  await navigator.pushNamed('/home');
                                  messenger.showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Signed in with Google successfully!',
                                      ),
                                      backgroundColor: Colors.green,
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                              } catch (e) {
                                messenger.showSnackBar(
                                  SnackBar(
                                    content: Text('Error: ${e.toString()}'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } finally {
                                if (mounted) {
                                  setState(() {
                                    _isGoogleLoading = false;
                                  });
                                }
                              }
                            },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: BorderSide(color: Colors.grey.shade300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: _isGoogleLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF1877F2),
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/google_logo.png',
                                  height: 24,
                                  width: 24,
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Sign in with Google',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Navigate back or to login page
                      },
                      child: const Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Color(0xFF1877F2),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
