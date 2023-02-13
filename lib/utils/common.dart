import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import 'colors.dart';

//region App Default Settings
void defaultSettings() {
  passwordLengthGlobal = 6;
  appButtonBackgroundColorGlobal = primaryColor;
  defaultRadius = 12;
  defaultAppButtonTextColorGlobal = Colors.white;
  defaultElevation = 0;
  defaultBlurRadius = 0;
  defaultSpreadRadius = 0;
  defaultAppButtonRadius = defaultRadius;
  defaultAppButtonElevation = 0;
}
//endregion

//region Set User Values when user is logged In

Decoration cardDecoration(BuildContext context,
    {Color? color, bool showBorder = true}) {
  return boxDecorationWithRoundedCorners(
    borderRadius: radius(),
    backgroundColor: color ?? context.scaffoldBackgroundColor,
    border:
        showBorder ? Border.all(color: context.dividerColor, width: 1.0) : null,
  );
}

Decoration categoryDecoration(BuildContext context,
    {Color? color, bool showBorder = true}) {
  return boxDecorationWithRoundedCorners(
    borderRadius: radius(),
    backgroundColor: color ?? context.cardColor,
    border:
        showBorder ? Border.all(color: context.dividerColor, width: 1.0) : null,
  );
}

BorderRadius curvedContainerBorderRadius =
    BorderRadius.only(bottomLeft: Radius.circular(80.r));

List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(
      id: 1,
      name: 'Spanish',
      languageCode: 'es',
      fullLanguageCode: 'es-ES',
    ),
    LanguageDataModel(
      id: 1,
      name: 'English',
      languageCode: 'en',
      fullLanguageCode: 'en-US',
    ),
  ];
}

TextStyle defaultTextFieldStyle = TextStyle(
    fontWeight: FontWeight.w500, fontSize: 16.sp, fontStyle: FontStyle.italic);

TextStyle defaultHintTextFieldStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 16.sp,
  color: Colors.black.withOpacity(0.32),
);
// Future<void> commonLaunchUrl(String address,
//     {LaunchMode launchMode = LaunchMode.inAppWebView}) async {
//   await launchUrl(Uri.parse(address), mode: launchMode).catchError((e) {
//     toast('Invalid URL: $address');
//   });
// }

// void launchCall(String? url) {
//   if (url.validate().isNotEmpty) {
//     if (isIOS) {
//       commonLaunchUrl('tel://${url!}',
//           launchMode: LaunchMode.externalApplication);
//     } else {
//       commonLaunchUrl('tel:${url!}',
//           launchMode: LaunchMode.externalApplication);
//     }
//   }
// }

// void launchMail(String? url) {
//   if (url.validate().isNotEmpty) {
//     commonLaunchUrl('mailto:${url!}',
//         launchMode: LaunchMode.externalApplication);
//   }
// }

// void launchMap(String? url) {
//   if (url.validate().isNotEmpty) {
//     commonLaunchUrl(GOOGLE_MAP_PREFIX + url!,
//         launchMode: LaunchMode.externalApplication);
//   }
// }
  
 
// Future<List<File>> getMultipleImageSource({bool isCamera = true}) async {
//   final pickedImage = await ImagePicker().pickMultiImage();
//   return pickedImage.map((e) => File(e.path)).toList();
// }

// Future<File> getCameraImage({bool isCamera = true}) async {
//   final pickedImage = await ImagePicker()
//       .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
//   return File(pickedImage!.path);
// }
