import 'package:flutter/material.dart';

class BuildProfileFooter extends StatelessWidget {
  final List extraImages;
  final String about;

  const BuildProfileFooter(
      {Key key, @required this.extraImages, @required this.about})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemCount = extraImages.length;
    return Container(
      width: double.infinity,
      color: Color(0xfffefecc),
      //height: 500.0,
      child: itemCount > 0 || itemCount != null
          ? Container(
              //  color: Color(0xfffefecc),
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20.0),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About Me',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 18.0,
                                letterSpacing: 1.2,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              about,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Column(
                        children: extraImages
                            .map(
                              (image) => Container(
                                width: double.infinity,
                                color: Colors.white,
                                child: Image.network(image),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}
