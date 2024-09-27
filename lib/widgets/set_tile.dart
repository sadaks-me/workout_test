import 'package:flutter/material.dart';
import 'package:workout/models/workout.dart';
import 'package:workout/utils/constants.dart';
import 'package:workout/utils/themes.dart';

class SetTile extends StatelessWidget {
  const SetTile({
    super.key,
    required this.set,
    required this.index,
    required this.onExerciseChanged,
    required this.onWeightChanged,
    required this.onRepChanged,
    required this.onRemoved,
  });

  final Set set;
  final int index;
  final ValueChanged<String?> onExerciseChanged;
  final ValueChanged<double?> onWeightChanged;
  final ValueChanged<int?> onRepChanged;
  final VoidCallback onRemoved;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 155,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leftPane(textTheme),
          SizedBox(
            width: 14,
          ),
          rightPane(textTheme),
        ],
      ),
    );
  }

  Widget rightPane(TextTheme textTheme) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            border: Border.all(color: appTheme.cardColor),
            borderRadius: BorderRadius.circular(16),
            color: appTheme.cardColor.withOpacity(0.4)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: appTheme.cardColor,
                          border: Border.all(color: appTheme.cardColor),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton<String>(
                        key: const Key('exercise-button'),
                        value: set.exercise,
                        onChanged: onExerciseChanged,
                        items: exercises
                            .map((String exercise) => DropdownMenuItem<String>(
                                  value: exercise,
                                  child: Text(exercise,
                                      style: textTheme.bodyLarge),
                                ))
                            .toList(),
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onRemoved,
                      child: Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: appTheme.cardColor,
                          border: Border.all(color: appTheme.cardColor),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton<double>(
                        value: set.weight,
                        onChanged: onWeightChanged,
                        items: weights
                            .map((double weight) => DropdownMenuItem<double>(
                                  value: weight,
                                  child: Text('${weight.toString()} kg',
                                      style: textTheme.bodyLarge),
                                ))
                            .toList(),
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: appTheme.cardColor,
                          border: Border.all(color: appTheme.cardColor),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton<int>(
                        value: set.repetitions,
                        onChanged: onRepChanged,
                        items: repetitions
                            .map((int reps) => DropdownMenuItem<int>(
                                  value: reps,
                                  child: Text('$reps reps',
                                      style: textTheme.bodyLarge),
                                ))
                            .toList(),
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget leftPane(TextTheme textTheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: appTheme.cardColor)),
          child: Text(
            '${index + 1}',
            style: textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: ColoredBox(
            color: appTheme.cardColor,
            child: SizedBox(
              width: 1,
            ),
          ),
        )
      ],
    );
  }
}
