import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  // Define text color here
  Color textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Available points row
          Container(
            color: Colors.black,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icon with dynamic color based on points available
                Icon(
                  Icons.star,
                  color:
                      widget.character.points > 0 ? Colors.yellow : Colors.grey,
                ),
                const SizedBox(width: 20),
                const Text(
                  'Stat points available: ',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 20),
                // Stat points aligned to the right
                Text(
                  widget.character.points.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),

          // Stats table
          Table(
            border: TableBorder.all(
              color: Colors.white, // Table border color
              width: 1.0, // Border width
            ),
            children: widget.character.statsAsFormattedList.map((stat) {
              return TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text(stat['title'] ?? 'Unknown'), // Fallback for null
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(stat['value'] ?? 'N/A'), // Fallback for null
                    ),
                  ),

                  // Up arrow icon button
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(Icons.arrow_upward, color: textColor),
                        onPressed: () {
                          // Add logic for the upward arrow action here
                          setState(() {
                            widget.character.increaseStat(stat['title']!);
                            // Update logic for increasing the stat
                          });
                        },
                      ),
                    ),
                  ),

                  // Down arrow icon button
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(Icons.arrow_downward, color: textColor),
                        onPressed: () {
                          // Add logic for the downward arrow action here
                          setState(() {
                            widget.character.decreaseStat(stat['title']!);

                            // Update logic for decreasing the stat
                          });
                        },
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
