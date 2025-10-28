import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/movie_list.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final List<String> bannerList = [
    'https://image.tmdb.org/t/p/w500/6Lw54zxm6BAEKJeGlabyzzR5Juu.jpg',
    'https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
    'https://image.tmdb.org/t/p/w500/8YFL5QQVPy3AgrEQxNYVSgiPEbe.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // === APPBAR GAYA NETFLIX ===
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(bottom: 12,top: 12),
          child: Text(
            "NOBARIN",
            style: TextStyle(
              color: Color(0xFFE50914), // merah khas Netflix
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: 1,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage(
                "assets/images/profile.jpeg",
              ),
            ),
          ),
        ],
      ),

      // === BODY: scrollable ===
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === Banner Carousel ===
            CarouselSlider(
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.95,
                autoPlayInterval: const Duration(seconds: 5),
              ),
              items: bannerList.map((url) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(url, fit: BoxFit.cover),
                      // Lapisan gradasi biar lebih keren
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black54,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 10),

            // === Movie List Section ===
            const MovieList(),
          ],
        ),
      ),
    );
  }
}
