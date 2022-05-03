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
                    const Text(
                      'Description',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 8),
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
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Height',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '${widget.pokemon.height}',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.grey.shade900,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Category',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    widget.pokemon.category,
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.grey.shade900,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Abilities',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    widget.pokemon.abilities,
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.grey.shade900,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Weight',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${widget.pokemon.weight}',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.grey.shade900,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Gender',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Wrap(
                                    children: const [
                                      Icon(
                                        Icons.male,
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.female,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Weakness',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 4,
                          children: List.generate(
                            widget.pokemon.weakness.length,
                            (index) => TypeItemWidget(
                              text: widget.pokemon.weakness[index].name,
                              color: widget.pokemon.weakness[index].color,
                            ),
                          ),
                        ),
                      ],
                    )
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
