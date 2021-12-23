import 'package:blog_app/ui/widget/onboarding/onboarding_image.dart';
import 'package:blog_app/ui/widget/onboarding/onboarding_track.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9FAFF),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: const [
                  Expanded(
                    child: OnboardingImage(
                        imagePath: 'assets/images/onboarding/nature.jpg'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: OnboardingImage(
                        imagePath:
                            'assets/images/onboarding/virtualreality.jpg'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: const [
                  Expanded(
                    flex: 2,
                    child: OnboardingImage(
                        imagePath: 'assets/images/onboarding/diver.jpg'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: OnboardingImage(
                        imagePath: 'assets/images/onboarding/ocean.jpg'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(28.0) +
                    const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28.0),
                    topRight: Radius.circular(28.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 10.0,
                      offset: Offset(0.0, -10.0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ScrollConfiguration(
                        behavior: const ScrollBehavior(),
                        child: PageView(
                          controller: _pageController,
                          children: const [
                            OnboardingTrack(
                              title: 'Read the article you want instantly',
                              body:
                                  'You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones',
                            ),
                            OnboardingTrack(
                              title:
                                  'Read articles from your favourite authors',
                              body:
                                  'You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones',
                            ),
                            OnboardingTrack(
                              title: 'Read articles from variety of topics',
                              body:
                                  'You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones',
                            ),
                            OnboardingTrack(
                              title: 'Share articles with friends and family',
                              body:
                                  'You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(4, (index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 2.0),
                              height: 6,
                              width: _currentIndex == index ? 20 : 10,
                              decoration: BoxDecoration(
                                color: _currentIndex == index
                                    ? Colors.blue
                                    : const Color(0xffdee7ff),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                              ),
                            );
                          }),
                        ),
                        GestureDetector(
                          onTap: () {
                            //print(_pageController.page);
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.decelerate,
                            );
                          },
                          child: Container(
                            width: 88,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
