import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/styles.dart';
import '../../../utils/colors.dart';

class AutocompleteRecord extends StatelessWidget {
  const AutocompleteRecord({Key? key}) : super(key: key);


  static String _displayStringForOption(String record) => '';

  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: CupertinoSearchTextField(
            backgroundColor: Colors.white,
            autofocus: false,
            placeholder: 'Tìm kiếm',
            placeholderStyle:
            Styles.heading4.copyWith(color: AppColors.black),
            controller: textEditingController,
            focusNode: focusNode,
            style: Styles.heading4.copyWith(color: AppColors.black),
          ),
        );
      },
      // optionsViewBuilder: (context, onSelected, options) =>
      //     Material(
      //       shape: const RoundedRectangleBorder(
      //         borderRadius:
      //         BorderRadius.vertical(bottom: Radius.circular(0.0)),
      //       ),
      //       child: Container(
      //         color: AppColors.background,
      //         width: MediaQuery.of(context).size.width,
      //         child: ListView.builder(
      //           padding: EdgeInsets.zero,
      //           itemCount: options.length,
      //           shrinkWrap: false,
      //           itemBuilder: (BuildContext context, int index) {
      //             final DoctorPagingItem option = options.elementAt(index);
      //             return InkWell(
      //               onTap: () => onSelected(option),
      //               child: Padding(
      //                 padding: const EdgeInsets.only(top: 16.0, right: 16.0),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   crossAxisAlignment: CrossAxisAlignment.center,
      //                   children: [
      //                     ClipRRect(
      //                       borderRadius: BorderRadius.circular(20),
      //                       child: CachedNetworkImage(
      //                         height: 40,
      //                         width: 40,
      //                         imageUrl: option.image ?? '',
      //                         placeholder: (context, url) =>
      //                         const CircularProgressIndicator(),
      //                         errorWidget: (context, url, error) =>
      //                             Image.asset(ImageEnum.avatarDefault),
      //                       ),
      //                     ),
      //                     const SizedBox(
      //                       width: 16,
      //                     ),
      //                     Expanded(
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           SizedBox(
      //                               child: Text(
      //                                 '${option.name}',
      //                                 style: Styles.subtitleSmallest.copyWith(
      //                                   fontWeight: FontWeight.w500,
      //                                   fontSize: 14,
      //                                 ),
      //                               )),
      //                           const SizedBox(
      //                             height: 4,
      //                           ),
      //                           Text(
      //                             '${option.position}',
      //                             style: Styles.subtitleSmallest,
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                     const Icon(Icons.keyboard_arrow_right,size: 28, color: AppColors.lightSilver,),
      //                     const SizedBox(
      //                       width: 16,
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //     ),
      onSelected: (String selection) {

      },
    );
  }
}
