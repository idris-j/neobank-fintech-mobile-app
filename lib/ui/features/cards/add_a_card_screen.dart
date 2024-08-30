import 'package:flutter/material.dart';
import 'package:jeemo_pay/shared/colors.dart'; // Importing custom colors
import 'package:jeemo_pay/shared/sizeConfig.dart'; // Importing size configuration
import 'package:jeemo_pay/shared/text_style.dart'; // Importing custom text styles

class AddCardScreen extends StatefulWidget {
  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _cardNumber;
  String? _expiryDate;
  String? _cvv;
  String _cardType = "Physical";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appPrimaryColor, // Use a custom primary color
        title: Text("Add a New Card",
            style: txStyle16.copyWith(color: Colors.white)),
        elevation: 0, // Remove shadow for a cleaner look
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                _buildTextFormField(
                  label: "Card Number",
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 16) {
                      return "Please enter a valid card number";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _cardNumber = value;
                  },
                ),
                SizedBox(height: 16),
                _buildTextFormField(
                  label: "Expiry Date (MM/YY)",
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 5) {
                      return "Please enter a valid expiry date";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _expiryDate = value;
                  },
                ),
                SizedBox(height: 16),
                _buildTextFormField(
                  label: "CVV",
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 3) {
                      return "Please enter a valid CVV";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _cvv = value;
                  },
                ),
                SizedBox(height: 16),
                _buildDropdownField(),
                SizedBox(height: 20),
                _buildElevatedButton(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    required TextInputType keyboardType,
    required FormFieldValidator<String> validator,
    required FormFieldSetter<String> onSaved,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        labelStyle: txStyle14,
      ),
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
    );
  }

  Widget _buildDropdownField() {
    return DropdownButtonFormField<String>(
      value: _cardType,
      decoration: InputDecoration(
        labelText: "Card Type",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        labelStyle: txStyle14,
      ),
      items: ["Physical", "Virtual"].map((type) {
        return DropdownMenuItem(
          value: type,
          child: Text(type, style: txStyle14),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _cardType = value!;
        });
      },
    );
  }

  Widget _buildElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();

          Navigator.pop(context, {
            "cardNumber": _cardNumber,
            "expiryDate": _expiryDate,
            "cvv": _cvv,
            "cardType": _cardType,
          });
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: appPrimaryColor, // Custom primary color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      child: Text("Add Card", style: txStyle16.copyWith(color: Colors.white)),
    );
  }
}
