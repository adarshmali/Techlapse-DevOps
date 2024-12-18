import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false, // Remove debug banner
//       home: ResponsivePage(),
//     );
//   }
// }

class ResponsivePage extends StatefulWidget {
  const ResponsivePage({super.key});

  @override
  State<ResponsivePage> createState() => _ResponsivePageState();
}

class _ResponsivePageState extends State<ResponsivePage>
    with SingleTickerProviderStateMixin {
  bool _showPopup = false; // Controls the visibility of the popup
  Offset _popupPosition = Offset.zero; // Position of the popup

  @override
  Widget build(BuildContext context) {
    // Screen size for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Image container
          Positioned(
            top: screenHeight * 0.07, // 58px proportional to height
            left: screenWidth * 0.05, // 20px proportional to width
            child: Container(
              width: screenWidth * 0.89, // 335px proportional to width
              height: screenHeight * 0.76, // 620px proportional to height
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 5),
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/image.png', // Add the image to the assets folder
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // First button
          Positioned(
            top: screenHeight * 0.33, // 267px proportional to height
            left: screenWidth * 0.24, // 92px proportional to width
            child: GestureDetector(
              onTap: () {
                _showPopupNearButton(screenWidth * 0.24, screenHeight * 0.33);
              },
              child: Container(
                width: 23,
                height: 23,
                decoration: BoxDecoration(
                  color: const Color(0xFF004CFF),
                  border: Border.all(color: Colors.white, width: 3),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          // Second button
          Positioned(
            top: screenHeight * 0.52, // 419px proportional to height
            left: screenWidth * 0.63, // 235px proportional to width
            child: GestureDetector(
              onTap: () {
                _showPopupNearButton(screenWidth * 0.63, screenHeight * 0.52);
              },
              child: Container(
                width: 23,
                height: 23,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFF004CFF), width: 3),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          // Popup message
          if (_showPopup)
            Positioned(
              left: _popupPosition.dx,
              top: _popupPosition.dy,
              child: AnimatedOpacity(
                opacity: _showPopup ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 10), // Message padding
                  decoration: BoxDecoration(
                    color: const Color(0xFF004CFF),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Shop Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

  // Slide bar
Positioned(
  top: screenHeight * 0.86, // 698px proportional to height
  left: screenWidth * 0.36, // 118px proportional to width
  child: Row(
    children: [
      for (int i = 0; i < 6; i++) // Adjust loop for the exact number of elements
        if (i == 2)
          // Active slide
          Container(
            width: 27,
            height: 10,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              color: const Color(0xFF004CFF),
              borderRadius: BorderRadius.circular(5),
            ),
          )
        else
          // Small dots
          Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
          ),
    ],
  ),
),

          // Bottom bar
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.1, // 84px proportional to height
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, -1),
                    blurRadius: 1,
                  ),
                ],
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/product_screen');
                    }, 
                    child: const Icon(Icons.home, color: Colors.blue),
                  ),

                  const Icon(Icons.favorite_border, color: Colors.black),
                  const Icon(Icons.note, color: Colors.black),
                  const Icon(Icons.shopping_bag, color: Colors.black),
                  const Icon(Icons.person_outline, color: Colors.black),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Show popup near the button's position
  void _showPopupNearButton(double buttonX, double buttonY) {
    setState(() {
      _popupPosition = Offset(buttonX + 10, buttonY - 30); // Popup position
      _showPopup = true;
    });

    // Hide popup after 1.5 seconds
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showPopup = false;
      });
    });
  }
}
