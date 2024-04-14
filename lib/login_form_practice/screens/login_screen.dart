import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_practice/login_form_practice/bloc/auth_bloc.dart';
import 'package:state_management_practice/login_form_practice/screens/user_info.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          } else if (state is AuthSuccessful) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserInfo(),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nameTextEditingController,
                  decoration: const InputDecoration(hintText: 'full name'),
                ),
                TextField(
                  controller: emailTextEditingController,
                  decoration: const InputDecoration(hintText: 'email address'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          AuthLoginRequested(
                              name: nameTextEditingController.value.text.trim(),
                              email: emailTextEditingController.text.trim()),
                        );
                  },
                  child: const Text('Sign In'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
