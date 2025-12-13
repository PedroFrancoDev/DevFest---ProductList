import 'package:dartz/dartz.dart';
import 'package:dev_fest_product_list/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  Future<void> handleRequestWithLoading<T>({
    required BuildContext context,
    required Future<Either<dynamic, T>> Function() operation,
    required String successMessage,
    required void Function(bool value) setLoading,
  }) async {
    setLoading(true);
    notifyListeners();

    final result = await operation();

    result.fold(
      (l) => SnackbarHelper.showModernMessage(
        context,
        l.message,
        type: MessageType.error,
      ),
      (r) => SnackbarHelper.showModernMessage(
        context,
        successMessage,
        type: MessageType.success,
      ),
    );

    setLoading(false);
    notifyListeners();
  }
}
