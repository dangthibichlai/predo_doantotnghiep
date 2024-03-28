import 'package:flutter/material.dart';
import 'package:test_intern/core/hepler/size-app.dart';

class GrantPermissionBanner extends StatelessWidget {
  const GrantPermissionBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Padding(
        padding: SizeApp.setEdgeInsetsOnly(bottom: SizeApp.setSize(percent: .05)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                Transform.scale(
                  scale: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ShaderMask(
                        shaderCallback: (rect) {
                          return RadialGradient(
                            colors: [Colors.white, Colors.white.withOpacity(0.05)],
                            stops: const [0.4, 1],
                          ).createShader(rect);
                        },
                        child: Container(
                          width: SizeApp.setSize(percent: .3),
                          height: SizeApp.setSize(percent: .3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                const Color(0xFFFF9900).withOpacity(.2),
                                const Color(0xFFFFEFDD).withOpacity(.2)
                                // const Color(0xffEE53EE).withOpacity(.2),
                                // const Color(0xffEE53EE).withOpacity(.15),
                              ],
                              stops: const [0.6, 1],
                              focalRadius: .2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     IZIImage(
                //       ImagesPath.grantPermissionImgBanner,
                //       width: SizeApp.setSizeWithWidth(percent: .6),
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
