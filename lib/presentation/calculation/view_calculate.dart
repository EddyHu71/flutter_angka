import 'package:flutter/material.dart';
import 'package:flutter_angka/application/calculation/get_calculation.dart';
import 'package:flutter_angka/injection.dart';
import 'package:flutter_angka/presentation/core/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class Calculation extends GetView<GetCalculation> {
  Calculation({Key? key}) : super(key: key);

  final GetCalculation calculation = Get.put(getIt<GetCalculation>());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title:
              const Text("Calculation", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    onChanged: (value) => calculation.onInputChanged(value),
                    validator: (_) {
                      calculation.getInputNumber.value.fold(
                          (l) => l.maybeMap(
                              nolValue: (_) => "Can't use Zero",
                              empty: (_) => "Failed",
                              failed: (_) => "Failed",
                              orElse: () {}),
                          (r) => null);
                    },
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.withOpacity(0.4),
                      hintText: "Input",
                      border: InputBorder.none,
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                      child: Column(
                    children: [
                      Container(
                          child: Row(
                        children: [
                          Expanded(
                            child: Widgets.chooseButton(
                                callback: () {
                                  if (calculation.isValid.isTrue) {
                                    calculation.calculation("1");
                                  }
                                },
                                types: "1"),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Widgets.chooseButton(
                                callback: () {
                                  if (calculation.isValid.isTrue) {
                                    calculation.calculation("2");
                                  }
                                },
                                types: "2"),
                          ),
                        ],
                      )),
                      Container(
                          child: Row(
                        children: [
                          Expanded(
                            child: Widgets.chooseButton(
                                callback: () {
                                  if (calculation.isValid.isTrue) {
                                    calculation.calculation("3");
                                  }
                                },
                                types: "3"),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Widgets.chooseButton(
                                callback: () {
                                  if (calculation.isValid.isTrue) {
                                    calculation.calculation("4");
                                  }
                                },
                                types: "4"),
                          ),
                        ],
                      )),
                    ],
                  )),
                  SizedBox(height: 24),
                  Expanded(
                      child: Obx(
                    () => calculation.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: calculation.number.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(
                                  calculation.number[index].toString() + " ",
                                  style: TextStyle(fontSize: 24));
                            }),
                  )),
                ],
              ),
            )));
  }
}
