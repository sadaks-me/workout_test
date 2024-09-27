import 'package:flutter/material.dart';
import 'package:workout/utils/themes.dart';

class WorkoutTile extends StatelessWidget {
  const WorkoutTile({
    super.key,
    required this.title,
    this.onSelected,
    this.onDeleted,
  });

  final String title;
  final VoidCallback? onSelected;
  final VoidCallback? onDeleted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: appTheme.cardColor),
          borderRadius: BorderRadius.circular(8)),
      contentPadding: EdgeInsets.only(left: 16),
      title: Text(title),
      onTap: onSelected,
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDeleted,
      ),
    );
  }
}
