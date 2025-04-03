import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/custom_text_field.dart';
import 'package:ecommerce_app/core/widgets/primay_button_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController fullname;
  late TextEditingController username;
  late TextEditingController password;
  late TextEditingController confirmPassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    username = TextEditingController();
    password = TextEditingController();
    fullname = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightSpace(28),
                SizedBox(
                  width: 335.w,
                  child: Text(
                    "Create an account",
                    style: AppStyles.primaryHeadLinesStyle,
                  ),
                ),
                const HeightSpace(8),
                SizedBox(
                  width: 335.w,
                  child: Text(
                    "Let’s create your account.",
                    style: AppStyles.grey12MediumStyle,
                  ),
                ),
                const HeightSpace(32),
                Text("Full Name", style: AppStyles.black16w500Style),
                const HeightSpace(8),
                CustomTextField(
                  controller: fullname,
                  hintText: "Enter Your Full Name",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Full Name";
                    }
                    return null;
                  },
                ),
                const HeightSpace(16),
                Text("User Name", style: AppStyles.black16w500Style),
                const HeightSpace(8),
                CustomTextField(
                  controller: username,
                  hintText: "Enter Your User Name",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your User Name";
                    }
                    return null;
                  },
                ),
                const HeightSpace(16),
                Text("Password", style: AppStyles.black16w500Style),
                const HeightSpace(8),
                CustomTextField(
                  hintText: "Enter Your Password",
                  controller: password,
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: AppColors.greyColor,
                    size: 20.sp,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Password";
                    }
                    if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  },
                ),
                const HeightSpace(16),
                Text("Confirm Password", style: AppStyles.black16w500Style),
                const HeightSpace(8),
                CustomTextField(
                  hintText: "Enter Your Password",
                  controller: password,
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: AppColors.greyColor,
                    size: 20.sp,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Password";
                    }
                    if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  },
                ),
                const HeightSpace(55),
                PrimayButtonWidget(
                  buttonText: "Create Account",
                  onPress: () {
                    //    if (formKey.currentState!.validate()) {
                    //   GoRouter.of(context).pushNamed(AppRoutes.verifyOtpScreen);
                    //  }
                  },
                ),
                const Spacer(),
                Center(
                  child: InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Do you have account? ",
                        style: AppStyles.black16w500Style
                            .copyWith(color: AppColors.secondaryColor),
                        children: [
                          TextSpan(
                              text: "Login", style: AppStyles.black15BoldStyle)
                        ],
                      ),
                    ),
                  ),
                ),
                const HeightSpace(16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
