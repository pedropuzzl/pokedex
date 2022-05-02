import 'package:estudosflutter/src/models/pokemon/pokemon.dart';
import 'package:estudosflutter/src/screens/home/widgets/type_item_widget.dart';
import 'package:flutter/material.dart';

class CardItemWidget extends StatefulWidget {
  final Pokemon pokemon;
  const CardItemWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<CardItemWidget> createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: isHover ? 0.91 : 0.9,
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 230, 230, 230),
              offset: isHover ? const Offset(2, 4) : const Offset(0, 0),
              spreadRadius: isHover ? 0 : 1,
              blurRadius: isHover ? 2 : 0,
            ),
          ],
          color: Colors.white,
        ),
        duration: const Duration(milliseconds: 200),
        child: IgnorePointer(
          ignoring: true,
          child: MouseRegion(
            onHover: (value) {
              setState(() {
                isHover = true;
              });
            },
            onExit: (value) {
              setState(() {
                isHover = false;
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(96, 230, 230, 230),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Image.network(
                      widget.pokemon.url,
                      width: 250,
                      height: 250,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Nº ${widget.pokemon.id.toString().padLeft(3, '0')}',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.pokemon.name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 2),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
