import 'package:flutter/material.dart';

import '../../constants/theme.dart';

class CheckBoxRow extends StatefulWidget {
  const CheckBoxRow({super.key});

  @override
  State<CheckBoxRow> createState() => _CheckBoxRowState();
}

class _CheckBoxRowState extends State<CheckBoxRow> {
  bool mpesaChecked = true;

  bool airtelChecked = false;

  bool telkomChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildCheckBox(
          label: 'Mpesa',
          value: mpesaChecked,
          onChanged: (value) {
            setState(() {
              mpesaChecked = value;
              telkomChecked = false;
              airtelChecked = false;
            });
          },
        ),
        _buildCheckBox(
          label: 'Airtel',
          value: airtelChecked,
          onChanged: (value) {
            setState(() {
              airtelChecked = value;
              telkomChecked = false;
              mpesaChecked = false;
            });
          },
        ),
        _buildCheckBox(
          label: 'Telkom',
          value: telkomChecked,
          onChanged: (value) {
            setState(() {
              telkomChecked = value;
              mpesaChecked = false;
              airtelChecked = false;
            });
          },
        ),
      ],
    );
  }

  Widget _buildCheckBox({
    required String label,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: value ? primaryColor : Colors.grey,
                width: value ? 3 : 1,
              ),
            ),
            child: null,
          ),
          const SizedBox(
            width: 13,
          ),
          Text(label),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}
