import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nanny_vanny/controller.dart';

class HomePage extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0, top: 10),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Color(0xFFE36DA6),
                  size: 30,
                ),
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
            )
          ],
        ),

        // drawerEnableOpenDragGesture: false,
        drawer: Drawer(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0,bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/2.png"),
                      radius: 40,
                    ),
                    Text(
                      "Emily Cyrus",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFFE36DA6)),
                    ),
                  ],
                ),
              ),
              returnTitleMenu("Home"),
              returnTitleMenu("Book A Nanny"),
              returnTitleMenu("How It Works"),
              returnTitleMenu("Why Nanny Vanny"),
              returnTitleMenu("My Bookings"),
              returnTitleMenu("My Profile"),
              returnTitleMenu("Support"),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "home",
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit),
                label: "Packages",
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time_outlined),
              label: "Bokkings",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: "Profile",
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          selectedItemColor: Colors.pink[200],
          unselectedFontSize: 10.5,
          selectedFontSize: 10.5,
          unselectedItemColor: Colors.black87,
        ),
        body: controller.obx(
            (state) => Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/2.png"),
                            radius: 30,
                          ),
                          title: Text(
                            "Welcome",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          subtitle: Text(
                            "Emily Cyrus",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFFE36DA6)),
                          ),
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0, right: 20, top: 35, bottom: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5B5CF),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                padding: EdgeInsets.all(10),
                                height: 170,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 30),
                                            child: Text(
                                              "Nanny And Babysitting Services",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF262F71)),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Book Now"),
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(1),
                                            minimumSize: Size(75, 25),
                                            primary: Color(0xFF262F71),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              height: 250,
                              top: -11,
                              left: 0,
                              child: Image.asset(
                                'assets/images/1.png',
                                width: 350.0,
                                height: 250.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Your Current Booking",
                            style: TextStyle(
                                color: const Color(0xFF262F71),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Card(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                              child: Text(
                                            controller.data["current_bookings"]
                                                ["package_label"],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFF5B5CF)),
                                          )),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Text("Start"),
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.all(1),
                                                minimumSize: Size(75, 25),
                                                primary: Color(0xFFE36DA6),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                )),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "From",
                                                style: TextStyle(
                                                    color: Color(0xFF5C5C5C)),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.date_range,
                                                    size: 12,
                                                    color: Color(0xFFF5B5CF),
                                                  ),
                                                  Text(
                                                    controller.data[
                                                            "current_bookings"]
                                                        ["from_date"],
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF5C5C5C),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.access_time_outlined,
                                                    size: 12,
                                                    color: Color(0xFFF5B5CF),
                                                  ),
                                                  Text(
                                                    controller.data[
                                                            "current_bookings"]
                                                        ["from_time"],
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF5C5C5C),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )),
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("To",
                                                  style: TextStyle(
                                                      color:
                                                          Color(0xFF5C5C5C))),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.date_range,
                                                    size: 12,
                                                    color: Color(0xFFF5B5CF),
                                                  ),
                                                  Text(
                                                    controller.data[
                                                            "current_bookings"]
                                                        ["to_date"],
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF5C5C5C),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.access_time_outlined,
                                                    size: 12,
                                                    color: Color(0xFFF5B5CF),
                                                  ),
                                                  Text(
                                                    controller.data[
                                                            "current_bookings"]
                                                        ["to_time"],
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF5C5C5C),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.star_border,
                                                  size: 12,
                                                ),
                                                Text("Rate Us"),
                                              ],
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.all(1),
                                                minimumSize: Size(75, 25),
                                                primary: Color(0xFF262F71),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                )),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  size: 12,
                                                ),
                                                Text("Geolocation"),
                                              ],
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.all(1),
                                                minimumSize: Size(90, 25),
                                                primary: Color(0xFF262F71),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                )),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.offline_bolt_outlined,
                                                  size: 12,
                                                ),
                                                Text("Survillence"),
                                              ],
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.all(1),
                                                minimumSize: Size(90, 25),
                                                primary: Color(0xFF262F71),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                )),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Packages",
                            style: TextStyle(
                                color: const Color(0xFF262F71),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ...controller.data["packages"].asMap().entries.map(
                              (e) => Container(
                                padding: EdgeInsets.only(
                                    left: 15.0, right: 15.0, top: 10),
                                child: Card(
                                  color: int.tryParse(e.key.toString())!.isEven
                                      ? Color(0xFFF0B3CD)
                                      : Color(0xFF80ABDB),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.calendar_today_outlined,
                                                  size: 30,
                                                  color: int.tryParse(
                                                              e.key.toString())!
                                                          .isEven
                                                      ? Color(0xFFD84D90)
                                                      : Colors.white,
                                                ),
                                                // Color(0xFFD84D90),
                                                ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text("Book Now"),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.all(1),
                                                    minimumSize: Size(75, 25),
                                                    primary: int.tryParse(e.key
                                                                .toString())!
                                                            .isEven
                                                        ? Color(0xFFE36DA6)
                                                        : Color(0xFF0098D0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    e.value["package_name"],
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFF262F71),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  // Color(0xFFD84D90),
                                                  Text(
                                                    "\u{20B9} " +
                                                        e.value["price"]
                                                            .toString(),
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFF262F71),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              child: Text(
                                                e.value["description"]
                                                    .toString(),
                                                maxLines: 2,
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFF262F71),
                                                    fontSize: 8,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                      ],
                    ),
                  ),
                ),
            onLoading: Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )),
      ),
    );
  }

  Widget returnTitleMenu(
    String text,
  ) {
    return ListTile(
      title: Container(
        padding: EdgeInsets.only(left: 10, bottom: 15),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xFFF5B5CF)))),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFF262F71)),
        ),
      ),
    );
  }
}
