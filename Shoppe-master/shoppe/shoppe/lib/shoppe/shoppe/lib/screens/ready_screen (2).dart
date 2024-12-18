import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(const ReadyScreen());
// }
class ReadyScreen extends StatelessWidget {
  const ReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Shoppe"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background bubble 1
            Positioned(
              top: screenHeight * 0.7,
              left: screenWidth * 0.9,
              child: Transform.rotate(
                angle: -108 * 3.14159 / 180,
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.9,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 46, 92, 231),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/bubble 02.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Background bubble 2
            Positioned(
              top: -screenHeight * 0.02,
              right: screenWidth * 0.6,
              child: Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.6,
                decoration: const BoxDecoration(
                  color: Color(0xFF004BFE),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/bubble 01.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Main container
            Positioned(
              top: screenHeight * 0.08,
              child: Container(
                width: screenWidth * 0.85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.18),
                      blurRadius: 37,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'assets/your_image_path.png',
                          width: screenWidth * 0.85,
                          height: screenHeight * 0.35,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      // Title
                      Text(
                        'Ready?',
                        style: GoogleFonts.raleway(
                          fontSize: screenWidth * 0.07,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.28,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      // Subtitle
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        style: GoogleFonts.nunitoSans(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      // Button with navigation
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile_screen'); // Navigate to the next screen
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF004BFE),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.15,
                            vertical: screenHeight * 0.02,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          "Let's Start",
                          style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Dots/Slides indicators
            Positioned(
              bottom: screenHeight * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDot(color: const Color(0xFFC7D6FB), screenWidth: screenWidth),
                  SizedBox(width: screenWidth * 0.02),
                  _buildDot(color: const Color(0xFFC7D6FB), screenWidth: screenWidth),
                  SizedBox(width: screenWidth * 0.02),
                  _buildDot(color: const Color(0xFFC7D6FB), screenWidth: screenWidth),
                  SizedBox(width: screenWidth * 0.02),
                  _buildDot(color: const Color(0xFF004CFF), screenWidth: screenWidth),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build each dot
  Widget _buildDot({required Color color, required double screenWidth}) {
    return Container(
      width: screenWidth * 0.03,
      height: screenWidth * 0.03,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: 30,
          ),
        ],
      ),
    );
  }
}
