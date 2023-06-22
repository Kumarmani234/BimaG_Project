import 'package:bima_g/utility/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoDataFoundBimaG extends StatelessWidget {
  const NoDataFoundBimaG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset(AssetPath.no_data_found),);
  }
}
