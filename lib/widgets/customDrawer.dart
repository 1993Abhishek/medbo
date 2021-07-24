import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medbo/router.dart';
import 'package:medbo/utils/app_dimen.dart';
import 'package:medbo/utils/appview_helper.dart';
import 'package:medbo/widgets/drawerItem.dart';

class CustomDrawer extends StatefulWidget {
  final BuildContext parentContext;

  const CustomDrawer({
    Key key,
    this.parentContext,
  }) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isSelected1 = false,
      isSelected2 = false,
      isSelected3 = false,
      isSelected4 = false,
      isSelected5 = false,
      isSelected6 = false,
      isSelected7 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      color: Colors.white,
      height: double.infinity,
      width: hDimen(260),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(0),
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: hDimen(5),
                top: hDimen(70),
                bottom: hDimen(5)
              ),
              height: hDimen(150),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF1d507d),
                    Color(0xFF1c7595),
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(hDimen(50)),
                        child: Image.asset(
                          "assets/icons/HBCSyjQEcvLeHAd76pmUUv0bCJX3Z3w0OuAR9vJF.png",
                          // height: hDimen(80),
                          // width: hDimen(60),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    hSpacing(hDimen(10)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Abhishek Ghoshal",
                          style: TextStyle(
                            fontSize: hDimen(15),
                            color: Colors.white,
                          ),
                        ),
                        vSpacing(hDimen(5)),
                        Text(
                          "1993abhishekghoshal@gmail.com",
                          style: TextStyle(
                            fontSize: hDimen(10),
                            color: Colors.white70,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DrawerItem(
                  icon: Icons.home_filled,
                  assetsURL: "assets/icons/logo.png",
                  isSelected: isSelected1,
                  lebelName: "Home",
                  onTab: () {
                    print("Tap");
                    setState(() {
                      isSelected7 = false;
                      isSelected1 = true;
                      isSelected2 = false;
                      isSelected3 = false;
                      isSelected4 = false;
                      isSelected5 = false;
                      isSelected6 = false;
                    });
                  },
                ),
                DrawerItem(
                  lebelName: "Our Services",
                  isSelected: isSelected2,
                  onTab: () {
                    setState(() {
                      isSelected7 = false;
                      isSelected1 = false;
                      isSelected2 = true;
                      isSelected3 = false;
                      isSelected4 = false;
                      isSelected5 = false;
                      isSelected6 = false;
                    });
                  },
                ),
                DrawerItem(
                  lebelName: "Ambulance Service",
                  isSelected: isSelected3,
                  onTab: () {
                    setState(() {
                      isSelected7 = false;
                      isSelected1 = false;
                      isSelected2 = false;
                      isSelected3 = true;
                      isSelected4 = false;
                      isSelected5 = false;
                      isSelected6 = false;
                    });
                  },
                ),
                DrawerItem(
                  lebelName: "Blood Bank",
                  isSelected: isSelected4,
                  onTab: () {
                    setState(() {
                      isSelected7 = false;
                      isSelected1 = false;
                      isSelected2 = false;
                      isSelected3 = false;
                      isSelected4 = true;
                      isSelected5 = false;
                      isSelected6 = false;
                    });
                  },
                ),
                DrawerItem(
                  lebelName: "About Medbo",
                  isSelected: isSelected5,
                  icon: Icons.account_box_outlined,
                  onTab: () {
                    setState(() {
                      isSelected7 = false;
                      isSelected1 = false;
                      isSelected2 = false;
                      isSelected3 = false;
                      isSelected4 = false;
                      isSelected5 = true;
                      isSelected6 = false;
                    });
                  },
                ),
                DrawerItem(
                  lebelName: "Blogs",
                  isSelected: isSelected6,
                  icon: Icons.folder_shared_outlined,
                  onTab: () {
                    setState(() {
                      isSelected7 = false;
                      isSelected1 = false;
                      isSelected2 = false;
                      isSelected3 = false;
                      isSelected4 = false;
                      isSelected5 = false;
                      isSelected6 = true;
                    });
                  },
                ),
                DrawerItem(
                  isSelected: isSelected7,
                  lebelName: "Setting",
                  onTab: () {
                    setState(() {
                      isSelected7 = true;
                      isSelected1 = false;
                      isSelected2 = false;
                      isSelected3 = false;
                      isSelected4 = false;
                      isSelected5 = false;
                      isSelected6 = false;
                    });
                    Navigator.of(context).pushReplacementNamed(
                        MedboRouter.ROUTE_SETTINGS_SCREEN);
                  },
                ),
                vSpacing(hDimen(25)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
