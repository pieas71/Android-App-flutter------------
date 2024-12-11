import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app/wrapper.dart';
import 'package:mobile_app/Pages/HomePage/HomePage.dart'; // Import HomePage

const primaryColor = Color.fromARGB(255, 22, 206, 219);
const secondaryColor = Color(0xFF00C236);
const backgroundColor = Color(0xFFFFFFFF);
const fontColor = Color(0xFF000000);
const levelColor = Color(0xFF686868);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false, // Disable debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Wrapper(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful!')),
      );

      Get.to(() => HomePage());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 330,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('Assets/Images/COVER .png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 20),

                Text(
                  "বইয়ের-হাট",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 81, 199, 219),
                  ),
                ),
                const SizedBox(height: 20),
                // Login Text
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 146, 192, 196),
                  ),
                ),
                const SizedBox(height: 20),
                // Email TextField
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    hintStyle: TextStyle(color: levelColor),
                    filled: true,
                    fillColor: secondaryColor.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: fontColor),
                ),
                const SizedBox(height: 15),
                // Password TextField
                TextField(
                  controller: password,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    hintStyle: TextStyle(color: levelColor),
                    filled: true,
                    fillColor: secondaryColor.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  obscureText: true,
                  style: const TextStyle(color: fontColor),
                ),
                const SizedBox(height: 25),
                // Login Button
                ElevatedButton(
                  onPressed: signIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: backgroundColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
