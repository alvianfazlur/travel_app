import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../shared/theme.dart';
import '../checkout_page_controller.dart';

class AddTraveller extends StatelessWidget {
  const AddTraveller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutPageController>(
      builder: (controller) => Container(
        margin: EdgeInsets.only(bottom: 15, right: 15),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    margin: EdgeInsets.only(right: 6, left: 15),
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/coupon_fill.png'))
                    ),
                  ),
                  Text("Entrance Ticket", style: blackTextStyle.copyWith(fontWeight: semiBold),),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  margin: EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/group_fill.png'))
                  ),
                ),
                Text("${controller.traveller} Person", style: greyTextStyle),
              ],
            )
          ],
        ),
      ),
    );
  }
}
