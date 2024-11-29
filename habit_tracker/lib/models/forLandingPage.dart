import 'dart:ui';

class Habit {
  final String title;
  final String imagePath;
  final String subtitle;
  final Color color;

  Habit(
      {required this.title,
      required this.imagePath,
      required this.subtitle,
      required this.color});

  static final List<Habit> habits = [
    Habit(
        title: 'Work Out',
        imagePath: 'assets/habit/run.png',
        subtitle: '12.00 for 5km',
        color: const Color(0xFFEAF5Ed)),
    Habit(
        title: 'Eat Food',
        imagePath: 'assets/habit/burger.png',
        subtitle: '1.00 for 2 Burger',
        color: const Color(0xFFFAEDE6)),
    Habit(
        title: 'Music',
        imagePath: 'assets/habit/mic.png',
        subtitle: '02.00 for 20min',
        color: const Color(0xFFFAFAE5)),
    Habit(
        title: 'Yoga',
        imagePath: 'assets/habit/yoga.png',
        subtitle: '07.00 for 10min',
        color: const Color(0xFFF5EAF3)),
    Habit(
        title: 'Travelling',
        imagePath: 'assets/habit/travel.png',
        subtitle: 'India for 2 days',
        color: const Color(0xFFEAF5Ed)),
    Habit(
        title: 'Read Book',
        imagePath: 'assets/habit/book.png',
        subtitle: '09.00 for 20min',
        color: const Color(0xFFFAEDE6)),
    Habit(
        title: 'Gaming',
        imagePath: 'assets/habit/game.png',
        subtitle: '10.00 for 15min',
        color: const Color(0xFFFAFAE5)),
    Habit(
        title: 'Swimming',
        imagePath: 'assets/habit/swim.png',
        subtitle: '04.00 for 30min',
        color: const Color(0xFFF5EAF3)),
    Habit(
        title: 'Bicycle',
        imagePath: 'assets/habit/cycle.png',
        subtitle: '08.00 for 20min',
        color: const Color(0xFFFAEDE6)),
    Habit(
        title: 'Playing',
        imagePath: 'assets/habit/play.png',
        subtitle: '05.00 for 1 hour',
        color: const Color(0xFFEAF5Ed)),
  ];
}
