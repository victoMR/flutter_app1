import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.blue, secondary: Colors.red),
        useMaterial3: true,
      ),
      home: const Login(title: 'Login App'),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Basic Widget 1: Flutter Logo
              const FlutterLogo(size: 120),

              const Spacer(),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              const Divider(),

              // Design Widget 1: Container with Box Decoration
              Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text(
                    'Custom Container',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      wordSpacing: 2,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigate the user to the Home page
                        if (emailController.text == "rangel@rangel.com" &&
                            passwordController.text == "12345") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage(
                                      email: emailController.text,
                                    )),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Invalid Credentials')),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill input')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ),

              // Design Widget 2: Divider
              const Divider(),

              // Basic Widget 3: Icon
              const Icon(
                Icons.favorite_border,
                size: 50,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Design Widget 3: Card Widget
class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Pagina de Login ',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
            wordSpacing: 2,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}

// Navigating in login
class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          // Design Widget 4: Custom Card
          const CustomCard(),

          const SizedBox(height: 20),

          Text(
            'Welcome $email',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          // Design Widget 5: Elevated Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple, // background
                onPrimary: Colors.white, // foreground
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10), // button padding
                maximumSize: Size(200, 50), // set the maximum button size
                shadowColor: Color(0xFF000000), // changes position of shadow
              ),
              child: const Text("Regresar!"),
            ),
          ),
        ],
      ),
    );
  }
}
