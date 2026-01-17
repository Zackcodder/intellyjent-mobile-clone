import 'package:flutter/material.dart';

class PullToRefreshBanner extends StatefulWidget {
  @override
  _PullToRefreshBannerState createState() => _PullToRefreshBannerState();
}

class _PullToRefreshBannerState extends State<PullToRefreshBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _arrowAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _arrowAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Center(
        child: AnimatedBuilder(
          animation: _arrowAnimation,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: Offset(0, _arrowAnimation.value),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 32,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Pull down to refresh",
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
