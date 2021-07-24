import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medbo/utils/app_dimen.dart';
import 'package:medbo/utils/appview_helper.dart';

class DrawerItem extends StatefulWidget {
  final String lebelName;
  final String assetsURL;
  final Function onTab;
  final bool isSelected;
  final IconData icon;

  const DrawerItem({
    Key key,
    this.icon,
    this.isSelected,
    this.onTab,
    this.assetsURL,
    this.lebelName,
  }) : super(key: key);

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTab,
      child: Container(
        padding: EdgeInsets.only(
          left: hDimen(10),
          right: hDimen(10),
          top: hDimen(20),
          bottom: hDimen(20),
        ),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.black26,
              width: 1,
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: widget.isSelected ? Colors.lightBlue[50] : Colors.white70,
            borderRadius: BorderRadius.circular(hDimen(10)),
          ),
          padding: EdgeInsets.only(
            left: hDimen(10),
          ),
          height: hDimen(50),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.icon != null
                    ? Icon(
                        widget.icon,
                        color: Color(0xFF1d507d),size: hDimen(25),
                      )
                    : widget.assetsURL != null
                        ? Image.asset(
                            widget.assetsURL,
                            height: hDimen(20),
                            width: hDimen(20),
                            fit: BoxFit.contain,
                          )
                        : Container(),
                hSpacing(hDimen(20)),
                Text(
                  widget.lebelName,
                  style: TextStyle(
                    fontSize: hDimen(15),
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1d507d),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
