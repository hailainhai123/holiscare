import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/modules/home/widget/utils_calendar.dart';
import 'package:holiscare/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:holiscare/widget_custom/app_bar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../constant/routes.dart';
import '../../../model/health_request.dart';
import '../../../utils/global_controller.dart';
import '../../data/data_controller.dart';

class MedicalHistory extends StatefulWidget {
  @override
  _MedicalHistoryState createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  final GlobalController globalController = Get.find();
  final DataController controller = Get.find();

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  Map<String, List> mySelectedEvents = {};

  final titleController = TextEditingController();
  final descpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    loadPreviousEvents();
  }

  loadPreviousEvents() {
    mySelectedEvents = {
      // "2023-02-13": [
      //   {"eventDescp": "11", "eventTitle": "111"},
      //   {"eventDescp": "22", "eventTitle": "22"}
      // ],
      // "2023-02-25": [
      //   {"eventDescp": "22", "eventTitle": "22"}
      // ],
      // "2023-02-20": [
      //   {"eventTitle": "ss", "eventDescp": "ss"}
      // ]
    };
  }

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Sự kiện mới',
          textAlign: TextAlign.center,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTextField(controller: titleController, hint: 'Tiêu đề'),
            const SizedBox(
              height: 20.0,
            ),
            buildTextField(controller: descpController, hint: 'Nội dung'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Huỷ'),
          ),
          TextButton(
            child: const Text('Thêm'),
            onPressed: () {
              if (titleController.text.isEmpty &&
                  descpController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Required title and description'),
                    duration: Duration(seconds: 2),
                  ),
                );
                //Navigator.pop(context);
                return;
              } else {
                print(titleController.text);
                print(descpController.text);

                setState(() {
                  if (mySelectedEvents[
                          DateFormat('yyyy-MM-dd').format(_selectedDay!)] !=
                      null) {
                    mySelectedEvents[
                            DateFormat('yyyy-MM-dd').format(_selectedDay!)]
                        ?.add({
                      "eventTitle": titleController.text,
                      "eventDescp": descpController.text,
                    });
                  } else {
                    mySelectedEvents[
                        DateFormat('yyyy-MM-dd').format(_selectedDay!)] = [
                      {
                        "eventTitle": titleController.text,
                        "eventDescp": descpController.text,
                      }
                    ];
                  }
                });
                print(
                    "New Event for backend developer ${json.encode(mySelectedEvents)}");
                titleController.clear();
                descpController.clear();
                Navigator.pop(context);
                return;
              }
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Lịch sử yêu cầu đi y tế',
        isBack: true,
        backgroundColor: globalController.colorBackground.value,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        color: globalController.colorBackground.value,
        padding: const EdgeInsets.all(16),
        child: controller.listRequest.isNotEmpty
            ? ListView.separated(
                itemCount: controller.listRequest.length,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 8),
                separatorBuilder: (_, index) {
                  return const Divider(
                    color: AppColors.lightSilver,
                  );
                },
                itemBuilder: (context, index) {
                  var request = controller.listRequest.value[index];
                  return InkWell(
                    onTap: () {},
                    child: itemRequest(request),
                  );
                },
              )
            : Text('Không có yêu cầu của học sinh nào.'),
      ),
      floatingActionButton: globalController.isTeacher.value ? null : FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(kDetailRequest);
        },
        label: const Text('Thêm yêu cầu'),
      ),
    );
  }

  headerStyle() {
    return HeaderStyle(
      titleTextStyle: const TextStyle(color: AppColors.black, fontSize: 20.0),
      decoration: BoxDecoration(
          color: globalController.colorBackground500.value,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      formatButtonTextStyle:
          const TextStyle(color: AppColors.black, fontSize: 16.0),
      formatButtonDecoration: const BoxDecoration(
        color: AppColors.error50,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      leftChevronIcon: const Icon(
        Icons.chevron_left,
        color: AppColors.black,
        size: 28,
      ),
      rightChevronIcon: const Icon(
        Icons.chevron_right,
        color: AppColors.black,
        size: 28,
      ),
    );
  }

  Widget buildTextField(
      {String? hint, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: hint ?? '',
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error50, width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error50, width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
    );
  }

  Widget itemRequest(HealthRequestModel student) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('HS ${student.name!.toUpperCase()}'),
            const Icon(
              Icons.chevron_right,
              color: AppColors.black,
            )
          ],
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
