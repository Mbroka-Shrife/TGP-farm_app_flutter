import 'package:farm_app/helpers/constants.dart';
import 'package:farm_app/helpers/space_widget.dart';
import 'package:farm_app/helpers/widgets/custom_general_buttom.dart'; 
import 'package:farm_app/widgets/custom_text_farm.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // متغير لتحديد نوع الحساب: true مزارع ، false متجر
  bool isFarmer = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const VerticalSpace(8),
              const Text(
                'Create Account',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: kMainColor,
                ),
              ),
              const VerticalSpace(3),
              
              // أزرار الاختيار بين مزارع ومتجر
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isFarmer = true),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: isFarmer ? kMainColor : Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Farmer",
                            style: TextStyle(
                              color: isFarmer ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isFarmer = false),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: !isFarmer ? kMainColor : Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Store",
                            style: TextStyle(
                              color: !isFarmer ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const VerticalSpace(4),

              // الحقول المشتركة للاثنين
              const CustomFormField(
                hintText: 'Full Name', 
                suffixIcon: Icons.person,
              ),
              const VerticalSpace(2),
              const CustomFormField(
                hintText: 'Email', 
                suffixIcon: Icons.email, 
                inputType: TextInputType.emailAddress,
              ),
              const VerticalSpace(2),
              const CustomFormField(
                hintText: 'Phone Number', 
                suffixIcon: Icons.phone, 
                inputType: TextInputType.phone,
              ),
              const VerticalSpace(2),// حقول تظهر بناءً على نوع المستخدم (مزارع أو متجر)
              if (isFarmer) ...[
                const CustomFormField(hintText: 'Farm Name', suffixIcon: Icons.agriculture),
                const VerticalSpace(2),
                const CustomFormField(hintText: 'Farm Location', suffixIcon: Icons.location_on),
              ] else ...[
                const CustomFormField(hintText: 'Store Name', suffixIcon: Icons.store),
                const VerticalSpace(2),
                const CustomFormField(hintText: 'Store Location', suffixIcon: Icons.location_city),
              ],

              const VerticalSpace(2),
              const CustomFormField(
                hintText: 'Password', 
                suffixIcon: Icons.lock, 
                isPassword: true,
              ),
              
              const VerticalSpace(5),

              // زر التسجيل
              CustomGeneralButtom(
                text: 'Register',
                onTap: () {
                  // سيتم الربط مع Laravel API هنا
                },
              ),
              
              const VerticalSpace(2),

              // زر العودة لصفحة تسجيل الدخول (Login)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xff78787c),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // الرجوع للخلف لصفحة الـ Login
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: kMainColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
              
              const VerticalSpace(3),
            ],
          ),
        ),
      ),
    );
  }
}