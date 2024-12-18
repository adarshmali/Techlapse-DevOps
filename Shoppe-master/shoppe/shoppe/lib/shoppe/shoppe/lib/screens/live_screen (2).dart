import 'package:flutter/material.dart';

class LivePage extends StatelessWidget {
  const LivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Image Box
          Positioned(
            top: screenHeight * 0.07,
            left: screenWidth * 0.05,
            child: Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A000000),
                    offset: Offset(0, 5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/live.png', // Ensure this is the correct path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Live, Shop Button, and Icons Row
          Positioned(
            top: screenHeight * 0.85,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: Container(
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1A000000),
                    offset: Offset(0, -1),
                    blurRadius: 1,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Eye Icon and Views
                  const Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        size: 22,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8),
                      Text(
                        '2,530',
                        style: TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  // Live Button
                  Container(
                    width: 40,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Color(0xFF08C514),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Live',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1.3, // Matches line height of 16px
                          letterSpacing: -0.12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // Play Button (Using Asset Image)
                  GestureDetector(
                    onTap: () {
                      //
                    },
                    child: Image.asset(
                      'assets/forward_icon.png', // Ensure the path is correct
                      width: 24.55,
                      height: 16,
                    ),
                  ),
                  // Shop Button
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/story_screen');
                    },
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF004CFF),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: const Center(
                        child: Text(
                          'Shop',
                          style: TextStyle(
                            fontFamily: 'Nunito Sans',
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        height: 84,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x1A000000),
              offset: Offset(0, -1),
              blurRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Home Button
            IconButton(
              icon: const Icon(Icons.home, color: Colors.blue),
              onPressed: () {
                // Add functionality for home button
              },
            ),
            // Favorite Button
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.blue),
              onPressed: () {
                // Add functionality for favorite button
              },
            ),
            // Cart Button
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined, color: Colors.blue),
              onPressed: () {
                // Add functionality for cart button
              },
            ),
            // Profile Button
            IconButton(
              icon: const Icon(Icons.person_outline, color: Colors.blue),
              onPressed: () {
                // Add functionality for profile button
              },
            ),
          ],
        ),
      ),
       // Floating Action Button
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70), // Adjust FAB position
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF004CFF),
          onPressed: () {
            // Add functionality for FAB
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Quick Actions'),
                  content: const Text('Hello Access live chat here!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.message, color: Colors.white),
        ),
      ),
    );
  }
}