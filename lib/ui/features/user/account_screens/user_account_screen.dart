import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeemo_pay/ui/features/user/account_screens/sub_options_screen.dart';
import 'package:jeemo_pay/ui/widget/custom_header_app_logo_widget.dart'; // Import your custom header widget

class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: CustomHeaderAppLogoWidget(headerText: 'User Account'),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              SizedBox(height: 120), // Placeholder to push content down
              _buildSection(context, options: [
                _buildOption(
                  context,
                  'Account Information',
                  'Information about your account',
                  'account_information',
                  Icons.person_outline,
                ),
                _buildOption(
                  context,
                  'Help and Support',
                  'Need help? We\'ve got you.',
                  'help_and_support',
                  Icons.call_end_outlined,
                ),
                _buildOption(
                  context,
                  'Login and Security',
                  'Keep your account safe',
                  'login_and_security',
                  Icons.shield_outlined,
                ),
                _buildOption(
                  context,
                  'Manage Connected Accounts',
                  'External accounts connected',
                  'manage_connected_accounts',
                  Icons.settings_outlined,
                ),
                _buildOption(
                  context,
                  'About Jeemo.io',
                  'All you need to know about your financial buddy',
                  'about_jeemo',
                  Icons.info_outline,
                ),
                _buildOption(
                  context,
                  'Log out',
                  '',
                  'logout',
                  Icons.exit_to_app,
                  Colors.red,
                ), // Log out option with red color
              ]),
            ],
          ),
          Positioned(
            top: 20, // Adjust top position as needed
            left: MediaQuery.of(context).size.width / 2 -
                50, // Center horizontally
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 4.0),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 45.0,
                    backgroundImage:
                        AssetImage('assets/images/default_profile.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Implement image change functionality
                        print('Change profile picture tapped');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: const Icon(Icons.camera_alt,
                            color: Colors.white, size: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, {required List<Widget> options}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Column(children: options),
        ],
      ),
    );
  }

  Widget _buildOption(BuildContext context, String title,
      [String? subtitle, String? screenId, IconData? icon, Color? color]) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              List<Map<String, dynamic>> options;
              switch (screenId) {
                case 'account_information':
                  options = [
                    {'title': 'Profile', 'icon': Icons.person_outline},
                    {'title': 'Account Info', 'icon': Icons.info_outline},
                    {
                      'title': 'Account Statement',
                      'icon': Icons.request_quote_outlined
                    },
                  ];
                  break;
                case 'help_and_support':
                  options = [
                    {'title': 'Help Center', 'icon': Icons.help_outline},
                    {'title': 'Contact Support', 'icon': Icons.mail_outline},
                    {'title': 'Share us on social media', 'icon': Icons.share},
                  ];
                  break;
                case 'login_and_security':
                  options = [
                    {
                      'title': 'Reset Password',
                      'icon': Icons.lock_reset_outlined
                    },
                    {'title': 'Transaction PIN', 'icon': Icons.lock_outline},
                    {
                      'title': 'Enable/Disable Biometrics Login',
                      'icon': Icons.fingerprint_outlined
                    },
                    {
                      'title': 'Reset Security Questions',
                      'icon': Icons.security_outlined
                    },
                    {
                      'title': 'Hide Balance',
                      'icon': Icons.visibility_off_outlined
                    },
                  ];
                  break;
                case 'manage_connected_accounts':
                  options = [
                    {
                      'title': 'Manage Linked Accounts',
                      'icon': Icons.link_outlined
                    },
                    {
                      'title': 'Manage Payment Methods',
                      'icon': Icons.payment_outlined
                    },
                    {
                      'title': 'Connected Services',
                      'icon': Icons.sync_outlined
                    },
                  ];
                  break;
                case 'about_jeemo':
                  options = [
                    {'title': 'Legal', 'icon': Icons.gavel_outlined},
                    {'title': 'Social', 'icon': Icons.people_outline},
                    {'title': 'Visit our Blog', 'icon': Icons.article_outlined},
                    {'title': 'App Rating', 'icon': Icons.star_outline},
                    {
                      'title': 'Contact Us',
                      'icon': Icons.contact_mail_outlined
                    },
                  ];
                  break;
                default:
                  options = [];
              }
              return SubOptionsScreen(title: title, options: options);
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (icon != null) ...[
                  Container(
                    padding: const EdgeInsets.all(8.0), // Background circle
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200], // Background color
                    ),
                    child: Icon(icon,
                        size: 20,
                        color: _getRandomColor()), // Reduced icon size
                  ),
                  const SizedBox(width: 16),
                ],
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: color ?? Colors.black),
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: GoogleFonts.roboto(
                          textStyle:
                              TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Color _getRandomColor() {
    final List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
    ];
    final random = Random();
    return colors[random.nextInt(colors.length)];
  }
}
