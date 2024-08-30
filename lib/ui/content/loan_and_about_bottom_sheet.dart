import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeemo_pay/shared/colors.dart';
import 'package:jeemo_pay/shared/sizeConfig.dart';
import 'package:jeemo_pay/ui/features/offers_screen/travel_loan_screen.dart'; // Assuming you have a SizeConfig class for responsive UI

// Custom color for the button background

void showAboutUsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.3,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Center(
                        child: Text(
                          'About Jeemo.io',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.heightOf(2)),
                      Text(
                        _aboutUsContent(),
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.heightOf(2)),
                SizedBox(
                  width: double.infinity, // Full width of the screen
                  height: 50, // Custom height
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: customColor, // Button text color
                    ),
                    onPressed: () {
                      // Define what happens when the button is pressed
                    },
                    child: Text(
                      'Get Started',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

void showLoanDetailsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.3,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Center(
                        child: Text(
                          'Travel Loan?',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.heightOf(2)),
                      Text(
                        _loanDetailsContent(),
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.heightOf(2)),
                SizedBox(
                  width: double.infinity, // Full width of the screen
                  height: 50, // Custom height
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: customColor, // Button text color
                    ),
                    onPressed: () {
                      // Define what happens when the button is pressed
                      Get.to(() => TravelLoanScreen());
                    },
                    child: Text(
                      'Get Started',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

String _aboutUsContent() {
  return '''
Jeemo.io is your gateway to a seamless digital banking experience. We are committed to empowering individuals and businesses by providing innovative financial solutions that are secure, accessible, and tailored to your needs.

Our mission is to revolutionize the way you manage your finances, offering everything from digital wallets to international money transfers with ease. At Jeemo.io, we believe in breaking down barriers and creating a financial ecosystem where everyone can thrive.

Founded by a team of finance and technology experts, Jeemo.io is built on the principles of trust, innovation, and customer-centricity. Our platform is designed to give you full control of your financial life, with tools and resources that make banking simpler and more efficient.

### Our Journey
Jeemo.io was founded in 2020 with a vision to bridge the gap between traditional banking and the fast-paced digital world. Our founders, with decades of experience in finance and technology, recognized the challenges faced by individuals and businesses in managing their finances efficiently. They set out to create a solution that would not only address these challenges but also anticipate the future needs of users.

Over the years, we have grown rapidly, expanding our services and reach across multiple countries. Our relentless focus on innovation and customer satisfaction has made Jeemo.io a trusted name in the digital banking space.

### What We Offer
- **Digital Wallets:** Manage your money effortlessly with our secure digital wallets. Send, receive, and store funds with just a few taps.
- **International Money Transfers:** Send money across borders quickly and at competitive rates. Our platform ensures that your transfers are safe and reach their destination on time.
- **Bill Payments:** Pay your bills directly from your Jeemo.io account. From utilities to subscriptions, manage all your payments in one place.
- **Savings and Investments:** Grow your wealth with our savings and investment products. We offer competitive interest rates and a variety of investment options to suit your financial goals.
- **Loans and Credit:** Access credit when you need it most. Whether it's a personal loan or business financing, Jeemo.io offers flexible loan options with transparent terms.

### Our Technology
At the core of Jeemo.io is a robust and secure technology platform. We use advanced encryption and security protocols to protect your data and transactions. Our app is designed to be user-friendly, ensuring that even those new to digital banking can navigate it with ease.

We are constantly updating our platform with new features and enhancements, based on feedback from our users and the latest trends in fintech. Our goal is to stay ahead of the curve, offering you the best possible digital banking experience.

### Customer-Centric Approach
Jeemo.io was built with you in mind. We understand that every customer has unique needs and challenges, which is why we offer personalized solutions and dedicated support. Our customer service team is available 24/7 to assist you with any queries or issues.

We also value your feedback and use it to improve our services. Your satisfaction is our top priority, and we are committed to making Jeemo.io the most reliable and user-friendly digital banking platform.

### Join Us on Our Journey
We invite you to join us on our journey to redefine banking for the modern world. Whether you're an individual looking for a better way to manage your money, or a business seeking innovative financial solutions, Jeemo.io is here to support you.

Thank you for choosing Jeemo.io as your trusted partner in finance. Together, we can achieve great things.

Welcome to Jeemo.io – where your financial success is our priority.
''';
}

String _loanDetailsContent() {
  return '''
Explore the World with Jeemo.io's Travel Loan Assistance
Are you dreaming of your next adventure? Whether it's a sun-soaked beach in the Caribbean, a cultural escape to Europe, or an exhilarating trek through the mountains, Jeemo.io is here to make it happen. With our flexible and convenient loan assistance, funding your travels has never been easier or more stress-free.

Tailored Loan Options Just for You
At Jeemo.io, we understand that every travel plan is unique, just like you. That's why our loan options are designed to be as flexible as your itinerary. Whether you're planning a short weekend getaway, a luxurious vacation, or a globe-trotting expedition, we offer loan amounts and repayment plans that fit your needs. With just a few clicks, you can secure the funds to turn your dream destination into a reality.

Simple, Fast, and Transparent Process
We believe that the journey to your dream vacation should be as smooth as the trip itself. That's why we've made our loan process simple, fast, and transparent. No more endless paperwork or waiting weeks for approval. With Jeemo.io, you can apply for a travel loan online, receive a quick decision, and have the money in your account in no time.

Our loan application process is designed with you in mind—easy to understand, quick to complete, and with no hidden fees. You’ll always know exactly what to expect, so you can focus on planning your trip instead of worrying about finances.

Competitive Interest Rates and Flexible Repayment Options
Traveling the world doesn’t have to break the bank. Jeemo.io offers competitive interest rates that ensure your loan remains affordable throughout your repayment period. We also provide flexible repayment options, allowing you to choose a plan that works best with your budget. Whether you prefer to pay off your loan quickly or spread your payments over time, we’ve got you covered.

Your Travel Companion Every Step of the Way
With Jeemo.io, you’re never alone on your journey. From the moment you apply for a loan until the day you make your final payment, we’re here to support you. Our customer service team is available 24/7 to assist you with any questions or concerns, ensuring that your experience is as smooth and enjoyable as possible.

Start Your Journey Today
Why wait? Your dream vacation is closer than you think. Start your journey today with Jeemo.io's travel loans, and explore the world without worries. With our support, you can travel now and pay later, enjoying every moment of your adventure with complete peace of mind.
''';
}
