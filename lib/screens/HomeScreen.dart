import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Background image
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/logo4.png",
                    fit: BoxFit.cover, // Ensures the image fills the container
                  ),
                ),
                // Foreground container with content
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                SizedBox(height: 30),
                                Icon(Icons.person_pin, size: 32),
                                SizedBox(width: 8),
                                Text(
                                  'Hyderabad',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF503829),
                                    fontSize: 20,
                                  ),
                                ),
                                FaIcon(FontAwesomeIcons.chevronDown, color: Color(0xFF503829)),
                              ],
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Color(0xFFF9E787),
                                backgroundColor: Color(0xFF503829),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {},
                              icon: FaIcon(FontAwesomeIcons.coins),
                              label: Text('Earn Rewards'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 110),
                      // Greeting
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          children: [
                            Text(
                              'Hello,',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF68420A),
                              ),
                            ),
                            Text(
                              'Hyderabad!',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFAF7013),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Options
                    ],
                  ),
                ),
              ],
            ),

            // White background starts here
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  // Banner
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.yellow),
                          Text(
                            'Starts from 10 Guests Onwards!',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          FaIcon(FontAwesomeIcons.arrowRight, color: Colors.yellow),
                        ],
                      ),
                    ),
                  ),
                  // Services
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _buildServiceCard(
                          title: 'Bulk Food Delivery',
                          description: 'Hassle-free food for your house parties & more!',
                          orderText: 'Order before 1 day',
                          icon: FontAwesomeIcons.check,
                        ),
                        SizedBox(height: 16),
                        _buildServiceCard(
                          title: 'Catering Service',
                          description: 'Suitable for small to large gatherings',
                          orderText: 'Order before 2 days',
                          icon: FontAwesomeIcons.check,
                        ),
                      ],
                    ),
                  ),
                  // Occasions
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        Text(
                          'What’s Your Next Occasion?',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 16),
                        _buildOccasionsGrid(),
                      ],
                    ),
                  ),
                  // Platters
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose Your Platter',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 16),
                        _buildPlatterCard(
                          title: 'Taste of Traditions',
                          imageUrl:
                          'https://storage.googleapis.com/a1aa/image/e8BurKQF7B1ZEaX9ce0CvpGJCr3XcnweaCb29VPjrCfDgynOB.jpg',
                          minMax: 'Min 10 - Max 1500',
                          price: 'Starts at ₹299',
                          categories: '8 Categories & 16 Items',
                        ),
                        SizedBox(height: 16),
                        _buildPlatterCard(
                          title: 'South Indian Breakfast',
                          imageUrl:
                          'https://storage.googleapis.com/a1aa/image/Bhp25dKO13YWLJTn4BASOa0OJBLfhNgwOVsaleUkxFR5n8pTA.jpg',
                          minMax: 'Min 10 - Max 1500',
                          price: 'Starts at ₹199',
                          categories: '5 Categories & 10 Items',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(String assetPath) {
    return Container(
      width: 120,
      height: 105,
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
                decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(8)),
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

  Widget _buildOccasionsGrid() {
    final occasions = [
      {
        'title': 'House Party',
        'image': 'https://storage.googleapis.com/a1aa/image/t5zlhLc8OjoJChALS0kp2RTgFHR6nYsVYvps8Z3IhtMBKf0JA.jpg',
      },
      {
        'title': 'Birthday',
        'image': 'https://storage.googleapis.com/a1aa/image/4BfSRorvaORXCCvHufyP8quzrvkdhKnV9NQTg9rF5Bn4n8pTA.jpg',
      },
      {
        'title': 'Pooja',
        'image': 'https://storage.googleapis.com/a1aa/image/Pminc86kXobeKqgtJiaWfk65OReThzNQZmtf1O8iudrffJf0JA.jpg',
      },
      {
        'title': 'Haldi',
        'image': 'https://storage.googleapis.com/a1aa/image/AxaKkWd3VVJYNjfnfG1wAi61lbTfjMYQRz9vJ9cnKTc1rJfqQw.jpg',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: occasions.length,
      itemBuilder: (context, index) {
        final occasion = occasions[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(occasion['image']!),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              occasion['title']!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                shadows: [Shadow(blurRadius: 5, color: Colors.black)],
              ),
            ),
          ),
        );
      },
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
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFFFAE787), Color(0xFFFFD800)]),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.yellow),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
          SizedBox(height: 8),
          Image.network(imageUrl),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(minMax, style: TextStyle(color: Colors.grey[700])),
                  Text(categories, style: TextStyle(color: Colors.grey[700])),
                ],
              ),
              Text(price, style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
