import 'package:flutter/material.dart';
import 'package:integration_test_example/utils/widget_keys.dart';

Widget myApp() {
  return MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomeRoute(),
      '/second': (context) => const SecondRoute(),
      '/third': (context) => const ThirdRoute(),
    },
  );
}

void main() {
  runApp(myApp());
}

class HomeRoute extends StatelessWidget {
  HomeRoute({super.key});

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Integration Test Setup'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: [
                TextField(
                  key: const ValueKey(WidgetKeys.userNameTextField),
                  controller: userNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  key: const ValueKey(WidgetKeys.passwordTextField),
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                OutlinedButton(
                  key: const ValueKey(WidgetKeys.loginButton),
                  child: const Text("Login"),
                  onPressed: () {
                    if (userNameController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.pushNamed(context, '/second');
                    }
                  },
                ),
              ],
            ),
          ),
          ElevatedButton(
            child: const Text('Click Me!'),
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
          ElevatedButton(
            child: const Text('Tap Me!'),
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
          ),
        ],
      )),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Click Me Page"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        key: const Key(WidgetKeys.clickMeButton),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back!, Currently You are on Click Me Page'),
        ),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tap Me Page"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        key: const Key(WidgetKeys.tapMeButton),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Back!, Currently You are on Tap Me Page',
          ),
        ),
      ),
    );
  }
}
