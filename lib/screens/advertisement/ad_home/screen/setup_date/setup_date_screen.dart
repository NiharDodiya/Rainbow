// ignore_for_file: avoid_print, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/buttons.dart';
import 'package:rainbow/screens/advertisement/ad_home/screen/setup_date/setup_date_controller.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../common/Widget/text_styles.dart';
import '../../../../../utils/asset_res.dart';
import '../../../../../utils/color_res.dart';

class SetupDateScreen extends StatelessWidget {
  SetupDateScreen({Key? key}) : super(key: key);
  SetupDateController setupDateController = Get.put(SetupDateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorRes.color_50369C,
                ColorRes.color_50369C,
                ColorRes.color_D18EEE,
                ColorRes.color_D18EEE,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              appBar(),
              // top(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: bottom(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.03,
          ),
          Row(
            children: [
              SizedBox(
                width: Get.width * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  AssetRes.backIcon,
                  height: 16,
                  width: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: Get.width * 0.27,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  "Setup Date",
                  style: gilroyBoldTextStyle(),
                ),
              ),
              SizedBox(
                width: Get.width * 0.05,
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
        ],
      ),
    );
  }

  Widget bottom() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.0853),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Start and End Date",
                style: gilroySemiBoldTextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Container(
                width: Get.width,
                height: 308,
                decoration: const BoxDecoration(
                  color: ColorRes.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Expanded(
                  child: GetBuilder<SetupDateController>(
                    id: 'range',
                    builder: (controller) => TableCalendar(
                      calendarBuilders: CalendarBuilders(),
                      shouldFillViewport: true,
                      firstDay: DateTime(
                        2022,
                        DateTime.now().month,
                      ),
                      lastDay: DateTime(2050),
                      onFormatChanged: (CalendarFormat ca) {
                        CalendarFormat.month;
                      },
                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Month',
                        CalendarFormat.twoWeeks: '2 weeks',
                        CalendarFormat.week: 'Week'
                      },
                      focusedDay: DateTime.now(),
                      calendarStyle: CalendarStyle(
                        isTodayHighlighted: false,
                        rangeHighlightColor: ColorRes.color_F4F4F4,
                        todayTextStyle: gilroyBoldTextStyle(fontSize: 11.43),
                        weekendTextStyle: gilroyMediumTextStyle(
                            fontSize: 11.43, color: ColorRes.color_27354C),
                        outsideTextStyle: gilroyMediumTextStyle(
                          fontSize: 11.43,
                          color: ColorRes.color_27354C.withOpacity(0.4),
                        ),

                        defaultTextStyle: gilroyMediumTextStyle(
                            fontSize: 11.43, color: ColorRes.color_27354C),
                        rangeEndTextStyle:
                            const TextStyle(fontSize: 15, color: Colors.white),
                        disabledTextStyle: gilroyMediumTextStyle(
                          fontSize: 11.43,
                          color: ColorRes.color_27354C.withOpacity(0.4),
                        ),
                        selectedDecoration: BoxDecoration(
                          color: ColorRes.black,
                          border: Border.all(
                              color: ColorRes.color_FCE307, width: 1.46),
                        ),
                        // selectedTextStyle:
                        //     TextStyle(fontSize: 15, color: Colors.purple),

                        rangeEndDecoration: BoxDecoration(
                          color: ColorRes.color_50369C,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: ColorRes.color_FCE307, width: 1.5),
                        ),
                        rangeStartDecoration: BoxDecoration(
                          color: ColorRes.color_50369C,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: ColorRes.color_FCE307, width: 1.5),
                        ),
                        withinRangeTextStyle: gilroyMediumTextStyle(
                            fontSize: 11.43, color: ColorRes.color_27354C),
                      ),
                      rangeStartDay: controller.startTime,
                      onRangeSelected: (start, end, as) {
                        controller.rangSelect(start, end, as);
                        print(
                            "<<<<<<<<<<<<<<<<<<<<<<<<<<<<  starn<$start>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                        print(
                            "<<<<<<<<<<<<<<<<<<<<<<<<<<End <<<$end>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                        print(
                            "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<$as>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                      },
                      rangeEndDay: controller.endtime,
                      rangeSelectionMode: RangeSelectionMode.toggledOn,
                      headerStyle: HeaderStyle(
                        titleTextStyle: TextStyle(fontSize: 0),
                        leftChevronVisible: false,
                        rightChevronVisible: true,
                        rightChevronIcon: const Icon(
                          Icons.arrow_drop_down,
                          color: ColorRes.black,
                        ),
                        rightChevronPadding: const EdgeInsets.only(
                          right: 175,
                        ),
                        //// Moth Show
                        formatButtonVisible: true,
                        formatButtonTextStyle: gilroySemiBoldTextStyle(
                          fontSize: 11.94,
                          color: ColorRes.black,
                        ),
                        formatButtonShowsNext: false,
                        formatButtonDecoration: const BoxDecoration(),
                        titleCentered: true,
                        formatButtonPadding: EdgeInsets.only(left: 1),

                        // titleCentered: false,

                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),

                        // rightChevronIcon: Icon(
                        //   Icons.chevron_right,
                        //   size: 16,
                        //   color: Colors.pink,
                        // ),
                        // leftChevronIcon: Icon(
                        //   Icons.chevron_left,
                        //   size: 16,
                        //   color: Colors.blue,
                        // ),
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: gilroyBoldTextStyle(
                            fontSize: 11.43, color: ColorRes.color_50369C),
                      ),
                      weekendDays: [],
                      calendarFormat: CalendarFormat.month,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                    ),
                  ),
                ),
                // SfDateRangePicker(
                //   onSelectionChanged: _onSelectionChanged,
                //   selectionMode: DateRangePickerSelectionMode.range,
                //   initialSelectedRange: PickerDateRange(
                //       DateTime.now().subtract(const Duration(days: 4)),
                //       DateTime.now().add(const Duration(days: 3))),
                // ),
              ),
              const SizedBox(height: 19),
              Container(
                height: 191,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      ColorRes.color_50369C.withOpacity(0.5),
                      ColorRes.color_D18EEE.withOpacity(0.8),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        child: TextField(
                          controller: TextEditingController(),
                          style: gilroySemiBoldTextStyle(fontSize: 24),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            counterStyle: gilroySemiBoldTextStyle(fontSize: 24),
                            hintText: "\$00.00",
                            hintStyle: gilroySemiBoldTextStyle(fontSize: 24),
                          ),
                        ),
                        height: 30,
                        width: 120,
                      ),
                      // child: Text(
                      //   "\$00.00",
                      //   style: gilroySemiBoldTextStyle(fontSize: 24),
                      // ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 17),
                        Row(
                          children: [
                            SizedBox(width: Get.width * 0.085),
                            Text(
                              "Amount",
                              style: gilroyMediumTextStyle(fontSize: 18),
                            ),
                            const Spacer(),
                            Container(
                              decoration: const BoxDecoration(
                                color: ColorRes.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              height: 20,
                              width: 80,
                              child: Expanded(
                                child: GetBuilder<SetupDateController>(
                                  id: 'drop',
                                  builder: (controller) => DropdownButton(
                                    dropdownColor: ColorRes.white,
                                    hint: Center(
                                      child: Text(
                                        "caneda",
                                        style: gilroyMediumTextStyle(
                                            fontSize: 12,
                                            color: ColorRes.black),
                                      ),
                                    ),
                                    items: controller.list.map((String items) {
                                      return DropdownMenuItem(
                                        value: controller.list,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      controller.drop(newValue);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.0293,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SubmitButton(
                child: Text(
                  "Next",
                  style: gilroyBoldTextStyle(
                    fontSize: 16,
                    color: ColorRes.black,
                  ),
                ),
              ),
              const SizedBox(height: 60),
            ],
          )
        ],
      ),
    );
  }
}
