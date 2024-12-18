import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: CustomPage(),
//   ));
// }

class CustomPage extends StatelessWidget {
  const CustomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // White background
      body: Stack(
        children: [
        
          // 1st Image Container
        Positioned(
            top: screenHeight * 0.07, // 58px proportional to height
            left: screenWidth * 0.05, // 20px proportional to width
            child: Container(
              width: screenWidth * 0.89, // 335px proportional to width
              height: screenHeight * 0.52, // 423px proportional to height
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20), // Adjust radius as needed
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16), // Match radius to the container
                ),
                child: Image.asset(
                  "assets/banner.png", // Replace with your first image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),


          // 2nd Image
          Positioned(
            top: screenHeight * 0.6, // 487px proportional to height
            left: screenWidth * 0.05, // 20px proportional to width
            child: SizedBox(
              width: screenWidth * 0.89, // 335px proportional to width
              height: screenHeight * 0.16, // 130px proportional to height
              child: Image.asset(
                "assets/bigsale.png", // Replace with your second image path
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Text and Shop Button Section
          Positioned(
            top: screenHeight * 0.78, // 626px proportional to height
            left: screenWidth * 0.08, // 30px proportional to width
            child: SizedBox(
              width: screenWidth * 0.84, // 315px proportional to width
              height: screenHeight * 0.07, // 56px proportional to height
              child: Row(
                children: [
                  // Text
                  const Expanded(
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      style: TextStyle(
                        fontFamily: 'Nunito Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Shop Button
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/storybanner_screen'); // Add functionality here
                    },
                    child: Container(
                      width: 125,
                      height: 43,
                      decoration: const BoxDecoration(
                        color: Color(0xFF004CFF), // Blue background
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(11),
                          topRight: Radius.circular(11),
                          bottomLeft: Radius.circular(11),
                          bottomRight: Radius.circular(11),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Shop",
                        style: TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Slide Bar
          Positioned(
            top: screenHeight * 0.89, // 698px proportional to height
            left: screenWidth * 0.34, // 118px proportional to width
            child: Row(
              children: [
                for (int i = 0; i < 6; i++)
                  if (i == 2) // Active slide
                    Container(
                      width: 40,
                      height: 10,
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.home, size: 30, color: Colors.black),
                  Icon(Icons.search, size: 30, color: Color.fromARGB(255, 34, 40, 199)),
                  Icon(Icons.shopping_cart, size: 30, color: Color.fromARGB(255, 34, 40, 199)),
                  Icon(Icons.favorite_border, size: 30, color: Color.fromARGB(255, 34, 40, 199)),
                  Icon(Icons.person, size: 30, color:Color.fromARGB(255, 34, 40, 199)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
