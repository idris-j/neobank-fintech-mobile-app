import 'package:jeemo_pay/services/theme_provider.dart';
import 'package:jeemo_pay/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smartlogger/smartlogger.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final bool hasDrawer;
  final List<Widget>? actions;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const CustomAppBar({
    Key? key,
    this.title = "",
    this.leading,
    this.actions,
    this.hasDrawer = false,
    this.scaffoldKey,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    Log.d("${themeProvider.isdark}");
  }

  @override
  AppBar build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return AppBar(
      actions: widget.actions,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness:
            themeProvider.isdark ? Brightness.light : Brightness.dark,
        statusBarBrightness:
            themeProvider.isdark ? Brightness.dark : Brightness.light,
      ),
      leading: widget.hasDrawer
          ? IconButton(
              onPressed: () {
                print(widget.scaffoldKey!.currentState!.isDrawerOpen);
                widget.scaffoldKey!.currentState!.openDrawer();
              },
              icon: const Icon(Icons.menu))
          : widget.leading ??
              InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.arrow_back_ios_new_rounded,
                        size: 20, color: Theme.of(context).iconTheme.color),
                  )),
      title: Text(
        widget.title,
        style: Theme.of(context)
            .appBarTheme
            .titleTextStyle
            ?.copyWith(color: appPrimaryColor),
      ),
      elevation: 0,
    );
  }
}
