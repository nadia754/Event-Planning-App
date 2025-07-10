import 'package:evently_app/assets/app_images.dart';
import 'package:evently_app/ui/tabs/home/event_item_widget.dart';
import 'package:evently_app/ui/tabs/home/event_tab_widget.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context)!;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> eventNames = [
      appLocalization.all,
      appLocalization.sport,
      appLocalization.birthday,
      appLocalization.meeting,
      appLocalization.gaming,
      appLocalization.workshop,
      appLocalization.bookclub,
      appLocalization.exhibition,
      appLocalization.holiday,
      appLocalization.eating,
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.1,
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(appLocalization.welcome_back, style: AppStyles.mediumWhite14),
            // return from data base
            Text(
              "User Name ",
              style: AppStyles.largeWhiteBold24,
            ),
            Row(
              children: [
                Image.asset(AppImages.unSelcLocIcon),
                Text(
                  appLocalization.cairo,
                  style: AppStyles.mediumWhite14,
                ),
                Text(
                  " , ",
                  style: TextStyle(color: AppColors.white),
                ),
                Text(
                  appLocalization.egypt,
                  style: AppStyles.mediumWhite14,
                ),
              ],
            )
          ],
        ),
        actions: [
          Icon(
            Icons.sunny,
            color: AppColors.white,
          ),
          SizedBox(
            width: width * 0.02,
          ),
          Container(
            height: height * 0.045,
            width: width * 0.099,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.white),
            child: Center(
              child: Text(
                "EN",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: width * 0.02,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: height * 0.008),
            height: height * 0.088,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)),
            ),
            child: DefaultTabController(
              length: eventNames.length,
              child: TabBar(
                tabAlignment: TabAlignment.start,
                labelPadding: EdgeInsets.zero,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                isScrollable: true,
                onTap: (value) {
                  selectIndex = value;
                  setState(() {});
                },
                tabs: eventNames.map((eventName) {
                  return EventNameWidget(
                      selectEvent: selectIndex == eventNames.indexOf(eventName),
                      eventName: eventName);
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: eventNames.length,
                itemBuilder: (BuildContext context, int intex) {
                  return EventItemWidget();
                }),
          )
        ],
      ),
    );
  }
}
