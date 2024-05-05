import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimerWidget extends StatefulWidget {
  final bool isText;
  final Color? color;
  final double? fontSize;

  const CountdownTimerWidget({
    Key? key,
    this.isText = false,
    this.color,
    this.fontSize,
  }) : super(key: key);

  @override
  _CountdownTimerWidgetState createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  late DateTime startTime;
  late Duration duration;
  late Timer timer;
  late StreamController<String> countdownStreamController;
  late Stream<String> countdownStream;

  void initState() {
    super.initState();

    final now = DateTime.now();

    // Check if the current time is within the allowed range (5:00 AM to 10:00 AM)
    if (now.hour >= 5 && now.hour < 10) {
      // Automatically set the start time to 5:00 AM
      startTime = DateTime(now.year, now.month, now.day, 5, 0);
      duration = startTime.difference(now);

      // Start the countdown
      countDown();
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        updateTime();
      });
    } else {
      // Close the stream controller and cancel the timer
      countdownStreamController.close();
      timer.cancel();
    }
  }


  DateTime _getDefaultStartTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, 5, 0); // Default start time is 5:00 AM
  }

  void countDown() {
    countdownStreamController = StreamController<String>();
    countdownStream = countdownStreamController.stream;
    updateTime();
  }

  bool _isWithinTimeRange() {
    final now = DateTime.now();
    final endTime = startTime.add(const Duration(hours: 5)); // End time is 5 hours after the start time
    return now.isAfter(startTime) && now.isBefore(endTime);
  }

  void updateTime() {
    final now = DateTime.now();
    final endTime = startTime.add(const Duration(hours: 5)); // End time is 5 hours after the start time
    if (now.isBefore(endTime)) {
      duration = endTime.difference(now); // Calculate remaining time from end time
      countdownStreamController.add(
        '${duration.inHours}h ${duration.inMinutes.remainder(60)}m ${duration.inSeconds.remainder(60)}s',
      );
    } else {
      timer.cancel();
      countdownStreamController.close();
    }
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: countdownStream,
      builder: (context, snapshot) {
        if (_isWithinTimeRange()) {
          if (snapshot.hasData) {
            var countdownValues = snapshot.data!.split(' ');
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCountdownValue(countdownValues[0]),
                _buildCountdownValue(countdownValues[1]),
                _buildCountdownValueSecond(countdownValues[2]),
              ],
            );
          } else {
            return const SizedBox();
          }
        } else {
          return const Center(
            child: Text(
              'Not Available', // Display this message when the countdown is not active
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.black, // You can customize the color as needed
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildCountdownValue(String value) {
    return Row(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildCountdownValueSecond(String value) {
    return Row(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    timer.cancel();
    countdownStreamController.close();
    super.dispose();
  }
}
