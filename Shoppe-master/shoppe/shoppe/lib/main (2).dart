import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppe/screens/banner_screen.dart';
import 'package:shoppe/screens/calender_screen.dart';
import 'package:shoppe/screens/cart_empty_screen.dart';
import 'package:shoppe/screens/categories_screen.dart';
import 'package:shoppe/screens/date_view_screen.dart';
import 'package:shoppe/screens/live_screen.dart';
import 'package:shoppe/screens/password_recovery_screen.dart';
import 'package:shoppe/screens/product_screen.dart';
import 'package:shoppe/screens/profile_screen.dart';
import 'package:shoppe/screens/password_screen.dart';
import 'package:shoppe/screens/ready_screen.dart';
import 'package:shoppe/screens/recent_screen.dart';
import 'package:shoppe/screens/review_screen.dart';
import 'package:shoppe/screens/sale_screen.dart';
import 'package:shoppe/screens/story_screen.dart';
import 'package:shoppe/screens/storybanner_screen.dart';
import 'package:shoppe/screens/variations_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/main', // Initial route
      routes: {
        '/main': (context) => const MyHomePage(), // Main home page
        '/password': (context) => const PasswordScreen(),
        '/password_recovery': (context) => const PasswordRecoveryScreen(),
        '/ready_screen': (context) => const ReadyScreen(),
        '/profile_screen': (context) => const ProfilePage(),
        '/live_screen': (context) => const LivePage(),
        '/story_screen': (context) => const ResponsivePage(),
        '/product_screen': (context) => const ProductPage(),
        '/sale_screen': (context) => const SaleScreen(),
        '/categories_screen': (context) => const CategoriesPage(),
        '/review_screen':(context) => const ReviewsPage(),
        '/banner_screen': (context) => const CustomPage(),
        '/storybanner_screen': (context) => const BannerPage(),
        '/variation_screen': (context) => const VariationsScreen(),
        '/recent_screen': (context) => const RecentlyViewedScreen(),
        '/calender_screen': (context) => const CalenderScreen(),
        '/date_view_screen': (context) => const DateViewedScreen(),
        '/cart_empty_screen': (context) => const CartPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              // First Background Bubble
              Positioned(
                top: screenHeight * -0.3,
                left: screenWidth * -0.5,
                child: Container(
                  width: screenWidth * 1.2,
                  height: screenWidth * 1.2,
                  decoration: const BoxDecoration(
                    color: Color(0xFF004BFE),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              // Second Background Bubble
              Positioned(
                top: screenHeight * 0.1,
                right: screenWidth * -0.4,
                child: Transform.rotate(
                  angle: -158 * 3.14159 / 180,
                  child: Container(
                    width: screenWidth * 0.6,
                    height: screenWidth * 0.6,
                    decoration: const BoxDecoration(
                      color: Color(0xFF004BFE),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),

              // "Login" Text
              Positioned(
                top: screenHeight * 0.4,
                left: screenWidth * 0.05,
                child: Text(
                  'Login',
                  style: GoogleFonts.raleway(
                    fontSize: screenWidth * 0.13,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF202020),
                  ),
                ),
              ),

              // Email TextField
              Positioned(
                top: screenHeight * 0.58,
                left: screenWidth * 0.05,
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.07,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenWidth * 0.05,
                      ),
                      hintText: 'Email',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 152, 149, 149),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
// "Good to see you back!" Text
Positioned(
  top: screenHeight * 0.5, // 50% from the top
  left: screenWidth * 0.05, // 5% padding from the left
  child: Text(
    'Good to see you back!',
    style: GoogleFonts.nunitoSans(
      fontSize: screenWidth * 0.05, // 5% of the screen width
      fontWeight: FontWeight.w300,
      color: const Color(0xFF202020),
    ),
  ),
),

// Black Heart Icon
Positioned(
  top: screenHeight * 0.505, // Slightly above the text
  left: screenWidth * 0.6, // Positioned on the right side
  child: const Icon(
    Icons.favorite,
    color: Colors.black,
    size: 16,
  ),
),

// "Next" Button with Popup
Positioned(
  top: screenHeight * 0.7, // 70% from the top
  left: screenWidth * 0.05, // 5% padding from the left
  child: ElevatedButton(
    onPressed: () {
      // Show the dialog when "Next" button is pressed
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirmation'),
            content: const Text('Are you sure you want to proceed?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  Navigator.pushNamed(context, '/password'); // Navigate to Password screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 225, 226, 228),
                ),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF004CFF),
      minimumSize: Size(screenWidth * 0.9, screenHeight * 0.075),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: Text(
      'Next',
      style: GoogleFonts.nunitoSans(
        fontSize: screenWidth * 0.05,
        fontWeight: FontWeight.w300,
        color: const Color(0xFFF3F3F3),
      ),
    ),
  ),
),

// "Cancel" Button
Positioned(
  top: screenHeight * 0.8, // 80% from the top
  left: screenWidth * 0.05, // 5% padding from the left
  child: ElevatedButton(
    onPressed: () {
      // Logic for Cancel button
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Cancel Action'),
            content: const Text('Do you want to stay on this screen?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('Yes'),
              ),
            ],
          );
        },
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 214, 211, 211),
      minimumSize: Size(screenWidth * 0.9, screenHeight * 0.075),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: Text(
      'Cancel',
      style: GoogleFonts.nunitoSans(
        fontSize: screenWidth * 0.05,
        fontWeight: FontWeight.w300,
        color: const Color.fromARGB(255, 0, 0, 0),
      ),
    ),
  ),
),     
  ],
 ),
),
 ),
);
}
}