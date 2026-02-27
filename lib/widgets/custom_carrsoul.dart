import 'package:flutter/material.dart';

class CustomCarousel extends StatefulWidget {
  final List<Widget> items;
  final bool autoPlay;
  final VoidCallback onPressed;
  const CustomCarousel({
    super.key,
    required this.items,
    this.autoPlay = false,
    required this.onPressed
  });

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  final PageController _controller = PageController(viewportFraction: 0.40);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: widget.items.length,
      onPageChanged: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      itemBuilder: (context, index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: currentIndex == index ? 10 : 30,
          ),
          child: Transform.scale(
            scale: currentIndex == index  ? 1.0 : 0.85, 
            child: InkWell(
              onTap: widget.onPressed,
              borderRadius: BorderRadius.circular(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: widget.items[index],
              ),
            ),
          ),
        );
      },
    );
  }
}