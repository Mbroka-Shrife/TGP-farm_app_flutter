import 'package:farm_app/helpers/constants.dart';
import 'package:farm_app/helpers/space_widget.dart';
import 'package:farm_app/helpers/widgets/custom_general_buttom.dart';
import 'package:farm_app/models/login_model.dart';
import 'package:farm_app/providers/login_provider.dart';
import 'package:farm_app/screens/auth/register.dart';
import 'package:farm_app/screens/cutomer/custmer_home_page.dart';
import 'package:farm_app/screens/farmers/farm_home_page.dart'; 
import 'package:farm_app/widgets/custom_text_farm.dart';
import 'package:flutter/foundation.dart'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController(
    
    text: kDebugMode ? "saee@mail.com" : "",
  );
  final TextEditingController passwordController = TextEditingController(
    text: kDebugMode ? "12345678" : "",);
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
       resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const VerticalSpace(15), 
              const Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 40, 
                  fontWeight: FontWeight.bold,
                  color: kMainColor, 
                ),
              ),
              
              const VerticalSpace(2),
              
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Color(0xff78787c),
                ),
              ),
              
              const VerticalSpace(6),
               CustomFormField(
                controller: emailController,
                hintText: 'Email',
                suffixIcon: Icons.email,
                inputType: TextInputType.emailAddress,
              ),
              
              const VerticalSpace(2),
              
               CustomFormField(
                controller: passwordController,
                hintText: 'Password',
                suffixIcon: Icons.lock,
                isPassword: true,
              ),
              
              const VerticalSpace(5),
              
              // زر تسجيل الدخول (استخدمت اسم ملفك كما هو موجود في الصورة)
               CustomGeneralButtom(
              text: authProvider.isLoading ? 'Loading...' : 'Login',
              onTap: () async {
                if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Fill all fields")));
                  return;
                }

                // تنفيذ عملية الدخول
                LoginModel result = await authProvider.loginUser(
                  emailController.text, 
                  passwordController.text
                );

                if (result.status) {
                  // المنطق الذي طلبتهِ: التوجيه حسب النوع
                  if (result.user?.role == 'farmer') {
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const FarmHomePage()));
                  } else {
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const CustmerHomePage()));
                  }
                } else {
                  // عرض الخطأ إذا فشل الدخول
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(result.message ?? "Login Failed"))
                  );
                }
              },
            ),
              
              const VerticalSpace(3),
              
              // رابط لإنشاء حساب جديد
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                         context,
                          MaterialPageRoute(builder: (context) => const RegisterPage()),
                         );
                    },
                    child: const Text(
                      "Register Now",
                      style: TextStyle(
                        color: kMainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}