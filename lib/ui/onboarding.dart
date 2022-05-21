import 'package:flutter/material.dart';
import 'package:flutter_assignment/model/onboarding_model.dart';
import 'package:flutter_assignment/resources/strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<OnBoardingModel> onBoardingList =
      OnBoardingModel.getOnBoardingModelList();

  String flowerName = '';

  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    flowerName = onBoardingList.isNotEmpty ? onBoardingList[0].flower_name : '';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Stack(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 130,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(Colors.red),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(0),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                      )),
                                      elevation: MaterialStateProperty.all(0),
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.fromLTRB(
                                              20, 15, 20, 15))),
                                  child: Text(flowerName),
                                  onPressed: () {},
                                ),
                              ),
                              Expanded(
                                child: PageView.builder(
                                  controller: _pageController,
                                  itemCount: onBoardingList.length,
                                  pageSnapping: true,
                                  itemBuilder: ((context, index) {
                                    OnBoardingModel onBoardingModel =
                                        onBoardingList[index];
                                    return Image.network(
                                        onBoardingModel.flower_link,
                                        fit: BoxFit.fill);
                                  }),
                                  onPageChanged: (int) {
                                    updateFlowerName(
                                        onBoardingList[int].flower_name);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 7.5),
                          child: Container(
                            height: 25,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.lightBlueAccent,
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: SmoothPageIndicator(
                                controller: _pageController,
                                count: onBoardingList.length,
                                effect: const ExpandingDotsEffect(
                                    activeDotColor: Colors.red),
                                onDotClicked: (index) {}),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                              elevation: MaterialStateProperty.all(0),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.fromLTRB(20, 15, 20, 15))),
                          child: const Text(Strings.getStarted),
                          onPressed: () {},
                        ),
                        const Text(Strings.login,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontFamily: 'Lato'))
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void updateFlowerName(String name) {
    setState(() {
      flowerName = name;
    });
  }
}
