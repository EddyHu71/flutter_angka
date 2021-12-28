import 'package:flutter_angka/domain/calculation/calculation_object.dart';
import 'package:flutter_angka/domain/calculation/i_calculation.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCalculation extends GetxController {
  final ICalculation iCalculation;
  GetCalculation(this.iCalculation);

  Rx<InputNumber> inputNumber = InputNumber('').obs;

  Rx<bool> isLoading = false.obs;
  RxList<String> number = <String>[].obs;
  Rx<bool> isValid = false.obs;

  InputNumber get getInputNumber => inputNumber.value;

  void onInputChanged(String input) {
    inputNumber.value = InputNumber(input);
    isValidateInput();
  }

  isValidateInput() {
    isValid.value = inputNumber.value.isValid();
  }

  Future<void> calculation(String types) async {
    isLoading.value = true;
    print("Get Calculation executed");
    var res = await iCalculation.calculate(
        double.parse(inputNumber.value.getOrCrash()), types);
    isLoading.value = false;

    res.match((l) {
      print("Left");
      print(l);
    }, (r) {
      print("Right");
      print(r);
      number.value = r;
    });
  }
}
