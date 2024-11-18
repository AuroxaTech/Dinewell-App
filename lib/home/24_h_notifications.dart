import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/models/notifications_model.dart';
import 'package:dinewell/services/api_manager.dart';
import 'package:flutter/material.dart';

class HomeNotificationScreen extends StatefulWidget {
  const HomeNotificationScreen({super.key});

  @override
  State<HomeNotificationScreen> createState() => _HomeNotificationScreenState();
}

class _HomeNotificationScreenState extends State<HomeNotificationScreen> {

  List<NotificationsData> notificationsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*loadData();*/
    apiGetAllNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                ConstanceData.h29,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            ConstanceData.h20,
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Notifications",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                        Text(
                          "Clear All",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(

              itemCount: notificationsList.length,
              itemBuilder: (context, index) {
                var notificationsObj = notificationsList[index];
                return notificationsObj.isRead == 0?
                InkWell(
                  onTap: (){
                    apiReadNotification(notificationsObj.id.toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child:  Container(
                      width: double.infinity,

                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.isLightTheme
                                ? Color.fromARGB(255, 231, 231, 231)
                                : Colors.transparent,
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 0.0),
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${notificationsObj.title}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Spacer(),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: CircleAvatar(
                                    radius: 3,
                                    backgroundColor:
                                    Theme.of(context).primaryColor,
                                  ),
                                ),

                                Text(
                                  notificationsObj.createdAt != null ?"${formatDateTime(DateTime.parse(notificationsObj.createdAt ?? ""))}" :"",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                    fontSize: 10,
                                    color: HexColor("#979DA3"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "${notificationsObj.message}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                  fontSize: 8,
                                  color: HexColor("#979DA3"),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ),
                  ),
                ):
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child:  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.isLightTheme
                              ? Color.fromARGB(255, 231, 231, 231)
                              : Colors.transparent,
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${notificationsObj.title}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Spacer(),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor:
                                  Theme.of(context).dividerColor,
                                ),
                              ),

                              Text(
                                  notificationsObj.createdAt != null ?"${formatDateTime(DateTime.parse(notificationsObj.createdAt ?? ""))}" :"",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                  fontSize: 10,
                                  color: HexColor("#979DA3"),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "${notificationsObj.message}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                fontSize: 8,
                                color: HexColor("#979DA3"),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ),
                );
              },
              padding: EdgeInsets.only(
                  left: 18,
                  right: 18,
                  bottom: MediaQuery.of(context).padding.bottom + 16),

            ),
          )
        ],
      ),
    );
  }

  apiGetAllNotifications() async {
    notificationsList.clear();
    await ApiManager().getAllNotifications().then((value) {
      notificationsList = value ?? [];
      setState(() {});
    });
  }

  apiReadNotification(String notId) async {
    await ApiManager().apiReadNotification(notificationId: notId).then((value) {
      if(value == true){
        apiGetAllNotifications();
      }
      setState(() {});
    });
  }

/*  Future<String> loadData() async {
    var data = await rootBundle.loadString("assets/icon/notifications.json");
    setState(() {
      final extractedData = json.decode(data);
      var notificationData = NotificationsModel.fromJson(extractedData);
      notificationsList = notificationData.data!;
      print("notifications list data : ${extractedData}");
    });
    return "success";
  }*/
  
  String formatDateTime(DateTime dateTime) {
    Duration difference = DateTime.now().difference(dateTime);
    if (difference.inDays > 0) {
      return "${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago";
    } else {
      return 'Just now';
    }
  }
}
