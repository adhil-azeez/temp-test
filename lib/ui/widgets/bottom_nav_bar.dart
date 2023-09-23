import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum BottomNavBarTypes {
  remote,
  history,
  account,
}

typedef OnBottomNavChanged = void Function(BottomNavBarTypes type);

class BottomNavBar extends StatefulWidget {
  final BottomNavBarTypes type;
  final OnBottomNavChanged? onChanged;

  const BottomNavBar({
    super.key,
    this.type = BottomNavBarTypes.account,
    this.onChanged,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late BottomNavBarTypes _selectedType;

  @override
  void initState() {
    _selectedType = widget.type;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BottomNavBar oldWidget) {
    if (oldWidget.type != widget.type) {
      _selectedType = widget.type;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xffBCBCBC).withOpacity(0.19),
            offset: const Offset(0.0, -1.0),
            blurRadius: 22,
            spreadRadius: 0,
          )
        ],
      ),
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 14, top: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ItemWidget(
            svgAsset: "assets/svgs/add_circle.svg",
            label: "Remote",
            isSelected: _selectedType == BottomNavBarTypes.remote,
            onTap: () => _setSelectedType(BottomNavBarTypes.remote),
          ),
          _ItemWidget(
            svgAsset: "assets/svgs/history.svg",
            label: "History",
            isSelected: _selectedType == BottomNavBarTypes.history,
            onTap: () => _setSelectedType(BottomNavBarTypes.history),
          ),
          _ItemWidget(
            svgAsset: "assets/svgs/smile.svg",
            label: "Account",
            isSelected: _selectedType == BottomNavBarTypes.account,
            onTap: () => _setSelectedType(BottomNavBarTypes.account),
          ),
        ],
      ),
    );
  }

  void _setSelectedType(BottomNavBarTypes type) {
    if (_selectedType == type) return;
    _selectedType = type;
    setState(() {});
    if (widget.onChanged != null) {
      widget.onChanged!(type);
    }
  }
}

class _ItemWidget extends StatelessWidget {
  final String label;
  final String svgAsset;
  final bool isSelected;
  final VoidCallback? onTap;
  const _ItemWidget({
    required this.label,
    required this.svgAsset,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color color =
        isSelected ? Theme.of(context).primaryColor : const Color(0xff8A8A8A);

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            svgAsset,
            width: 20,
            height: 20,
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
          const SizedBox(height: 7),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
