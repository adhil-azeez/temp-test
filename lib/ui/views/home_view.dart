import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/order_status_switch.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppBar(
          toolbarHeight: 0,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        const _HeaderWidget(),
        const SizedBox(height: 48),
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            "History",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Color(0xff454545),
            ),
          ),
        ),
        const SizedBox(height: 22),
        const _HistoryCard()
      ],
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(
              left: 21,
              right: 14,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/svgs/user_call.svg',
                  width: 32,
                  height: 38,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 19),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Virág Mercédesz",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4B4B4B),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Al. Brucknera Aleksandra 63, Wrocław 51-410",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7F7D7D),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: DottedLine(
              dashColor: Color(0xFFDCDCDC),
              dashGapLength: 8,
              dashLength: 8,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "12 Jun 23",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF979797),
                ),
              ),
              const SizedBox(width: 21),
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 21),
              const Text(
                "12.5 Km",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF979797),
                ),
              ),
              const SizedBox(width: 40),
              SvgPicture.asset(
                "assets/svgs/unmark_icon.svg",
                width: 19,
                height: 13,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 8.8),
              const Text(
                "Unmarked",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF979797),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("View Order"),
            ),
          ),
          const SizedBox(height: 9),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatefulWidget {
  const _HeaderWidget();

  @override
  State<_HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<_HeaderWidget> {
  late bool _isActive;
  late String _orderStatus;
  late Color _orderStatusColor;

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 60),
          const Text(
            "COMPANY NAME",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 26,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          const Text(
            "Choose the perfect tagline",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 66),
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Order status",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 30),
                child: OrderStatusSwitch(
                  value: _isActive,
                  onChanged: (value) => _setOrderStatus(value),
                ),
              ),
              Expanded(
                child: Text(
                  _orderStatus,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: _orderStatusColor,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          const SizedBox(height: 35),
        ],
      ),
    );
  }

  void _init() {
    _setOrderStatus(true);
  }

  void _setOrderStatus(bool value) {
    _isActive = value;
    if (_isActive) {
      _orderStatus = "Opened";
      _orderStatusColor = const Color(0xff28CE61);
    } else {
      _orderStatus = "Closed";
      _orderStatusColor = const Color(0xffFF3838);
    }
    setState(() {});
  }
}
