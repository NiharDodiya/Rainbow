import 'package:flutter/material.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/font_res.dart';

/*TextStyle textStyleFont18White = const TextStyle(
  color: ColorRes.white,
  fontSize: 18,
  fontFamily: "Gilroy-ExtraBold",
  fontWeight: FontWeight.w700,
);*/
/*
TextStyle textStyleFont18Black = const TextStyle(
  color: ColorRes.black,
  fontSize: 18,
  fontFamily: "Gilroy-Medium",
  fontWeight: FontWeight.w600,
);
*/

/*TextStyle textStyleFont16Black = const TextStyle(
  color: ColorRes.black,
  fontSize: 16,
  fontFamily: "Gilroy-ExtraBold",
  fontWeight: FontWeight.w600,
);*/
/*TextStyle textStyleFont14Black = const TextStyle(
  color: ColorRes.black,
  fontSize: 14,
  fontFamily: "Gilroy-Medium",
  fontWeight: FontWeight.w500,
);*/
/*TextStyle textStyleFont16BlackLight = const TextStyle(
  color: ColorRes.color_313131,
  fontSize: 16,
  fontFamily: "Gilroy-ExtraBold",
  fontWeight: FontWeight.w600,
);*/
TextStyle textStyleFont16Whit = const TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontFamily: "Gilroy-Medium",
  fontWeight: FontWeight.w500,
);

TextStyle textStyleFont14WhiteBold = const TextStyle(
  color: ColorRes.white,
  fontSize: 14,
  fontFamily: "Gilroy-ExtraBold",
  fontWeight: FontWeight.w600,
);
TextStyle textStyleFont14White600 = const TextStyle(
  color: ColorRes.white,
  fontSize: 14,
  fontFamily: "Gilroy-Light",
  fontWeight: FontWeight.w600,
);
TextStyle textStyleFont14White = const TextStyle(
  color: ColorRes.white,
  fontSize: 14,
  fontFamily: "Gilroy-Medium",
  fontWeight: FontWeight.w500,
);
TextStyle textStyleFont12White = const TextStyle(
  color: ColorRes.white,
  fontSize: 12,
  fontFamily: "Gilroy-Light",
  fontWeight: FontWeight.w600,
);

/*TextStyle textStyleFont10White = const TextStyle(
  color: ColorRes.white,
  fontSize: 10,
  fontFamily: "Gilroy-Medium",
  fontWeight: FontWeight.w500,
);*/
TextStyle textStyleFont30WhiteBold = const TextStyle(
  color: ColorRes.white,
  fontSize: 30,
  fontFamily: "Gilroy-Light",
  fontWeight: FontWeight.w600,
);
TextStyle textStyleFont30WhiteExtraBold = const TextStyle(
  color: ColorRes.white,
  fontSize: 30,
  fontFamily: "Gilroy-Medium",
  fontWeight: FontWeight.w900,
);
TextStyle textFields = TextStyle(
  color: ColorRes.color_656F85..withOpacity(0.5),
  fontSize: 10,
  fontFamily: "Gilroy-Light",
  fontWeight: FontWeight.w500,
);

TextStyle textStyleFont14WhiteNormal = TextStyle(
  color: ColorRes.white.withOpacity(0.5),
  fontSize: 14,
  fontFamily: "Gilroy-Light",
  fontWeight: FontWeight.w600,
);
TextStyle textStyleFont14 = const TextStyle(
  color: ColorRes.color_4F359B,
  fontSize: 14,
  fontFamily: "Gilroy-Medium",
  fontWeight: FontWeight.w700,
);
TextStyle textStyleFont26WhiteBold = const TextStyle(
  color: ColorRes.white,
  fontSize: 26,
  fontFamily: "Gilroy-ExtraBold",
  fontWeight: FontWeight.w600,
);
TextStyle textStyleFont16WhitLight = const TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontFamily: "Gilroy-Medium",
  fontWeight: FontWeight.w600,
);
TextStyle textStyleFont16Alert = const TextStyle(
  color: ColorRes.color_656F85,
  fontSize: 16,
  fontFamily: "Gilroy-Medium",
  fontWeight: FontWeight.w500,
);
TextStyle textStyleFont14Alert = const TextStyle(
  color: ColorRes.color_656F85,
  fontSize: 14,
  fontFamily: "Gilroy-Medium",
  fontWeight: FontWeight.w500,
);
TextStyle textStyleFont16Grey = TextStyle(
  color: ColorRes.black2.withOpacity(0.5),
  fontSize: 14,
  fontFamily: "Gilroy-Medium",
  fontWeight: FontWeight.w500,
);
TextStyle textStyleFont14WhiteW500 = const TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontFamily: "Gilroy-Medium",
  fontWeight: FontWeight.w500,
);
TextStyle textFieldText = const TextStyle(
  color: ColorRes.color_313131,
  fontSize: 16,
  fontFamily: "Gilroy-Medium",
  fontWeight: FontWeight.w600,
);
TextStyle textStyleFont12 = const TextStyle(
  color: ColorRes.color_4F359B,
  fontSize: 12,
  fontFamily:  FontRes.gilroyBold,
  fontWeight: FontWeight.w600,
);
TextStyle textStyleFont16W700 = const TextStyle(
  color: ColorRes.color_69C200,
  fontSize: 16,
  fontFamily:  FontRes.gilroyBold,
  fontWeight: FontWeight.w700,
  decoration: TextDecoration.underline,
);
TextStyle textStyleFont20W700 = const TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontFamily: FontRes.gilroyBold,
  fontWeight: FontWeight.w700,
);
TextStyle textStyleFont18Grey = const TextStyle(
  color: ColorRes.color_B4B4B4,
  fontSize: 18,
  fontFamily: "Gilroy-Medium",
);
TextStyle textStyleFont14BlueW500 = const TextStyle(
  color: ColorRes.color_2F80ED,
  fontSize: 14,
  fontFamily: "Gilroy-Light",
  fontWeight: FontWeight.w600,
);




