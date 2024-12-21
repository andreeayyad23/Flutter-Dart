import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/theme.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({
    super.key,
    required this.vocation,
    required this.isSelected,
    required this.onSelect,
  });

  final VocationType vocation;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    final vocationDetails = Vocation.vocations[vocation]!;

    return GestureDetector(
      onTap: () {
        // Print the selected vocation to the console
        print('Vocation selected: ${vocationDetails.title}');

        // Call the passed onSelect callback
        onSelect();
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isSelected ? AppTheme.primaryColor : Colors.transparent,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: isSelected
            ? AppTheme.primaryColor.withOpacity(0.2)
            : AppTheme.secodaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset(
                'assets/img/vocations/${vocationDetails.imageAsset}',
                width: 80,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 80,
                  );
                },
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vocationDetails.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isSelected
                            ? AppTheme.primaryColor
                            : AppTheme.textColor,
                      ),
                    ),
                    Text(
                      vocationDetails.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: isSelected
                            ? AppTheme.primaryColor
                            : AppTheme.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
