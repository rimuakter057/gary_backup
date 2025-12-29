import 'package:flutter/material.dart';



//
// | Opacity % | Decimal | Hex | Flutter Hex |
// | --------- | ------- | --- | ----------- |
// | 0%        | 0       | 00  | 0x00FFFFFF  |
// | 5%        | 13      | 0D  | 0x0DFFFFFF  |
// | 10%       | 26      | 1A  | 0x1AFFFFFF  |
// | 15%       | 38      | 26  | 0x26FFFFFF  |
// | 20%       | 51      | 33  | 0x33FFFFFF  |
// | 25%       | 64      | 40  | 0x40FFFFFF  |
// | 30%       | 77      | 4D  | 0x4DFFFFFF  |
// | 35%       | 89      | 59  | 0x59FFFFFF  |
// | 40%       | 102     | 66  | 0x66FFFFFF  |
// | 45%       | 115     | 73  | 0x73FFFFFF  |
// | 50%       | 128     | 80  | 0x80FFFFFF  |
// | 55%       | 140     | 8C  | 0x8CFFFFFF  |
// | 60%       | 153     | 99  | 0x99FFFFFF  |
// | 65%       | 166     | A6  | 0xA6FFFFFF  |
// | 70%       | 179     | B3  | 0xB3FFFFFF  |
// | 75%       | 191     | BF  | 0xBFFFFFFF  |
// | 80%       | 204     | CC  | 0xCCFFFFFF  |
// | 85%       | 217     | D9  | 0xD9FFFFFF  |
// | 90%       | 230     | E6  | 0xE6FFFFFF  |
// | 95%       | 242     | F2  | 0xF2FFFFFF  |
// | 100%      | 255     | FF  | 0xFFFFFFFF  |


class AppColors {
  static const Color primary = Color(0xff00897B);
  static const Color grey=Color(0xFFCDD3D9);
  static const Color dotedGrey=Color(0x33FFFFFF);
  static const Color yellowOnBoardingText=Color(0xFFFFC009);
  static const Color yellowShade=Color(0xFFFFECB3);
  static const Color brown=Color(0xFF9B7300);
 static const Color textBlack=Color(0xFF0B0F20);
  static const Color boarderTextField=Color(0xffC8C8C8);
  static const Color fillTextField=Color(0xffFFFFFF);
  static const Color hintText=Color(0xff7E8A93);
  static const Color labelTextColor=Color(0xFF4E5D66);
 static const Color subTitle=Color(0xFF2C3440);
  static const Color green = Color(0xff44A047);
  static const Gradient onBoardingGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0x000B0E20), // #0B0E2000 (transparent)
      Color(0xFF0B0E20), // #0B0E20





    ],
  );
  static const backgroundColor = Color(0xffF7F8FA);
  static const dividerColor=Color(0xFFE6EAED);















  static const Color shedOfPrimary = Color(0xff6C75A1);
  static const Color subPrimary = Color(0xff4E5D66); //#C7D2FE
  static const Color naveUnselected = Color(0xff6F6F6F);
  static const Color indigoColor = Color(0xffC7D2FE);

  static const Color naveBordar = Color(0xffEEF2FF);

  static const Color naveWhite = Color(0xffFAFAFF); //#FAFAFF99//#FAFAFF99
  static const Color black = Color(0xff000000);
  static const Color appTitle = Color(0xff2C3A54);
  static const Color black_02 = Color(0xff181818);
  static const Color white = Color(0xffFFFFFF);
  static const Color white_50 = Color(0xffFFFFFF);
  static const Color softWhite = Color(0xff808080);
  static const Color statusPending = Color(0xff30B0C7);
  static const Color statusShipping = Color(0xff34C759);
  static const Color statusDelivered = Color(0xff2A56B4);
  static const Color fillColor = Color(0xffDDE3FA);
  static const Color softGreen = Color(0xffF0FDF4);


  static const Color red = Color(0xffFF0000);
   static const Color red100=Color(0xFFFEE2E2);
  static const Color red500=Color(0xFFEF4444);


  ///reward==========================

  //bg color--------------------------------------------------

  static const starterBg = Color(0xffFEF2F2);
  static const consistencyBg = Color(0xffFFF7ED);
  static const monsterBg = Color(0xffFEFCE8);
  static const focusBg = Color(0xffF7FEE7);
  static const victoryBg = Color(0xffECFDF5);
  static const milestoneBg = Color(0xffECFEFF);
  static const positiveBg= Color(0xffEFF6FF);
  static const ccBg = Color(0xffFAF5FF);



//boarder color--------------------------------------------------
  static const starterBoarder = Color(0xffEF4444);
  static const consistencyBoarder = Color(0xffF97316);
  static const monsterBoarder = Color(0xffFACC15);
  static const focusBoarder = Color(0xff84CC16);
  static const victoryBoarder = Color(0xff10B981);
  static const milestoneBoarder = Color(0xff06B6D4);
  static const positiveBoarder = Color(0xff3B82F6);
  static const ccBoarder = Color(0xffA855F7);


}
