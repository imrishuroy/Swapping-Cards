import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

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
  List<String> welcomeImages = [
    'assets/pic-1.jpeg',
    'assets/pic-2.jpeg',
    'assets/pic-3.jpeg',
    'assets/pic-4.jpeg',
    'assets/pic-5.jpeg',
  ];
  CardController _cardController; //Use this to trigger swap.
  ScrollController _scrollController;

  @override
  void initState() {
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
    return new Scaffold(
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
      body: Container(
        // height: MediaQuery.of(context).size.height * 0.6,
        height: MediaQuery.of(context).size.height * 0.9,
        child: TinderSwapCard(
          // swipeUp: true,
          // swipeDown: true,
          orientation: AmassOrientation.BOTTOM,
          totalNum: welcomeImages.length,
          stackNum: 3,
          swipeEdge: 2.0,
          animDuration: 130,

          //animDuration: 1,
          maxWidth: MediaQuery.of(context).size.width * 1.03,
          maxHeight: MediaQuery.of(context).size.width * 7.0,
          minWidth: MediaQuery.of(context).size.width * 0.8,
          minHeight: MediaQuery.of(context).size.width * 0.8,
          // maxWidth: MediaQuery.of(context).size.width * 0.9,
          // maxHeight: MediaQuery.of(context).size.width * 0.9,
          // minWidth: MediaQuery.of(context).size.width * 0.8,
          // minHeight: MediaQuery.of(context).size.width * 0.8,
          cardBuilder: (context, index) => Card(
            child: SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              //reverse: reverse,
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    // height: 700,
                    height: MediaQuery.of(context).size.height * 0.82,
                    child: Image.asset(
                      '${welcomeImages[index]}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    //margin: EdgeInsets.symmetric(horizontal: 17.0),
                    color: Color(0xfffefecc),
                    height: 500.0,
                  ),
                ],
              ),
            ),
          ),
          cardController: _cardController,
          swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
            /// Get swiping card's alignment
            if (align.x < 0) {
              //_scrollController.initialScrollOffset;
              // controller.triggerUp();
              // controller.triggerDown();
              //Card is LEFT swiping
            } else if (align.x > 0) {
              //  _scrollController.initialScrollOffset;
              //controller.triggerUp();
              // controller.triggerDown();
              //Card is RIGHT swiping
            }
          },
          swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
            // controller.removeListener();
            print(orientation);
            _scrollController.jumpTo(0.0);
            // _scrollController.createScrollPosition(physics, context, oldPosition)

            // _scrollController.animateTo(0.0,
            //     duration: Duration(milliseconds: 600), curve: Curves.linear);

            /// Get orientation & index of swiped card!
          },
        ),
      ),
      // Container(
      //   margin: EdgeInsets.symmetric(horizontal: 17.0),
      //   color: Colors.red,
      //   height: 300.0,
      // )
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_tindercard/flutter_tindercard.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ExampleHomePage(),
//     );
//   }
// }

// class ExampleHomePage extends StatefulWidget {
//   @override
//   _ExampleHomePageState createState() => _ExampleHomePageState();
// }

// class _ExampleHomePageState extends State<ExampleHomePage>
//     with TickerProviderStateMixin {
//   List<String> welcomeImages = [
//     'assets/pic-1.jpeg',
//     'assets/pic-2.jpeg',
//     'assets/pic-3.jpeg',
//     'assets/pic-4.jpeg',
//     'assets/pic-5.jpeg',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     CardController controller; //Use this to trigger swap.

//     return new Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         items: [
//           BottomNavigationBarItem(
//             label: '',
//             icon: Icon(
//               Icons.person,
//               color: Colors.amber,
//               size: 33.0,
//             ),
//           ),
//           BottomNavigationBarItem(
//             label: '',
//             icon: Icon(
//               Icons.home,
//               size: 33.0,
//               color: Colors.grey[500],
//             ),
//           ),
//           BottomNavigationBarItem(
//               label: '',
//               icon: Icon(
//                 Icons.message,
//                 size: 33.0,
//                 color: Colors.grey[500],
//               ))
//         ],
//       ),
//       appBar: AppBar(
//         actions: [
//           Icon(
//             Icons.settings,
//             color: Colors.grey[600],
//           ),
//           SizedBox(width: 20.0)
//         ],
//         leading: Icon(
//           Icons.favorite,
//           color: Colors.red,
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         title: Text(
//           'Bumble',
//           style: TextStyle(
//             color: Colors.amber,
//             fontWeight: FontWeight.w600,
//             fontSize: 23.0,
//             letterSpacing: 1.2,
//           ),
//         ),
//       ),
//       body: Container(
//         // height: MediaQuery.of(context).size.height * 0.6,
//         height: MediaQuery.of(context).size.height * 0.9,
//         child: TinderSwapCard(
//           swipeUp: true,
//           swipeDown: true,
//           orientation: AmassOrientation.BOTTOM,
//           totalNum: welcomeImages.length,
//           stackNum: 3,
//           swipeEdge: 2.0,
//           animDuration: 130,

//           //animDuration: 1,
//           maxWidth: MediaQuery.of(context).size.width * 1.03,
//           maxHeight: MediaQuery.of(context).size.width * 7.0,
//           minWidth: MediaQuery.of(context).size.width * 0.8,
//           minHeight: MediaQuery.of(context).size.width * 0.8,
//           // maxWidth: MediaQuery.of(context).size.width * 0.9,
//           // maxHeight: MediaQuery.of(context).size.width * 0.9,
//           // minWidth: MediaQuery.of(context).size.width * 0.8,
//           // minHeight: MediaQuery.of(context).size.width * 0.8,
//           cardBuilder: (context, index) => Card(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Container(
//                     // height: 700,
//                     height: MediaQuery.of(context).size.height * 0.82,
//                     child: Image.asset(
//                       '${welcomeImages[index]}',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Container(
//                     width: double.infinity,
//                     //margin: EdgeInsets.symmetric(horizontal: 17.0),
//                     color: Color(0xfffefecc),
//                     height: 500.0,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           cardController: controller = CardController(),
//           swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
//             /// Get swiping card's alignment
//             if (align.x < 0) {
//               //Card is LEFT swiping
//             } else if (align.x > 0) {
//               //Card is RIGHT swiping
//             }
//           },
//           swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
//             /// Get orientation & index of swiped card!
//           },
//         ),
//       ),
//       // Container(
//       //   margin: EdgeInsets.symmetric(horizontal: 17.0),
//       //   color: Colors.red,
//       //   height: 300.0,
//       // )
//     );
//   }
// }
