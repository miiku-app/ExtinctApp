import 'package:flutter/material.dart';

class PageView_indication extends StatefulWidget {
  final PageController controller;
  final int pageViewLength;

  const PageView_indication(
      {super.key, required this.controller, required this.pageViewLength});

  @override
  State<PageView_indication> createState() => _PageView_indicationState();
}

class _PageView_indicationState extends State<PageView_indication> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onPageChange);
  }

  void _onPageChange() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onPageChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.pageViewLength,
        (i) => _PageViewIndicationItem(
          index: i,
          currentPageIndex: widget.controller.page?.round() ?? 0,
        ),
      ),
    );
  }
}

class _PageViewIndicationItem extends StatelessWidget {
  const _PageViewIndicationItem({
    required this.index,
    required this.currentPageIndex,
  });

  final int index;
  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    if (index == currentPageIndex) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        width: 32,
        height: 16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
    );
  }
}
