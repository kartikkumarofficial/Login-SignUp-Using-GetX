import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controllers/login_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoginController loginController = Get.put(LoginController());
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF6A11CB),
                Color(0xFF2575FC),
              ],
            ),
          ),
          child: Column(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.08,right:Get.width * 0.08,top: Get.width*0.5),
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.black45,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Get.width * 0.05),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(Get.width * 0.05),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: Get.height * 0.02),
                            Text(
                              'Welcome Back!',
                              style: TextStyle(
                                fontSize: Get.textScaleFactor * 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Text(
                              'Login to continue',
                              style: TextStyle(
                                fontSize: Get.textScaleFactor * 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.05),
                            TextFormField(
                              controller: loginController.emailController.value,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter your email',
                                prefixIcon: const Icon(Icons.email_outlined),
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(Get.width * 0.04),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(Get.width * 0.04),
                                  borderSide: const BorderSide(
                                    color: Colors.blueAccent,
                                    width: 2,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.grey[100],
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: Get.height * 0.02),
                            TextFormField(
                              controller: loginController.passwordController.value,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                prefixIcon: const Icon(Icons.lock_outline),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(Get.width * 0.04),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(Get.width * 0.04),
                                  borderSide: const BorderSide(
                                    color: Colors.blueAccent,
                                    width: 2,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.grey[100],
                              ),
                              obscureText: !_isPasswordVisible,
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  // Handle forgot password
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: const Color(0xFF6A11CB),
                                    fontWeight: FontWeight.bold,
                                    fontSize: Get.textScaleFactor * 14,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height * 0.03),
                            Obx(()=>ElevatedButton(
                              onPressed: () {
        
                                loginController.loginApi();
        
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6A11CB),
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.3,
                                  vertical: Get.height * 0.02,
                                ),
                                textStyle: TextStyle(
                                  fontSize: Get.textScaleFactor * 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(Get.width * 0.04),
                                ),
                                elevation: 5,
                              ),
                              child: loginController.loading.value? CircularProgressIndicator(color: Colors.white,) : Text('Login'),
                            ),),
                            SizedBox(height: Get.height * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: Get.textScaleFactor * 14,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Handle signup
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: const Color(0xFF6A11CB),
                                      fontWeight: FontWeight.bold,
                                      fontSize: Get.textScaleFactor * 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.01),
                          ],
                        ),
                      ),
                    ),
        
                  ),
                ),
              ),
              SizedBox(height:Get.height*0.01),
              Container(
                height: Get.height*0.1,
        
                child: Text('Email: eve.holt@reqres.in \n  Password :cityslicka'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
