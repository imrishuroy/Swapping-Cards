import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:swapping_cards/data.dart';
import 'package:swapping_cards/profile_footer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatefulWidget {
  @override
  _ExampleHomePageState createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage>
    with TickerProviderStateMixin {
  CardController _cardController; //Use this to trigger swap.
  ScrollController _scrollController;

  List appData = [];
  bool _loading = false;

  getAppData() {
    setState(() {
      _loading = true;
    });
    data.forEach((element) {
      appData.add(element);
    });
    //print('App Data $appData');
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    getAppData();
    _cardController = CardController();
    _scrollController = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    _cardController.removeListener();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white54,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.person,
              color: Colors.amber,
              size: 33.0,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.home,
              size: 33.0,
              color: Colors.grey[500],
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.message,
              size: 33.0,
              color: Colors.grey[500],
            ),
          )
        ],
      ),
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          Icon(
            Icons.settings,
            color: Colors.grey[600],
          ),
          SizedBox(width: 20.0)
        ],
        leading: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Bumble',
          style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.w600,
            fontSize: 23.0,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              // height: MediaQuery.of(context).size.height * 0.6,
              height: MediaQuery.of(context).size.height * 0.9,
              child: TinderSwapCard(
                orientation: AmassOrientation.BOTTOM,
                totalNum: appData.length,
                stackNum: 3,
                swipeEdge: 1.0,
                animDuration: 130,
                maxWidth: MediaQuery.of(context).size.width * 1.03,
                maxHeight: MediaQuery.of(context).size.width * 7.0,
                minWidth: MediaQuery.of(context).size.width * 0.8,
                minHeight: MediaQuery.of(context).size.width * 0.8,
                cardBuilder: (context, index) => Card(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.82,
                              child: Image.asset(
                                '${appData[index]['image']}',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 12.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${appData[index]['name']}',
                                    style: TextStyle(
                                      color: Colors.grey[200],
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.8,
                                    ),
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.star_border,
                                        color: Colors.amber,
                                        size: 30.0,
                                      ),
                                      onPressed: () {})
                                ],
                              ),
                            ),
                          ],
                        ),
                        BuildProfileFooter(
                          about: appData[index]['about'],
                          extraImages: appData[index]['extraImages'],
                        ),
                      ],
                    ),
                  ),
                ),
                cardController: _cardController,
                swipeUpdateCallback:
                    (DragUpdateDetails details, Alignment align) {
                  /// Get swiping card's alignment
                  if (align.x < 0) {
                    //Card is Left swiping

                  } else if (align.x > 0) {
                    //Card is RIGHT swiping
                  }
                },
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  print(orientation);
                  _scrollController.jumpTo(0.0);
                  print(index);

                  if (index == appData.length) {}

                  // _scrollController.animateTo(0.0,
                  //     duration: Duration(milliseconds: 600), curve: Curves.linear);

                  /// Get orientation & index of swiped card!
                },
              ),
            ),
    );
  }
}
