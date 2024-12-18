import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: BannerPage(),
//   ));
// }

class BannerPage extends StatelessWidget {
  const BannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // White background
      body: Stack(
        children: [
          // Main Image Container
          Positioned(
            top: screenHeight * 0.060, // 59px proportional to height
            left: screenWidth * 0.053, // 20px proportional to width
            child: Container(
              width: screenWidth * 0.893, // 335px proportional to width
              height: screenHeight * 0.80, // 617px proportional to height
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Image.asset(
                "assets/photo.png", // Replace with your main image path
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content Overlay Container
          Positioned(
            top: screenHeight * 0.68, // 542px proportional to height
            left: screenWidth * 0.08, // 30px proportional to width
            child: Container(
              width: screenWidth * 0.84, // 315px proportional to width
              height: screenHeight * 0.152, // 124px proportional to height
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Second Image
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 133, // Fixed width for second image
                      height: 110, // Fixed height for second image
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/yellow.png"), // Replace with your second image path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Text and Button Section
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text Section
                        const SizedBox(
                          width: 158,
                          height: 38,
                          child: Text(
                            'Lorem ipsum dolor sit amet consectetur.',
                            style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              height: 1.3,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Spacer(),
                        // Shop Button
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/variation_screen');
                          },
                          child: Container(
                            width: 155,
                            height: 41,
                            decoration: const BoxDecoration(
                              color: Color(0xFF004CFF), // Blue background
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(11),
                                topRight: Radius.circular(11),
                                bottomLeft: Radius.circular(11),
                                bottomRight: Radius.circular(11)
                              ),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Shop',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 17,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Slide Bar
          Positioned(
            top: screenHeight * 0.89, // 698px proportional to height
            left: screenWidth * 0.38, // 118px proportional to width
            child: Row(
              children: [
                for (int i = 0; i < 6; i++)
                  if (i == 2) // Active slide
                    Container(
                      width: 41,
                      height: 12,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFF004CFF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    )
                  else // Normal dots
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: const BoxDecoration(
                        color: Color(0xFFCCD9F9),
                        shape: BoxShape.circle,
                      ),
                    ),
              ],
            ),
          ),

          // Bottom Bar with 5 Icons
          Positioned(
            bottom: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.07, // 56px proportional to height
              color: const Color.fromARGB(255, 255, 255, 255), // Light grey background
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home, size: 30, color: Colors.black),
                    onPressed: () {
                      print("Home icon pressed!");
                    },
                  ),
                  const Icon(Icons.search, size: 30, color: Color(0xFF2228C7)),
                  const Icon(Icons.shopping_cart, size: 30, color: Color(0xFF2228C7)),
                  const Icon(Icons.favorite_border, size: 30, color: Color(0xFF2228C7)),
                  const Icon(Icons.person, size: 30, color: Color(0xFF2228C7)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
