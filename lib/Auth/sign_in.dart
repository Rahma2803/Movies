import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/utitities/app_assets.dart';
import 'package:movies/utitities/app_colors.dart';
import 'package:movies/utitities/app_routes.dart';
import 'package:movies/utitities/app_styles.dart';
import 'package:movies/utitities/conext_extentions.dart';
import 'package:movies/widgets/custom_text_field.dart';
import 'package:movies/widgets/custome_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: context.h*0.04, horizontal: context.w*0.08),
        child: Column(
          children: [
            Image.asset(AppAssets.logo),
            Form(
              key: formKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: context.h*0.03,
              children: [
                CustomTextField(
                  controller: emailController,
                  text: "Email",
                  keyBoardType: TextInputType.emailAddress,
                  prefix: Icon(Icons.mail_outline_rounded, size: 24, color: AppColors.white,),
                  onValidtator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter email';
                    }
                    final bool emailValid = RegExp(  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
                    ).hasMatch(emailController.text);
                    if (!emailValid) {
                      return 'please enter valid email';  
                    }
                    return null;
                  },
                  ),
                  CustomTextField(
                    obsecureText: isPasswordHidden,
                    keyBoardType: TextInputType.number,
                    controller: passwordController,
                    text: "Password",
                    prefix: Icon(Icons.lock_outline_rounded, size: 24, color: AppColors.white,),
                    suffix: IconButton(icon: Icon(isPasswordHidden ?  Icons.visibility_off : Icons.visibility, size: 24, color: AppColors.white,),onPressed: () {
                        isPasswordHidden = !isPasswordHidden;
                        setState(() {
                          
                        });
                    },),
                    onValidtator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter password';
                        }
                        if (text.length < 6) {
                          return 'password should be at least 6 char';
                        }
                        return null;
                    },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(AppRoutes.forgotPasswordRouteName);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.yellow,
                                textStyle: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              child: Text("Forgot Password ?"),
                      ),
                    ),
                    CustomeButton(
                          text: "LogIn",
                          isMax: true,
                          borderColor: AppColors.transparent,
                          textStyle: AppStyles.robotoRegular20,
                          backgroundColor: AppColors.yellow,
                          onPressed:(){
                           //logIn();
                           Navigator.of(context).pushNamed(AppRoutes.homeRouteName);
                          },
                          foregroundColor: AppColors.black
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don’t have an account ?",style: AppStyles.robotoRegular14White,),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(AppRoutes.signUpRouteName);
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.yellow,
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: Text("Create One"),
                          ),
                        ],
                      ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 2,
                          width: context.w*0.1,
                          color: AppColors.yellow
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.w*0.02),
                        child: Text(
                          "OR",
                          style: AppStyles.robotoRegular14Yellow
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 2,
                          color: AppColors.yellow
                        ),
                      ),
                    ],
                  ),
                  CustomeButton(
                          text: "LogIn With Google",
                          isMax: true,
                           leftIcon: Image.asset(
                            AppAssets.google
                          ),
                          borderColor: AppColors.transparent,
                          textStyle: AppStyles.robotoRegular20,
                          backgroundColor: AppColors.yellow,
                          onPressed:(){
                           //logInWithGoogle();
                           Navigator.of(context).pushNamed(AppRoutes.homeRouteName);
                          },
                          foregroundColor: AppColors.black
                  ),
                ] 
              )
            )
          ],
        )
      )
    );
  }
}