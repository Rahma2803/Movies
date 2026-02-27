import 'package:flutter/material.dart';
import 'package:movies/utitities/app_assets.dart';
import 'package:movies/utitities/app_colors.dart';
import 'package:movies/utitities/app_routes.dart';
import 'package:movies/utitities/app_styles.dart';
import 'package:movies/utitities/conext_extentions.dart';
import 'package:movies/widgets/custom_app_bar.dart';
import 'package:movies/widgets/custom_carrsoul.dart';
import 'package:movies/widgets/custom_text_field.dart';
import 'package:movies/widgets/custome_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    List<String> avatars = [
      AppAssets.boy1,AppAssets.boy2,AppAssets.boy3,AppAssets.boy4,AppAssets.boy1,
      AppAssets.girl1,AppAssets.girl2,AppAssets.girl3,AppAssets.girl4,
    ];
    var formKey = GlobalKey<FormState>();
    TextEditingController emailController=TextEditingController();
    TextEditingController nameController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    TextEditingController rePasswordController=TextEditingController();
    TextEditingController phoneController=TextEditingController();
    bool isPasswordHidden = true;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: CustomAppBar(text: "Register"),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: context.h*0.04, horizontal: context.w*0.08),
        width: double.infinity,
        child: Form(
          key: formKey,
          child: Column(
               spacing: context.h*0.02,
               children: [
                Expanded(
                  child: CustomCarousel(
                     items: avatars
                      .map((x) => Image.asset(x, fit: BoxFit.contain))
                      .toList(),
                  autoPlay: false,
                  onPressed: () {},
                  ),
                ),
                Text("Avatar",style: AppStyles.robotoRegular16White,),
                CustomTextField(
                  controller: nameController,
                  text: "Name",
                  keyBoardType: TextInputType.name,
                  prefix: Icon(Icons.person, size: 24, color: AppColors.white,),
                  onValidtator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter name';
                    }
                    return null;
                  },
                ),
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
                CustomTextField(
                text: "Confirm Password",
                obsecureText: true,
                keyBoardType: TextInputType.number,
                prefix: Icon(Icons.lock_outline_rounded, size: 24, color: AppColors.white),
                suffix: IconButton(icon: Icon(isPasswordHidden ?  Icons.visibility_off : Icons.visibility, size: 24, color: AppColors.white),onPressed: () {
                    isPasswordHidden = !isPasswordHidden;
                    setState(() {
                      
                    });
                },),
                controller: rePasswordController,
                 onValidtator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please confirm password';
                    }
                    if (passwordController.text!=text) {
                      return 'passwords are not matching';
                    }
                    return null;
                },
                ),
                CustomTextField(
                text: "Phone Number",
                obsecureText: true,
                keyBoardType: TextInputType.number,
                prefix: Icon(Icons.call, size: 24, color: AppColors.white),
                controller: phoneController,
                 onValidtator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter your number';
                    }
                    return null;
                },
                ),
                CustomeButton(
                          text: "Create an Account",
                          isMax: true,
                          borderColor: AppColors.transparent,
                          textStyle: AppStyles.robotoRegular20,
                          backgroundColor: AppColors.yellow,
                          onPressed:(){
                           //SignUp();
                           Navigator.of(context).pushNamed(AppRoutes.homeRouteName);
                          },
                          foregroundColor: AppColors.black
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account ?",style: AppStyles.robotoRegular14White,),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(AppRoutes.signInRouteName);
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.yellow,
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: Text("Sign In"),
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