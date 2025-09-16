import 'package:flutter/material.dart';

import 'home.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int currentPage = 0;
  List<Map<String, String>> onboardingData = [
    {
      "title": "Choose Products",
      "desc":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
      "image": "assets/images/CHOOSE.png"
    },
    {
      "title": "Make Payment",
      "desc":
          "Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
      "image": "assets/images/PAYMENT.png"
    },
    {
      "title": "Get Your Order",
      "desc":
          "Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
      "image": "assets/images/ORDER.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: onboardingData.length,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (context, index) => OnboardingContent(
          title: onboardingData[index]['title']!,
          description: onboardingData[index]['desc']!,
          image: onboardingData[index]['image']!,
        ),
      ),
      bottomSheet: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                _controller.jumpToPage(2);
              },
              child: const Text("Skip"),
            ),
            Row(
              children: List.generate(
                onboardingData.length,
                (index) => Container(
                  margin: const EdgeInsets.only(right: 4),
                  height: 8,
                  width: currentPage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: currentPage == index ? Colors.red : Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            currentPage == onboardingData.length - 1
                ? TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    child: const Text(
                      "Get Started",
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.red),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String title, description, image;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Column(
        children: [
          const Spacer(),
          Image.asset(image, height: 250),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
