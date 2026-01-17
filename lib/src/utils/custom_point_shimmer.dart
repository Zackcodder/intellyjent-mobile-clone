import 'package:fade_shimmer/fade_shimmer.dart';

import '../core/core.dart';



class PointsFadeShimmer extends StatelessWidget {
  final double screenHeight;

  const PointsFadeShimmer({super.key, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Align(
              alignment: const Alignment(0, 0),
              child: InfoCard().infoCard(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Points shimmer
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeShimmer(
                    height: 10,
                    width: 60,
                    radius: 4,
                    fadeTheme: FadeTheme.light,
                  ),
                  SizedBox(height: 8),
                  FadeShimmer(
                    height: 18,
                    width: 40,
                    radius: 4,
                    fadeTheme: FadeTheme.light,
                  ),
                ],
              ),
              // Divider shimmer
              Container(
                width: 1,
                height: screenHeight * 0.1,
                color: Colors.grey[300],
              ),
              // Sillver shimmer
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeShimmer(
                    height: 10,
                    width: 60,
                    radius: 4,
                    fadeTheme: FadeTheme.light,
                  ),
                  SizedBox(height: 8),
                  FadeShimmer(
                    height: 18,
                    width: 40,
                    radius: 4,
                    fadeTheme: FadeTheme.light,
                  ),
                ],
              ),
              // Divider shimmer
              Container(
                width: 1,
                height: screenHeight * 0.1,
                color: Colors.grey[300],
              ),
              // Position shimmer
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeShimmer(
                    height: 10,
                    width: 60,
                    radius: 4,
                    fadeTheme: FadeTheme.light,
                  ),
                  SizedBox(height: 8),
                  FadeShimmer(
                    height: 18,
                    width: 40,
                    radius: 4,
                    fadeTheme: FadeTheme.light,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
