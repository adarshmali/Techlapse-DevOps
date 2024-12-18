import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppe/screens/ready_screen.dart';

// void main() 
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/ready_screen': (context) => const ReadyScreen(),
      },
    );
  }
}

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordRecoveryScreenState createState() =>
      _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  bool isSMSSelected = false;
  bool isEmailSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SizedBox(
              width: constraints.maxWidth * 0.99,
              height: constraints.maxHeight,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // First background bubble
                  Positioned(
                    top: constraints.maxHeight * -0.3,
                    left: constraints.maxWidth * 0.6,
                    child: Transform.rotate(
                      angle: -92 * 3.14159 / 180, // Convert degrees to radians
                      child: Container(
                        width: constraints.maxWidth * 1.1,
                        height: constraints.maxHeight * 0.55,
                        decoration: const BoxDecoration(
                          color: Color(0xFF004BFE),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  // Second background bubble
                  Positioned(
                    top: constraints.maxHeight * -0.15,
                    right: constraints.maxWidth * 0.7,
                    child: Transform.rotate(
                      angle: 110 * 3.14159 / 180, // Convert degrees to radians
                      child: Container(
                        width: constraints.maxWidth * 1.05,
                        height: constraints.maxHeight * 0.55,
                        decoration: const BoxDecoration(
                          color: Color(0xFFD9E4FF),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  // Profile image
                  Positioned(
                    top: constraints.maxHeight * 0.2,
                    child: Container(
                      width: constraints.maxWidth * 0.25,
                      height: constraints.maxWidth * 0.25,
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
                          'assets/artist-2_1.png', // Replace with your asset path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // "Password Recovery" text
                  Positioned(
                    top: constraints.maxHeight * 0.34,
                    child: Text(
                      'Password Recovery',
                      style: GoogleFonts.raleway(
                        fontSize: constraints.maxWidth * 0.06,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF202020),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Instruction text
                  Positioned(
                    top: constraints.maxHeight * 0.38,
                    child: Text(
                      'How you would like to restore \n your password?',
                      style: GoogleFonts.nunitoSans(
                        fontSize: constraints.maxWidth * 0.05,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // SMS button
                  Positioned(
                    top: constraints.maxHeight * 0.48,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isSMSSelected = true;
                          isEmailSelected = false; // Unselect Email when SMS is selected
                        });
                      },
                      child: Container(
                        width: constraints.maxWidth * 0.55,
                        height: constraints.maxHeight * 0.05,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE5EBFC),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SMS',
                              style: GoogleFonts.raleway(
                                fontSize: constraints.maxWidth * 0.04,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF004CFF),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              isSMSSelected
                                  ? Icons.check_circle
                                  : Icons.check_circle_outline,
                              color: const Color(0xFF004CFF),
                              size: 22,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Email button
                  Positioned(
                    top: constraints.maxHeight * 0.55,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isEmailSelected = true;
                          isSMSSelected = false; // Unselect SMS when Email is selected
                        });
                      },
                      child: Container(
                        width: constraints.maxWidth * 0.55,
                        height: constraints.maxHeight * 0.05,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFEBEB),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Email',
                              style: GoogleFonts.raleway(
                                fontSize: constraints.maxWidth * 0.04,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              isEmailSelected
                                  ? Icons.check_circle
                                  : Icons.check_circle_outline,
                              color: Colors.black,
                              size: 22,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                   // Next button
                  Positioned(
                    top: constraints.maxHeight * 0.75,
                    child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/ready_screen');
                    },
                      child: Container(
                        width: constraints.maxWidth * 0.9,
                        height: constraints.maxHeight * 0.08,
                        decoration: BoxDecoration(
                          color: const Color(0xFF004CFF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            'Next',
                            style: GoogleFonts.nunitoSans(
                              fontSize: constraints.maxWidth * 0.06,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}