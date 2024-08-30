import 'package:flutter/material.dart';

class CustomBottomImageSheet extends StatelessWidget {
  final List<BottomSheetOption> options;

  CustomBottomImageSheet({required this.options});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: options.map((option) {
          return ListTile(
            // Directly assign the widget to the leading property
            leading: option.icon,
            title: Text(option.title),
            onTap: () {
              Navigator.pop(context);
              option.onTap();
            },
          );
        }).toList(),
      ),
    );
  }

  static void show(
    BuildContext context, {
    required List<BottomSheetOption> options,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return CustomBottomImageSheet(options: options);
      },
    );
  }
}

class BottomSheetOption {
  final Widget icon; // No change needed here
  final String title;
  final VoidCallback onTap;

  BottomSheetOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
