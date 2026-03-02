import 'package:flutter/material.dart';
import 'package:movies/utitities/app_assets.dart';
import 'package:movies/utitities/app_colors.dart';
import 'package:movies/utitities/app_routes.dart';
import 'package:movies/utitities/conext_extentions.dart';

import '../../utitities/avatar_data.dart';

class PickAvatarWidget extends StatefulWidget {
  const PickAvatarWidget({super.key});

  @override
  State<PickAvatarWidget> createState() => _PickAvatarWidgetState();
}

class _PickAvatarWidgetState extends State<PickAvatarWidget> {

 bool isPicked = false ;
 int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 0.017*context.h , horizontal: 0.039*context.w),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(30),
        ),
          padding: EdgeInsets.symmetric(vertical: 0.017*context.h , horizontal: 0.039*context.w),
        child: GridView.builder(
          itemCount: AvatarData.avatars.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3
            ),
            itemBuilder: (BuildContext context , int index){
              return InkWell(
                onTap: (){

                  setState(() {
                    selectedIndex = index;

                  });

                },
                child: Container(
                  margin: EdgeInsets.all(8),

                  // width: 0.251*context.w,
                  // height: 0.112*context.h,
                  decoration: BoxDecoration(
                    color:selectedIndex== index? AppColors.darkerYellow :Colors.transparent ,
                    border: BoxBorder.all( color: AppColors.yellow),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(AvatarData.avatars[index]),
                ),
              );
            }
        ),
      ),
    );
  }
}
