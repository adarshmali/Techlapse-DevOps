import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CartPage(),
//     );
//   }
// }

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Cart',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: -0.28,
          ),
        ),
        centerTitle: false,
        actions: [
          Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.only(right: 239),
            decoration: BoxDecoration(
              color: const Color(0xFFE5EBFC),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text(
                '0',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Shipping Address Bar
              Container(
                margin: const EdgeInsets.only(top: 24),
                padding: const EdgeInsets.all(15),
                height: 90,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 240, 245),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Shipping Address',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '26. Duong So 2, Thao Dien Ward, \nAn Phu, District 2, Ho Chi Minh city',
                          style: TextStyle(
                            fontFamily: 'Nunito Sans',
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: const Color(0xFF004BFE),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 19,
                      ),
                    ),
                  ],
                ),
              ),

              // Logo Layout
              const SizedBox(height: 60),
             Center(
  child: Stack(
    children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.4, // 40% of screen width
        height: MediaQuery.of(context).size.width * 0.4,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0x29000000),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.width * 0.1,
        left: MediaQuery.of(context).size.width * 0.1,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.width * 0.2,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Logo.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ],
  ),
),

              // Most Popular Section
              const SizedBox(height: 70), // Increased spacing to move it down
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Most Popular',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'See All',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.blue,
                        size: 21,
                      ),
                    ],
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
              // Product List
              SizedBox(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4, // Number of product items
                  itemBuilder: (context, index) {
                    return Container(
                      width: 104,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(9),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 112,
                            width: 93.41,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/image6.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(9),
                                topRight: Radius.circular(9),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '1780 💙   New',
                            
                            style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 11),
              // Total and Checkout Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total: \$0.00',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      'Checkout',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle navigation
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}
