import 'package:flutter/material.dart';

class toDolist extends StatelessWidget {
  const toDolist({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: GestureDetector(
        onDoubleTap: deleteFunction,
        child: Container(
          padding: const EdgeInsets.all(20),
          width: screenWidth * 0.20,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                side: const BorderSide(color: Colors.black),
              ),
              Text(
                taskName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: 3,
                    decorationColor: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
