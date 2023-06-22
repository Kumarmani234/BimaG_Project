part of '../businesses_view.dart';

class BusinessPhotosTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          axisDirection: AxisDirection.down,
          children: [
            for (int i = 0; i < businessesController.listPhotos.length; i++)
              InkWell(
                onTap: () {
                  businessesController.showBusinessFullPhotosDialog(context, i);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: businessesController.listPhotos[i],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
