import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:craft_my_plate/widgets/BottomNavBar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 380, // Set the fixed height you need
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/logo7.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                 ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [ // Half of the image height (109 / 2)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/logo5.png",
                          width: 269,
                          height: 109,
                          fit: BoxFit.contain, // Adjusts the image to fit the specified width/height
                        ),
                        _buildServiceCard(
                          title: 'Bulk Food Delivery',
                          description: 'Hassle-free food for your house parties & more!',
                          orderText: 'Order before 1 day',
                          icon: FontAwesomeIcons.check,
                        ),
                      ],
                    ),
                  ),
                  buildServiceCard(),
                  SizedBox(height: 20),
                  // Occasions
                  _buildSectionHeader("What's Your Next Occasion?"),
                  _buildOccasionsScrollView(),
                  // Platters
                  _buildSectionHeader('Choose Your Platter'),
                  SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Bulk Food Delivery",
                      style: TextStyle(
                        color: Color(0xFF460F7E),
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildPlatterScrollView(),
                  SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Catering Service",
                      style: TextStyle(
                        color: Color(0xFF460F7E),
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  _buildTiffinScrollView(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildOptionButton(String assetPath) {
    return Container(
      width: 98,
      height: 130,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: AssetImage(assetPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required String title,
    required String description,
    required String orderText,
    required IconData icon,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFF843ACF), Color(0xFF460F7E)]),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.yellow),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(orderText, style: TextStyle(color: Colors.yellow)),
                ],
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
                child: FaIcon(FontAwesomeIcons.arrowRight, color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(description, style: TextStyle(color: Colors.white)),
          Divider(color: Colors.yellow),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCheckItem(icon, 'No Cooking'),
              _buildCheckItem(icon, 'No Cleaning'),
              _buildCheckItem(icon, 'No Hassle'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCheckItem(IconData icon, String label) {
    return Row(
      children: [
        Container(
          width: 17,
          height: 17,
          decoration: const BoxDecoration(
            color: Colors.yellow,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: FaIcon(icon, color: Colors.black, size: 16),
          ),
        ),
        SizedBox(width: 4),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildOccasionsScrollView() {
    final occasions = [
      'Birthday Party',
      'Cocktail Party',
      'engagement',
      'Farmhouse Party',
      'Get together',
      'Haldi',
      'House Party',
      'House Warming',
      'Kitty Party',
      'Office Party',
      'Pooja',
      'wedding',
      'Workshop',
    ];

    return SizedBox(
      height: 320, // Adjusted for two rows of images (2 * 144)
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: (occasions.length / 2).ceil(),
        itemBuilder: (context, index) {
          // Calculate start and end indexes for each column
          final firstRowOccasion = occasions[index * 2];
          final secondRowOccasion = index * 2 + 1 < occasions.length ? occasions[index * 2 + 1] : null;

          return Column(
            children: [
              // First row image
              _buildOccasionImage(firstRowOccasion),
              SizedBox(height: 16), // Spacing between rows
              // Second row image (if it exists)
              if (secondRowOccasion != null) _buildOccasionImage(secondRowOccasion),
            ],
          );
        },
      ),
    );
  }

  Widget _buildOccasionImage(String occasion) {
    final imagePath = 'assets/images/$occasion.png';

    return Container(
      width: 117.6,
      height: 144,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 117.6,
            height: 30,
            child: Center(
              child: Text(
                occasion,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildPlatterScrollView() {
    return SizedBox(
      height: 290,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildPlatterCard(
            title: 'Taste of Traditions',
            imageUrl: 'assets/images/measl2.png',
            minMax: 'Min 10 - Max 1500',
            price: 'Starts at ₹299',
            categories: '8 Categories & 16 Items',
          ),

          SizedBox(width: 16),
          _buildPlatterCard(
            title: 'South India Breakfast',
            imageUrl: 'assets/images/meals.png',
            minMax: 'Min 10 - Max 1500',
            price: 'Starts at ₹219',
            categories: '4 Categories & 8 Items',
          ),
        ],
      ),
    );
  }
  Widget _buildTiffinScrollView() {
    return SizedBox(
      height: 290,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildPlatterCard(
            title: 'South India Breakfast',
            imageUrl: 'assets/images/meals.png',
            minMax: 'Min 10 - Max 1500',
            price: 'Starts at ₹219',
            categories: '4 Categories & 8 Items',
          ),
          SizedBox(width: 16),
          _buildPlatterCard(
            title: 'Hyderbadhi Biryani',
            imageUrl: 'assets/images/biryani1.png',
            minMax: 'Min 5 - Max 1000',
            price: 'Starts at ₹299',
            categories: '6 Categories & 12 Items',
          ),
        ],
      ),
    );
  }

  Widget _buildPlatterCard({
    required String title,
    required String imageUrl,
    required String minMax,
    required String price,
    required String categories,
  }) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                imageUrl,
                width: double.infinity,
                height: 148,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Popular',
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.users, size: 14, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(minMax, style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(categories, style: TextStyle(color: Colors.purple)),
                    TextButton(
                      onPressed: () {
                        // Handle "See all" action here
                      },
                      child: Text('See all', style: TextStyle(color: Colors.grey)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey, )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }
  Widget buildServiceCard() {
    return Column(
      children: [
        Stack(
          children: [
            // Background image
            Container(
              width: 340,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.yellow.shade400),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/logo6.png',
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.5),
                  colorBlendMode: BlendMode.darken,
                ),
              ),
            ),
            // Text and Button overlay
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Catering Service',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Order before 2 days',
                          style: TextStyle(
                            color: Color(0xFFFBC437),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Suitable for small to large \ngatherings',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.yellow.shade400, backgroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                vertical: 6.0,
                                horizontal: 12.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Color(0xFFFBC437)),
                              ),
                            ),
                            icon: FaIcon(FontAwesomeIcons.arrowRight, size: 12),
                            label: Text(
                              'See Platters',
                              style: TextStyle(fontSize: 12),
                            ),
                            onPressed: () {
                              // Define action here
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // Footer Text
        Container(
          width: 340,
          padding: const EdgeInsets.symmetric(vertical: 6),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xFFFBC437),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: const Text(
            'Service & Live Cooking Available!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
