import 'package:flutter/widgets.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';

RichText richText(BuildContext context,
    {List<InlineSpan>? children,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    int? maxLines,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextAlign textAlign = TextAlign.center}) {
  return RichText(
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      
      text: TextSpan(
          style: TextStyle(
              color: color ?? HomeStyle(context: context).primary,
              fontSize:
                  fontSize ?? HomeStyle(context: context).bodyLarge.fontSize,
              fontWeight: fontWeight),
          children: children));
}