TextStyle textStyleFont12Gre97 = const TextStyle(
  color: ColorRes.color_979797,
  fontSize: 12,
  fontFamily: "Gilroy-Light",
  fontWeight: FontWeight.w400,
);
TextStyle textStyleFont12White400 = const TextStyle(
  color: ColorRes.white,
  fontSize: 12,
  fontFamily: "Gilroy-Medium",
  fontWeight: FontWeight.w400,
);

TextStyle textStyleFont15White= const TextStyle(
  color: ColorRes.white,
  fontSize: 15,
  fontFamily: "Gilroy-Medium",
  fontWeight: FontWeight.w500,
);

TextStyle gilroyBoldTextStyle({Color? color,double? fontSize,}){
  return TextStyle(
    color: color??ColorRes.white,
    fontWeight: FontWeight.bold,
    fontSize: fontSize??18,
    fontFamily: FontRes.gilroyBold,
  );
}

TextStyle gilroySemiBoldTextStyle({Color? color,double? fontSize,double? letterSpacing}){
  return TextStyle(
    color: color??ColorRes.white,
    fontWeight: FontWeight.w700,
    fontSize: fontSize??18,
    fontFamily: FontRes.gilroySemiBold,
    letterSpacing: letterSpacing?? 0
  );
}
TextStyle gilroyMediumTextStyle({Color? color,double? fontSize,double? letterSpacing}){
  return TextStyle(
    color: color??ColorRes.white,
    fontWeight: FontWeight.w500,
    fontSize: fontSize??18,
    fontFamily: FontRes.gilroyMedium,
    letterSpacing:letterSpacing?? 0 
  );
}
TextStyle gilroyRegularTextStyle({Color? color,double? fontSize,}){
  return TextStyle(
    color: color??ColorRes.white,
    fontWeight: FontWeight.w500,
    fontSize: fontSize??18,
    fontFamily: FontRes.gilroyRegular,
  );
}
TextStyle montserratRegularTextStyle({Color? color,double? fontSize,FontWeight? fontWeight,double? letterSpacing}){
  return TextStyle(
    color: color??ColorRes.white,
    fontWeight: FontWeight.w400,
    fontSize: fontSize??18,
    fontFamily: FontRes.montserratRegular,
    letterSpacing: letterSpacing?? 0
  );
}

TextStyle montserratMediumTextStyle({Color? color,double? fontSize,FontWeight? fontWeight}){
  return TextStyle(
    color: color??ColorRes.white,
    fontWeight: FontWeight.w600,
    fontSize: fontSize??18,
    letterSpacing: 4,
    fontFamily: FontRes.montserratRegular,
  );
}



TextStyle beVietnamProBoldTextStyle({Color? color,double? fontSize,}){
  return TextStyle(
    color: color??ColorRes.white,
    fontWeight: FontWeight.bold,
    fontSize: fontSize??18,
    fontFamily: FontRes.beVietnamProBold,
  );
}
TextStyle beVietnamProRegularTextStyle({Color? color,double? fontSize,}){
  return TextStyle(
    color: color??ColorRes.white,
    fontWeight: FontWeight.w500,
    fontSize: fontSize??14,
    fontFamily: FontRes.beVietnamProRegular,
  );
}

TextStyle textStylField16w500 = const TextStyle(
  color: ColorRes.color_49A510,
  fontSize: 16,
  fontFamily:FontRes.gilroyMedium,
  fontWeight: FontWeight.w500,
);
TextStyle textStylField16wyellow = const TextStyle(
  color: ColorRes.color_FFA800,
  fontSize: 16,
  fontFamily: FontRes.gilroyMedium,
  fontWeight: FontWeight.w500,
);

TextStyle beVietnamRegularTextStyle({Color? color,double? fontSize,}){
  return TextStyle(
    color: color??ColorRes.white,
    fontWeight: FontWeight.w500,
    fontSize: fontSize??18,
    fontFamily: FontRes.beVietnamProBold,
  );
}TextStyle beVietnamSemiBoldTextStyle({Color? color,double? fontSize}){
  return TextStyle(
    color: color??ColorRes.white,
    fontWeight: FontWeight.w600,
    fontSize: fontSize??18,
    fontFamily: FontRes.beVietnamProSemiBold,
  );
}
TextStyle sfProTextReguler({Color? color,double? fontSize}){
  return TextStyle(
    color: color??ColorRes.white,
    fontWeight: FontWeight.w400,
    fontSize: fontSize??18,
    fontFamily: FontRes.sFProText,
  );
}
TextStyle interTextReguler({Color? color,double? fontSize}){
  return TextStyle(
    color: color??ColorRes.white,
    fontWeight: FontWeight.w400,
    fontSize: fontSize??18,
    fontFamily: FontRes.inter,
  );
}
TextStyle interTextMedium({Color? color,double? fontSize}){
  return TextStyle(
    color: color??ColorRes.white,
    fontWeight: FontWeight.w700,
    fontSize: fontSize??18,
    fontFamily: FontRes.inter,
  );
}
