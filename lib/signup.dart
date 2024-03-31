import 'package:flutter/material.dart';
import 'UserDetailPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, left: 20, right: 20), // Adjusted top padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5), // Adjusted height
                  Text(
                    'Create an account to get started',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Adjusted height
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(
                    text: 'Sign up with Google',
                    icon: FontAwesomeIcons.google,
                    onPressed: () {},
                  ),
                  SizedBox(height: 10), // Adjusted height
                  _buildSocialButton(
                    text: 'Sign up with Facebook',
                    icon: FontAwesomeIcons.facebookF,
                    onPressed: () {},
                  ),
                  SizedBox(height: 20), // Adjusted height
                  DividerWithText(text: 'or'),
                  SizedBox(height: 20), // Adjusted height
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserDetailPage()),
                      );
                    },
                    child: _buildButton(
                      text: 'Sign up with Phone Number',
                      icon: Icons.phone,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required IconData icon,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20), // Adjusted padding
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey,
              height: 1.1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
