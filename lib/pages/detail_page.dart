import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_partner/cubit/app_cubit_state.dart';
import 'package:travel_partner/cubit/app_cubits.dart';
import 'package:travel_partner/misc/colors.dart';
import 'package:travel_partner/widget/app_button.dart';
import 'package:travel_partner/widget/app_large_text.dart';
import 'package:travel_partner/widget/app_text.dart';
import 'package:travel_partner/widget/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottonStar = 3;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return (Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "http://mark.bslmeiyu.com/uploads/" +
                                  detail.place.img),
                          fit: BoxFit.cover)),
                )),
            Positioned(
                left: 20,
                top: 70,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                    ),
                  ],
                )),
            Positioned(
                top: 300,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: detail.place.name,
                            color: Colors.black54,
                          ),
                          AppLargeText(
                            text: "\$ ${detail.place.price}",
                            color: AppColors.mainColor.withOpacity(0.8),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          AppText(
                            text: "${detail.place.location}",
                            color: AppColors.textColor1,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: (index + 1 > detail.place.stars)
                                    ? AppColors.textColor2
                                    : AppColors.starColor,
                              );
                            }),
                          ),
                          AppText(
                            text: "(${detail.place.stars}.0)",
                            color: AppColors.textColor2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      AppLargeText(
                        text: "People",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      AppText(
                        text: "Number of people in your group",
                        color: AppColors.mainTextColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButton(
                                size: 55,
                                backgroundColor: (selectedIndex == index)
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                color: (selectedIndex == index)
                                    ? Colors.white
                                    : Colors.black,
                                borderColor: (selectedIndex == index)
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      AppLargeText(
                        text: "Description",
                        size: 22,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      AppText(
                        text: "${detail.place.description}",
                        size: 18,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )),
            Positioned(
                bottom: 10,
                left: 20,
                right: 20,
                child: Container(
                  //margin: const EdgeInsets.only(right: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppButton(
                            color: AppColors.mainColor,
                            backgroundColor: Colors.white,
                            borderColor: AppColors.mainColor,
                            size: 60,
                            isIcon: true,
                            icon: (Icons.favorite_border_outlined)),
                        SizedBox(
                          width: 20,
                        ),
                        ResponsiveButton(
                          width: 260,
                          isResponsive: true,
                          text: "Book Trip Now",
                        )
                      ]),
                ))
          ],
        ),
      ));
    }));
  }
}
