import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubSubOptionsScreen extends StatelessWidget {
  final String subtitle;

  const SubSubOptionsScreen({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subtitle,
            style: GoogleFonts.roboto(fontWeight: FontWeight.w600)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _buildSubSubOption('Detail 1 of $subtitle'),
          _buildSubSubOption('Detail 2 of $subtitle'),
          _buildSubSubOption('Detail 3 of $subtitle'),
        ],
      ),
    );
  }

  Widget _buildSubSubOption(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1.0)),
      ),
      child: Text(
        title,
        style: GoogleFonts.roboto(
          textStyle: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
