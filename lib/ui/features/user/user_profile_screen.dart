import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// Dummy data for demonstration
class UserProfile {
  final String profilePictureUrl;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String accountNumber;
  final double balance;

  UserProfile({
    required this.profilePictureUrl,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.accountNumber,
    required this.balance,
  });
}

class UserProfileProvider with ChangeNotifier {
  UserProfile _userProfile = UserProfile(
    profilePictureUrl: 'https://example.com/profile.jpg',
    fullName: 'John Doe',
    email: 'john.doe@example.com',
    phoneNumber: '+1234567890',
    accountNumber: '1234567890',
    balance: 1500.75,
  );

  UserProfile get userProfile => _userProfile;

  void updateProfile(UserProfile userProfile) {
    _userProfile = userProfile;
    notifyListeners();
  }
}

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProfile = Provider.of<UserProfileProvider>(context).userProfile;

    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings
              Get.to(() => SettingsScreen());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Picture and Basic Info
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage(userProfile.profilePictureUrl),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userProfile.fullName,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          userProfile.email,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          userProfile.phoneNumber,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Account Information
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account Number',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(userProfile.accountNumber),
                      SizedBox(height: 16),
                      Text(
                        'Balance',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '\$${userProfile.balance.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Actions
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: SvgPicture.asset('assets/icons/transaction.svg'),
                      title: Text('Transaction History'),
                      onTap: () {
                        // Navigate to transaction history
                        Get.to(() => TransactionHistoryScreen());
                      },
                    ),
                    ListTile(
                      leading: SvgPicture.asset('assets/icons/card.svg'),
                      title: Text('Cards'),
                      onTap: () {
                        // Navigate to cards screen
                        Get.to(() => CardsScreen());
                      },
                    ),
                    ListTile(
                      leading: SvgPicture.asset('assets/icons/security.svg'),
                      title: Text('Security Settings'),
                      onTap: () {
                        // Navigate to security settings
                        Get.to(() => SecuritySettingsScreen());
                      },
                    ),
                    ListTile(
                      leading: SvgPicture.asset('assets/icons/help.svg'),
                      title: Text('Help & Support'),
                      onTap: () {
                        // Navigate to help and support
                        Get.to(() => HelpSupportScreen());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Example screens for navigation
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(child: Text('Settings Screen')),
    );
  }
}

class TransactionHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transaction History')),
      body: Center(child: Text('Transaction History Screen')),
    );
  }
}

class CardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards')),
      body: Center(child: Text('Cards Screen')),
    );
  }
}

class SecuritySettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Security Settings')),
      body: Center(child: Text('Security Settings Screen')),
    );
  }
}

class HelpSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help & Support')),
      body: Center(child: Text('Help & Support Screen')),
    );
  }
}
