import 'package:assigment_5/cubits/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ThisLogin extends StatelessWidget {
  const ThisLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('This Login Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: (() {
              context.go(context.namedLocation('home'));
            }),
            child: Text('Go Home'),
          ),
          ElevatedButton(
            onPressed: (() {
              context.read<LoginCubit>().login();
            }),
            child: Text('Login'),
          ),
        ],
      )),
    );
  }
}
