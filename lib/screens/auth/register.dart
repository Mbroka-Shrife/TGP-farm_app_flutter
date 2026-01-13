import 'package:farm_app/helpers/constants.dart';
import 'package:farm_app/helpers/consts.dart';
import 'package:farm_app/helpers/space_widget.dart';
import 'package:farm_app/helpers/widgets/custom_general_buttom.dart';
import 'package:farm_app/providers/register_provider.dart';
import 'package:farm_app/widgets/custom_text_farm.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isFarmer = true;

  final TextEditingController nameController = TextEditingController(
    text: kDebugMode ? "SAEE" : "",
  );
  final TextEditingController emailController = TextEditingController(
    text: kDebugMode ? "saee@mail.com" : "",
  );
  final TextEditingController phoneController = TextEditingController(
    text: kDebugMode ? "0921234567" : "",
  );
  final TextEditingController addressController = TextEditingController(
    text: kDebugMode ? "Benghazi" : "",);
  final TextEditingController passwordController = TextEditingController(
    text: kDebugMode ? "12345678" : "",);
  final TextEditingController businessNameController = TextEditingController(
    text: kDebugMode ? "Orgname" : "",);

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    passwordController.dispose();
    businessNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = Provider.of<RegisterProvider>(context);

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

              // اختيار نوع المستخدم
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
                            "Customer",
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

              CustomFormField(
                controller: nameController,
                hintText: 'Full Name',
                suffixIcon: Icons.person,
              ),
              const VerticalSpace(2),
              CustomFormField(
                controller: emailController,
                hintText: 'Email',
                suffixIcon: Icons.email,
              ),
              const VerticalSpace(2),
              CustomFormField(
                controller: phoneController,
                hintText: 'Phone Number',
                suffixIcon: Icons.phone,
              ),
              const VerticalSpace(2),
              if (isFarmer) ...[
                CustomFormField(
                  controller: businessNameController,
                  hintText: 'Farm Name',
                  suffixIcon: Icons.agriculture,
                ),
                const VerticalSpace(2),
                CustomFormField(
                  controller: addressController,
                  hintText: 'Farm Location',
                  suffixIcon: Icons.location_on,
                ),
              ] else ...[
                CustomFormField(
                  controller: addressController,
                  hintText: 'Your Address',
                  suffixIcon: Icons.location_city,
                ),
              ],

              const VerticalSpace(2),
              CustomFormField(
                controller: passwordController,
                hintText: 'Password',
                suffixIcon: Icons.lock,
                isPassword: true,
              ),

              const VerticalSpace(5),

              CustomGeneralButtom(
                text: regProvider.isLoading ? 'Processing...' : 'Register',
                onTap: () async {
                  // إصلاح الشروط بإضافة ||
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      nameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please fill all required fields"),
                      ),
                    );
                    return;
                  }

                  List result; // استقبال النتيجة كـ List من الـ Provider

                  if (isFarmer) {
                    result = await regProvider.registerFarmer({
                      'name': nameController.text.trim(),
                      'email': emailController.text.trim(),
                      'password': passwordController.text,
                      'phone': phoneController.text,
                      'address': addressController.text,
                      'business_name': businessNameController.text,
                      'has_delivery': "1", // تحويل القيمة لنص لتجنب أخطاء النوع
                    });
                  } else {
                    result = await regProvider.registerCustomer({
                      'name': nameController.text.trim(),
                      'email': emailController.text.trim(),
                      'password': passwordController.text.toString(),
                      'phone': phoneController.text.toString(),
                      'address': addressController.text,
                    });
                  }

                  // معالجة النتيجة بناءً على أول عنصر في القائمة (true/false)
                  if (result[0] == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(result[1]),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pop(context); // العودة لصفحة الـ Login
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(result[1]),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              ),

              const VerticalSpace(2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(color: Color(0xff78787c)),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: kMainColor,
                        fontWeight: FontWeight.bold,
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
