import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_and_morty/config/colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.body,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.showAppbar = true,
    this.appBar,
    this.onTap,
  });

  final Widget? body;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final bool showAppbar;
  final PreferredSizeWidget? appBar;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [backgroundPrimary, backgroundSecondary],
          )),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          //onTap: onTap ?? () => hideKeyboard(context),
          onTap: onTap ??
              () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
          child: Scaffold(
            appBar: showAppbar ? appBar : null,
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            bottomNavigationBar: bottomNavigationBar,
            body: body,
          ),
        )
      ],
    );
  }
}
