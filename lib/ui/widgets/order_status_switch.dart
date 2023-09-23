import 'package:flutter/material.dart';

class OrderStatusSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  const OrderStatusSwitch({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  State<OrderStatusSwitch> createState() => _OrderStatusSwitchState();
}

class _OrderStatusSwitchState extends State<OrderStatusSwitch>
    with SingleTickerProviderStateMixin {
  late bool _value;
  final double _thumbSize = 16;
  final Size _size = const Size(40, 16);

  late final AnimationController _animationController;

  late final Animation<Offset> _translateAnimation;
  late final Animation<Color?> _colorAnimation;

  @override
  void initState() {
    _value = widget.value;
    _initAnimations();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant OrderStatusSwitch oldWidget) {
    if (widget.value != oldWidget.value) {
      _value = widget.value;
      _refreshValueState();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragCancel: _onHorizontalDragCancel,
      onHorizontalDragEnd: (_) => _onHorizontalDragCancel(),
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onTap: () {
        _value = !_value;
        _refreshValueState();
        if (widget.onChanged != null) {
          widget.onChanged!(_value);
        }
      },
      child: SizedBox.fromSize(
        size: _size,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(color: Colors.transparent),
            Transform.translate(
              offset: _translateAnimation.value,
              child: Container(
                width: _thumbSize,
                height: _thumbSize,
                decoration: BoxDecoration(
                  color: _colorAnimation.value,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            IgnorePointer(
              ignoring: true,
              child: Container(
                width: 40,
                height: 3,
                decoration: BoxDecoration(
                  color: _colorAnimation.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _initAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      value: _value ? 1.0 : 0.0,
    )..addListener(() {
        setState(() {});
      });

    _translateAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset((_size.width - _thumbSize), 0.0),
    ).animate(_animationController);

    _colorAnimation = ColorTween(
      begin: const Color(0xffd9d9d9),
      end: const Color(0xff28ce61),
    ).animate(_animationController);
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final value = details.localPosition.dx / _size.width;
    _animationController.value = value.clamp(0.0, 1.0);
  }

  void _onHorizontalDragCancel() {
    _completeAnimation();
  }

  void _onHorizontalDragStart(DragStartDetails details) {}

  void _completeAnimation() {
    if (_animationController.value < 0.5) {
      _animationController.reverse().orCancel;
      _value = false;
    } else {
      _animationController.forward().orCancel;
      _value = true;
    }

    if (widget.onChanged != null) {
      widget.onChanged!(_value);
    }
  }

  void _refreshValueState() {
    if (_value) {
      _animationController.forward().orCancel;
    } else {
      _animationController.reverse().orCancel;
    }
  }
}
