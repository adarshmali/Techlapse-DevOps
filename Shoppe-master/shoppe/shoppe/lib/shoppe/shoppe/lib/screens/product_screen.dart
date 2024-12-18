import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false, // Remove the debug banner
//       home: ProductPage(),
//     );
//   }
// }

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // Background color
      body: Stack(
        children: [
          // Fullscreen image
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/image.png', // Replace with your image file
              width: 409,
              height: 447,
              fit: BoxFit.cover, // Ensures the image fits the screen without spacing
            ),
          ),
          // Slider dots
          Positioned(
            top: 419,
            left: 128,
            child: Row(
              children: [
                // Large active circle
                Container(
                  width: 40,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFF004BFF), // Active color
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Small inactive circles
                for (int i = 0; i < 4; i++) ...[
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: const Color(0x33004BFF), // Inactive color
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  if (i != 3) const SizedBox(width: 10),
                ],
              ],
            ),
          ),
         const Positioned(
            top: 460,
            left: 20,
            child: SizedBox(
              width: 94,
              height: 37,
              child: Center(
                child: Text(
                  '\$17,00',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 29,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    letterSpacing: -0.26,
                  ),
                ),
              ),
            ),
          ),
          // Share button (aligned with price text)
          Positioned(
            top: 460,
            left: 358, // Moved share button a little to the right
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xFFFFEBEB), // Background color
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share),
                iconSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
          // Description text
          Positioned(
            top: 515,
            left: 20,
            child: Container(
              width: 340,
              height: 75,
              padding: const EdgeInsets.all(4),
              color: Colors.white,
              child: const Text(
                'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Etiam arcu mauris, scelerisque\neu mauris id, pretium pulvinar sapien.',
                style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  height: 1.33,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  textBaseline: TextBaseline.alphabetic,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          // Variations Section and Buttons (moved down)
          Positioned(
            top: 608, // Moved down from 580 to make space
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // "Variations" Row
                Row(
                  children: [
                    // "Variations" Text
                    Container(
                      width: 96,
                      height: 26,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: const Center(
                        child: Text(
                          'Variations',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            height: 1.3,
                            color: Colors.black,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // "Pink" Button
                    Container(
                      width: 54,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Pink',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // "M" Button
                    Container(
                      width: 54,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'M',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ),
                    const Spacer(),
                    // Arrow Button
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFF004CFF),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/sale_screen');
                        },
                        icon: const Icon(Icons.arrow_forward),
                        iconSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Image Boxes Row
                Row(
                  children: [
                    // First Image Box
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[300]!),
                        image: const DecorationImage(
                          image: AssetImage('assets/clothing.png'), // Replace with your image file
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Second Image Box
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[300]!),
                        image: const DecorationImage(
                          image: AssetImage('assets/image2.png'), // Replace with your image file
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Third Image Box
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[300]!),
                        image: const DecorationImage(
                          image: AssetImage('assets/image1.png'), // Replace with your image file
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Heart, Add to Cart, and Buy Now Buttons (positioned at the bottom)
          Positioned(
            bottom: 20,
            left: 10,
            right: 20,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                  color: Colors.black,
                  iconSize: 34, // Increased size
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Add to cart',
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Changed text color
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 15, 231),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Buy now',
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Changed text color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
