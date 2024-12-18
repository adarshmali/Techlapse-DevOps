import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen dimensions
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // First background bubble
          Positioned(
            top: height * -0.3,
            left: width * 0.6,
            child: Transform.rotate(
              angle: -92 * 3.14159 / 180,
              child: Container(
                width: width * 1.1,
                height: height * 0.55,
                decoration: const BoxDecoration(
                  color: Color(0xFF004BFE),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          // Second background bubble
          Positioned(
            top: height * -0.04,
            right: width * 0.4,
            child: Transform.rotate(
              angle: 110 * 3.14159 / 180,
              child: Container(
                width: width * 1.30,
                height: height * 0.40,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9E4FF),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          // Profile image
          Positioned(
            top: height * 0.2,
            child: Container(
              width: width * 0.25,
              height: width * 0.25,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/artist-2_1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // "Setup New Password" text
          Positioned(
            top: height * 0.34,
            child: Text(
              'Setup New Password',
              style: GoogleFonts.raleway(
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF202020),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Instruction text
          Positioned(
            top: height * 0.38,
            child: Text(
              'Please, setup a new password for \n your account',
              style: GoogleFonts.nunitoSans(
                fontSize: width * 0.05,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // New Password button
          Positioned(
            top: height * 0.48,
            child: GestureDetector(
              onTap: () {
                // Handle new password tap
              },
              child: Container(
                width: width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Center(
                  child: Text(
                    'New Password',
                    style: GoogleFonts.raleway(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 147, 144, 144),
                      letterSpacing: -0.17,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Repeat Password button
          Positioned(
            top: height * 0.56,
            child: GestureDetector(
              onTap: () {
                // Handle repeat password tap
              },
              child: Container(
                width: width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Center(
                  child: Text(
                    'Repeat Password',
                    style: GoogleFonts.raleway(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 147, 144, 144),
                      letterSpacing: -0.17,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Next button
          Positioned(
            top: height * 0.75,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/password_recovery'); // Navigate to the Password Recovery screen
              },
              child: Container(
                width: width * 0.9,
                height: height * 0.08,
                decoration: BoxDecoration(
                  color: const Color(0xFF004CFF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    'Next',
                    style: GoogleFonts.nunitoSans(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Cancel text
          Positioned(
            top: height * 0.88,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Return to the previous page
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.nunitoSans(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xFF202020),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
