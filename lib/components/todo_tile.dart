// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      //this is the padding of the tile
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(25),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(24),
          //this decoration is the style we are applying to the tile(container that is being returned)
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            //makes the border of the corners of the tile circular
            //greater the value of circular more will be the curvature
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              //tasks
              Text(
                taskName,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    //taskcompleted is a bool so returns a value and wrt that value its text decoration will be changed
                    //if complete(true) create a line through else keep it normal
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
