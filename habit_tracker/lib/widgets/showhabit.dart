import 'package:flutter/material.dart';

class Showhabit extends StatelessWidget {
  const Showhabit({
    super.key,
    required this.title,
    required this.image,
    required this.isSelect,
    required this.onTap,
  });

  final String title;
  final String image;
  final bool isSelect;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 0.5),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        child: Container(
          key: ValueKey<bool>(isSelect),
          height: height * 0.14,
          width: width * 0.43,
          decoration: BoxDecoration(
            color: isSelect ? const Color(0xFFFDF8F5) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 2,
              color: isSelect
                  ? const Color(0xFFFCAE98)
                  : Colors.grey.withOpacity(0.3),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: height * 0.09,
                width: 70,
              ),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: height * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
