import 'package:flutter/material.dart';

import 'constants/theme.dart';
import 'constants/routes.dart' as route;

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors['white'],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Icon(Icons.shield_outlined,
                    size: 130, color: colors['secondary']),
                Icon(
                  Icons.lock_outline_sharp,
                  size: 40,
                  color: colors['secondary3'],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Text(
                  'Savey',
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: colors["primary"] as Color),
                ),
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
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
                        color: Colors.black12),
                    child: textFieldWidget(
                      label: 'Enter Username',
                      controller: _usernameController,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black12),
                    child: textFieldWidget(
                      label: 'Enter Password',
                      controller: _passwordController,
                      password: true,
                    ),
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
                        backgroundColor: colors["primary"],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, route.dashboard);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 20,
                          color: colors['white'] as Color,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        textBaseline: TextBaseline.alphabetic,
                        color: colors['secondary'],
                      ),
                    ),
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
    );
  }

  TextField textFieldWidget({label, controller, password = false, props}) {
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
          labelStyle: const TextStyle(
            fontFamily: 'Ubuntu',
            color: Colors.grey,
          )),
    );
  }
}
