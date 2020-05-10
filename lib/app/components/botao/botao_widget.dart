import 'package:flutter/material.dart';
import 'package:proj_planos/app/shared/classes/SizeConfig.dart';

class BotaoWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color cor;
  final Function click;
  final String text;
  final bool visivelText;
  final bool visivelIcon;
  final double sizeIcon;
  final IconData icon;

  const BotaoWidget(
      {Key key,
      this.width,
      this.height,
      this.cor,
      this.click,
      this.text,
      this.visivelIcon,
      this.icon,
      this.visivelText = true,
      this.sizeIcon = 2.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      padding: EdgeInsets.all(8),
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: InkWell(
        onTap: () {
          click();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: visivelText,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: SizeConfig.sizeHeight * 2.5, color: Colors.white),
              ),
            ),
            Visibility(
              visible: visivelIcon,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    width: SizeConfig.sizeHeight * 3,
                  ),
                  Icon(
                    icon,
                    size: SizeConfig.sizeHeight * sizeIcon,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
