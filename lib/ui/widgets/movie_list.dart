import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  final List<String> trendingList = const [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
  ];

  final List<String> popularList = const [
    'assets/images/3.png',
    'assets/images/5.png',
    'assets/images/1.png',
    'assets/images/6.png',
    'assets/images/2.png',
    'assets/images/4.png',
  ];

  final List<String> topRatedList = const [
    'assets/images/6.png',
    'assets/images/5.png',
    'assets/images/4.png',
    'assets/images/3.png',
    'assets/images/2.png',
    'assets/images/1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),

        // Trending Now
        _buildSectionHeader(context, "Trending Now"),
        const SizedBox(height: 8), // ✅ jarak antara judul dan list
        _buildHorizontalList(trendingList),

        const SizedBox(height: 20),

        // Popular Now
        _buildSectionHeader(context, "Popular Now"),
        const SizedBox(height: 8),
        _buildHorizontalList(popularList),

        const SizedBox(height: 20),

        // Top Rated
        _buildSectionHeader(context, "Top Rated"),
        const SizedBox(height: 8),
        _buildHorizontalList(topRatedList),

        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('See all for $title'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            child: const Text(
              "See all",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalList(List<String> imageList) {
    return SizedBox(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Container(
            width: 130,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imageList[index]),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black54, Colors.transparent],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
