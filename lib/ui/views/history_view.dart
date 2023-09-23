import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/enums/order.dart';
import 'package:flutter_svg/svg.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBar(
            toolbarHeight: 0,
            backgroundColor: Colors.white,
          ),
          Container(
            color: Colors.white,
            child: const TabBar(
              isScrollable: true,
              dividerColor: Colors.transparent,
              unselectedLabelColor: Color(0xff7a7a7a),
              labelStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
              padding: EdgeInsets.only(left: 42),
              tabs: [
                Tab(text: "Active Orders"),
                Tab(text: "Past Orders"),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Expanded(
            child: TabBarView(
              children: [
                _ActiveOrderView(),
                Center(
                  child: Text("Past Orders"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActiveOrderView extends StatelessWidget {
  const _ActiveOrderView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: _ItemWidget(
          status:
              index % 2 == 0 ? OrderSatuses.completed : OrderSatuses.inProgress,
        ),
      ),
      itemCount: 2,
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final OrderSatuses status;
  const _ItemWidget({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color tickColor;

    switch (status) {
      case OrderSatuses.completed:
        tickColor = const Color(0xff5EC455);
        break;
      case OrderSatuses.inProgress:
        tickColor = const Color(0xffDBDBDB);
        break;
    }
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 27),
          Padding(
            padding: const EdgeInsets.only(left: 42),
            child: Row(
              children: [
                const Flexible(
                  child: Text(
                    "Order id # 602452369",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff171717),
                    ),
                  ),
                ),
                const SizedBox(width: 13),
                SvgPicture.asset(
                  "assets/svgs/tick_filled.svg",
                  width: 14.3,
                  height: 14.3,
                  colorFilter: ColorFilter.mode(tickColor, BlendMode.srcIn),
                  fit: BoxFit.contain,
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 42),
            child: Text(
              "Order delivered on 21 Aug 2022, 12:52 PM by ABC",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff7f7d7d),
              ),
            ),
          ),
          const SizedBox(height: 27),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: DottedLine(
              dashColor: Color(0xFFDCDCDC),
              dashGapLength: 8,
              dashLength: 8,
            ),
          ),
          const SizedBox(height: 17),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 46),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "kenzi.lawson@example.com",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff5733A5),
                  ),
                ),
                Text(
                  "₹330",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff454545),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
