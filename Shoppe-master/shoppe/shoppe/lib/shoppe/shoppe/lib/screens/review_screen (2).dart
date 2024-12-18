import 'package:flutter/material.dart';
import 'package:shoppe/screens/banner_screen.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Reviews',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: List.generate(4, (index) => buildReviewCard()),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  selectedItemColor: Colors.blue,
  unselectedItemColor: Colors.grey,
  onTap: (index) {
    if (index == 0) {
      print('Home icon pressed!');
      Navigator.push(context, MaterialPageRoute(builder: (_) => const CustomPage()));
    }
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

  Widget buildReviewCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage('assets/gap.png'), // Replace with your image
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          // Review Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Reviewer Name
                const Text(
                  'Veronika',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                // Stars
                Row(
                  children: List.generate(5, (index) {
                    if (index < 4) {
                      return const Icon(
                        Icons.star,
                        color: Color(0xFFECA61B),
                        size: 15,
                      );
                    } else {
                      return const Icon(
                        Icons.star_border,
                        color: Color(0xFFECA61B),
                        size: 15,
                      );
                    }
                  }),
                ),
                const SizedBox(height: 10),
                // Review Text
                const Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, '
                  'sed diam nonumy eirmod tempor invidunt ut labore et dolore '
                  'magna aliquyam erat, sed diam voluptua. At vero eos et accusam '
                  'et justo duo dolores et ea rebum.',
                  style: TextStyle(
                    fontFamily: 'Nunito Sans',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    height: 1.5,
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
