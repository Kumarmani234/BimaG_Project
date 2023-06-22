import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/insurance_appbar/views/insurance_appbar_view.dart';
import 'package:bima_g/app/routes/app_pages.dart';
import 'package:bima_g/app/widgets/star_rating.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/styles.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/containers.dart';
import '../../../widgets/textfields.dart';
import '../controllers/businesses_controller.dart';
import '../model/business_item_list_model.dart';
part 'business_list_view.dart';
part 'title_rating_view.dart';
part 'tabs/business_services_tab_view.dart';
part 'tabs/business_reviews_tab_view.dart';
part 'tabs/business_info_tab_view.dart';
part 'tabs/business_photos_tab_view.dart';
part 'business_bottom_buttons_view.dart';
part 'write_review_view.dart';

class BusinessesView extends GetView<BusinessesController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: AppColors.grey1,
          body: controller.obx((state) => Container(
                child: Stack(
                  children: [
                    NestedScrollView(
                      physics: BouncingScrollPhysics(),
                      headerSliverBuilder: (ctx, innerBoxIsScrolled) {
                        return <Widget>[
                          SliverAppBar(
                            expandedHeight: 296.h,
                            floating: false,
                            pinned: true,
                            elevation: 0.5,
                            backgroundColor: Colors.white,
                            stretch: true,
                            onStretchTrigger: () async {
                              return;
                            },
                            leading: InkWell(
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: AppColors.black,
                              ),
                              onTap: () => Navigator.pop(context),
                            ),
                            flexibleSpace: LayoutBuilder(
                                builder: (ctx, BoxConstraints constraints) {
                              //businessesController.sliverBackButtonColor.value = constraints.biggest.height != (MediaQuery.of(context).padding.top + kToolbarHeight) ? Colors.white : Colors.black;
                              return FlexibleSpaceBar(
                                stretchModes: [StretchMode.zoomBackground],
                                collapseMode: CollapseMode.parallax,
                                title: constraints.biggest.height !=
                                        (MediaQuery.of(context).padding.top +
                                            kToolbarHeight)
                                    ? null
                                    : Text(
                                        'Raj Girish Hospital',
                                        style: Ts.semiBold17(AppColors.black),
                                      ),
                                background: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Image.network(
                                          'https://picsum.photos/200/300',
                                          height: 220.h,
                                          fit: BoxFit.cover,
                                        ),
                                        TitleRatingView(),
                                      ],
                                    ),
                                    //logos
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 180.h, right: 15.w),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            CircleAvatar(
                                              radius: 35,
                                              backgroundImage: Image.network(
                                                      'https://picsum.photos/200/300')
                                                  .image,
                                            ),
                                            SvgPicture.asset(
                                              AssetPath.map_pin_hospital,
                                              width: 16.w,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                            actions: [],
                          ),
                          SliverPersistentHeader(
                              pinned: true,
                              delegate: SliverAppBarDelegates(
                                TabBar(
                                  indicatorColor: AppColors.primaryColor,
                                  dividerColor: AppColors.primaryColor,
                                  onTap: businessesController.onTabChange,
                                  tabs: [
                                    Tab(
                                        key:Key('info_key'),
                                        child: Text('Info')
                                    ),
                                    Tab(
                                      key:Key('services_key'),
                                      child: Text('Services'),
                                    ),
                                    Tab(
                                        key:Key('photos_key'),
                                        icon: Text('Photos')
                                    ),
                                    Tab(
                                        key:Key('reviews_key'),
                                        icon: Text('Reviews')
                                    ),
                                  ],
                                ),
                              ))
                        ];
                      },
                      body: Padding(
                        padding: EdgeInsets.only(bottom: 100.h),
                        child: TabBarView(
                          children: [
                            BusinessInfoTabView(),
                            BusinessServicesTabView(),
                            BusinessPhotosTabView(),
                            BusinessReviewsTabView()
                          ],
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: BusinessBottomButtonView())
                  ],
                ),
              )),
        ));
  }
}

class Dummy extends StatelessWidget {
  const Dummy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            //business image
            Stack(
              children: [
                //tabbars
                Container(
                  margin: EdgeInsets.only(top: 295.h),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [Styles.bottomLightShadow()]),
                  child: TabBar(
                    indicatorColor: AppColors.primaryColor,
                    dividerColor: AppColors.primaryColor,
                    onTap: businessesController.onTabChange,
                    tabs: [
                      Tab(
                          child: Text('Info')),
                      Tab(
                        child: Text('Services'),
                      ),
                      Tab(
                          icon: Text('Photos')),
                      Tab(
                          icon: Text('Reviews')),
                    ],
                  ),
                ),

                //image & title rating
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.network(
                      'https://picsum.photos/200/300',
                      height: 190.h,
                      fit: BoxFit.cover,
                    ),
                    TitleRatingView(),
                  ],
                ),

                //logos
                Padding(
                  padding: EdgeInsets.only(top: 150.h, right: 15.w),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              Image.network('https://picsum.photos/200/300')
                                  .image,
                        ),
                        SvgPicture.asset(
                          AssetPath.map_pin_hospital,
                          width: 16.w,
                        )
                      ],
                    ),
                  ),
                ),

                //back icon
                Padding(
                  padding: EdgeInsets.only(top: 30.h, left: 5.w),
                  child: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                      )),
                )
              ],
            ),

            //tabbar views
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 100.h),
                child: TabBarView(
                  children: [
                    BusinessInfoTabView(),
                    BusinessServicesTabView(),
                    BusinessPhotosTabView(),
                    BusinessReviewsTabView()
                  ],
                ),
              ),
            )
          ],
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: BusinessBottomButtonView())
      ],
    );
  }
}

class SliverAppBarDelegates extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegates(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new ClipRRect(
      //borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Container(color: AppColors.white, child: _tabBar),
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegates oldDelegate) {
    return false;
  }
}
