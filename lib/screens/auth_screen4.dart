Scaffold(
        appBar: null,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Flexible( child:
                AutoText(
                    params: Params()
                      ..text = "SIGN IN"
                      ..textHeight = 29.0
                      ..textWidth = 95.0
                      ..textColor = ColorRes.titleTextColor
                      ..letterSpacing = 2.36
                      ..fontWeight = FontWeight.w500
                      ..marginTop = 56.0),
                ),//flexible
                Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: AuthCard(),
                  ),
              ],
            ),
          ),
        ));