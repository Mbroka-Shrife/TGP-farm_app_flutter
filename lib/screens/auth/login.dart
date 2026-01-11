import 'package:farm_app/helpers/constants.dart';
import 'package:farm_app/helpers/space_widget.dart';
import 'package:farm_app/helpers/widgets/custom_general_buttom.dart';
import 'package:farm_app/screens/auth/register.dart'; 
import 'package:farm_app/widgets/custom_text_farm.dart'; 
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const VerticalSpace(15), // زيادة المسافة من الأعلى لتعويض غياب الصورة
              
              // بدلاً من الصورة، سنضع نص "Login" كبير
              const Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 40, // حجم كبير وواضح
                  fontWeight: FontWeight.bold,
                  color: kMainColor, // اللون الأخضر الأساسي في مشروعك
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
              
              // حقل البريد الإلكتروني
              const CustomFormField(
                hintText: 'Email',
                suffixIcon: Icons.email,
                inputType: TextInputType.emailAddress,
              ),
              
              const VerticalSpace(2),
              
              // حقل كلمة المرور
              const CustomFormField(
                hintText: 'Password',
                suffixIcon: Icons.lock,
                isPassword: true,
              ),
              
              const VerticalSpace(5),
              
              // زر تسجيل الدخول (استخدمت اسم ملفك كما هو موجود في الصورة)
              CustomGeneralButtom(
                text: 'Login',
                onTap: () {
                  // سنقوم بربط الـ API الخاص بـ Laravel هنا قريباً
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