import 'package:flutter/material.dart';
import 'package:movies/tabs/profile/pick_avatar_widget.dart';
import 'package:movies/utitities/app_assets.dart';
import 'package:movies/utitities/app_colors.dart';
import 'package:movies/utitities/app_styles.dart';
import 'package:movies/utitities/conext_extentions.dart';
import 'package:movies/utitities/validation.dart';
import 'package:movies/widgets/custom_app_bar.dart';
import 'package:movies/widgets/custom_text_field.dart';
import 'package:movies/widgets/custome_button.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: CustomAppBar(
          text: "Pick Avatar"
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 0.037*context.w , vertical: 0.036*context.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Column(
              spacing: 0.021*context.h,
              children: [
                InkWell(
                  onTap: ()
                  {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,

                        context: context,
                        builder: (context){
                          return PickAvatarWidget();
                        }
                        );
                  },
                  child:
                  SizedBox(
                    height: 0.160*context.h,
                    child:
                    Image.asset(AppAssets.boy2 , scale: 0.1,),
                  ),
                ),
                CustomTextField(
                  prefix: Icon(Icons.person ,color: AppColors.white,),
                  text: "John Safwat",


                ),
                Form(
                  key:_formKey,
                  child: CustomTextField(
                    controller: phoneController,
                    onValidtator: (value){
                     return Validation.phoneNumberValidator(value);
                    },
                    prefix: Icon(Icons.phone,color: AppColors.white,),
                    text: "01200000000",


                  ),
                ),
              ],
            ),
            Column(
              spacing: 0.021*context.h,
              children: [
                CustomeButton(
                    text: "Delete Account",
                    onPressed: (){

                    },
                    backgroundColor: AppColors.red,
                    foregroundColor: AppColors.grey,
                    borderColor: AppColors.red,
                    textStyle: AppStyles.interRegular20White,
                    isMax: true),
                CustomeButton(
                    text: "Update Data",
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {

                      }
                    },
                    backgroundColor: AppColors.yellow,
                    foregroundColor: AppColors.grey,
                    borderColor: AppColors.yellow,
                    textStyle: AppStyles.interRegular20Black,
                    isMax: true),
              ],
            )
          ],
        ),
      ),
    );
  }
}