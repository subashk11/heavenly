import 'package:flutter/material.dart';
import 'package:heavenly/models/hotel_model.dart';
import 'package:heavenly/models/hotel_model.dart';

class hotelCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Destination',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  letterSpacing: 1.5),
            ),
            GestureDetector(
              onTap: () {
                print("working");
              },
              child: Text(
                'See All',
                style: TextStyle(
                    fontSize: 16.0, color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          height: 280.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = hotels[index];
              return Container(
                width: 250.0,
                margin: EdgeInsets.all(10.0),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 140.0),
                      child: Container(
                        height: 120.0,
                        width: 250.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hotel.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                                fontSize: 22.0,
                              ),
                            ),
                            SizedBox(height: 3.0),
                            Text(
                              hotel.address,
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 3.0),
                            Text(
                              '\$ ${hotel.price}/per night',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 6.0,
                              offset: Offset(0.0, 2.0),
                            ),
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          height: 180.0,
                          width: 230.0,
                          image: AssetImage(hotel.imageUrl),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
