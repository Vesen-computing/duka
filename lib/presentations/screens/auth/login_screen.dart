import 'package:flutter/material.dart';

import '../../../constants/theme.dart';
import '../../../constants/routes.dart' as route;

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: whiteColor,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Column(
                children: [
                  Text(
                    'Duka',
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Use your credentials to access your account',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.black.withOpacity(.1)),
                      child: textFieldWidget(
                          label: 'Enter Username',
                          controller: _usernameController,
                          prefixIcon: const Icon(Icons.person_2_sharp)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.black.withOpacity(.1)),
                      child: textFieldWidget(
                          label: 'Enter Password',
                          controller: _passwordController,
                          password: true,
                          prefixIcon: const Icon(Icons.lock_outline)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      margin: const EdgeInsets.only(top: 1),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, route.dashboard);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 20,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(top: 15),
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.bold,
                                textBaseline: TextBaseline.alphabetic,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(route.signUp);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 15),
                            child: const Text(
                              'Create an account',
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.bold,
                                textBaseline: TextBaseline.alphabetic,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField textFieldWidget(
      {label, controller, password = false, props, prefixIcon}) {
    var suffixIcon = password
        ? IconButton(
            icon: const Icon(Icons.remove_red_eye_outlined),
            onPressed: () {},
          )
        : null;
    return TextField(
      controller: controller,
      obscureText: password,
      obscuringCharacter: '*',
      style: const TextStyle(
        fontFamily: 'Ubuntu',
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      decoration: InputDecoration(
          label: Text(label),
          contentPadding: const EdgeInsets.all(10),
          border: InputBorder.none,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          labelStyle: const TextStyle(
            fontFamily: 'Ubuntu',
            color: Colors.grey,
          )),
    );
  }
}
