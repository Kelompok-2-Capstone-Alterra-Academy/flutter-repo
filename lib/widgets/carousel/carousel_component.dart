import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:staredu/models/sell_course_model.dart';
import 'package:staredu/widgets/card/card_course_for_sale.dart';

class CarouselComponent extends StatefulWidget {
  List<SellCourseModel> _courseForSale = [];

  CarouselComponent({Key? key, required List<SellCourseModel> courseForSale})
      : super(key: key) {
    _courseForSale = courseForSale;
  }

  @override
  State<CarouselComponent> createState() => _CarouselComponentState();
}

class _CarouselComponentState extends State<CarouselComponent> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            items: widget._courseForSale
                .map((item) => CardCourseForSale(
                      id: item.id ?? 0,
                      thumbnail: item.thumbnail ?? 'thumbnail',
                      courseName: item.courseName ?? 'courseName',
                      price: item.price ?? '0.0',
                      liveSession: item.liveSessionWeek ?? 'liveSession',
                      description: item.description ?? 'description',
                      className:
                          item.sellCourseModelClass!.className ?? 'className',
                      scores: item.scores ?? 0.0,
                      numStudent: item.numStudents ?? 0,
                    ))
                .toList(),
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.2,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Transform(
          transform: Matrix4.translationValues(0, -20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget._courseForSale.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
