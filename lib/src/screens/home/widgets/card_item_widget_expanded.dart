import 'package:estudosflutter/src/models/pokemon/pokemon.dart';
import 'package:estudosflutter/src/screens/home/widgets/type_item_widget.dart';
import 'package:flutter/material.dart';

class CardItemExpandedWidget extends StatefulWidget {
  final Pokemon pokemon;
  const CardItemExpandedWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<CardItemExpandedWidget> createState() => _CardItemExpandedWidgetState();
}

class _CardItemExpandedWidgetState extends State<CardItemExpandedWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.pokemon.color,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: widget.pokemon.color,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.chevron_left),
                    color: Colors.white,
                  ),
                  Text(
                    '${widget.pokemon.id.toString().padLeft(3, '0')} ${widget.pokemon.name}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 240,
              decoration: BoxDecoration(
                color: widget.pokemon.subcolor,
                image: DecorationImage(
                  image: NetworkImage(widget.pokemon.url),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.pokemon.maleDescription,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 4,
                      children: List.generate(
                        widget.pokemon.types.length,
                        (index) => TypeItemWidget(
                          text: widget.pokemon.types[index].name,
                          color: widget.pokemon.types[index].color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
