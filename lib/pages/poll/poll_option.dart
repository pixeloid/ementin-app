import 'package:flutter/material.dart';

class PollOption<T> extends StatelessWidget {
  final String value;
  final bool selected;
  final String label;
  final String text;
  final Function()? onChanged;

  const PollOption({
    Key? key,
    required this.value,
    required this.selected,
    required this.label,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  Widget _buildLabel() {
    return Container(
      width: 30,
      height: 30,
      decoration: ShapeDecoration(
        shape: const CircleBorder(
          side: BorderSide(
            color: Colors.black,
          ),
        ),
        color: selected ? Colors.cyan : Colors.white,
      ),
      child: Center(
        child: Text(
          value.toString(),
          style: TextStyle(
            color: selected ? Colors.white : Colors.cyan,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 24),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onChanged,
        splashColor: Colors.cyan.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              _buildLabel(),
              const SizedBox(width: 10),
              _buildText(),
            ],
          ),
        ),
      ),
    );
  }
}
