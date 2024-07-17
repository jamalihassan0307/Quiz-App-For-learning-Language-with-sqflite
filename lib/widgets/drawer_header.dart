import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

drawerHeader(context) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    padding: const EdgeInsets.only(bottom: 20, top: 10),
    width: double.infinity,
    color: Color(0xFF5170FD),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [userImage(), userName(context), userEmail(context)],
    ),
  );
}



userEmail(context) {
  return Container(
      alignment: Alignment.center,
      child: Text(
        "abc@gmail.com",
        style: TextStyle(
            fontSize: setSize(context, 17),
            fontWeight: FontWeight.w500,
            color: Colors.white),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ));
}

userName(context) {
  return  Container(
          margin: const EdgeInsets.only(bottom: 5, top: 10),
          alignment: Alignment.center,
          child: Text(
            "User",
            style: TextStyle(
                fontSize: setSize(context, 20),
                fontWeight: FontWeight.bold,
                color: Colors.white),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ));
}
const String appLogo = "assets/logo.png";
userImage() {
  return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1.7)),
      margin: const EdgeInsets.only(top: 40, bottom: 10),
      child:  Image.asset(
              appLogo,
              height: 130,
              width: 150,
            )
         );
}

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 700;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1000;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 700 &&
        MediaQuery.of(context).size.width <= 1000;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return largeScreen;
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 700) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

double setSize(context, size) {
  if (MediaQuery.of(context).size.width <= 400) {
    return size * 0.8;
  } else if (MediaQuery.of(context).size.width >= 400 &&
      MediaQuery.of(context).size.width < 450) {
    return size * 0.94;
  } else if (MediaQuery.of(context).size.width >= 450) {
    return size * 1.0;
  } else {
    return size * 1.0;
  }
}

String getScreenHeight(context) {
  if (MediaQuery.of(context).size.height < 760) {
    return "small";
  } else if (MediaQuery.of(context).size.height >= 760 &&
      MediaQuery.of(context).size.height < 1010) {
    return "medium";
  } else if (MediaQuery.of(context).size.height >= 1010) {
    return "large";
  } else {
    return "large";
  }
}
