import '../../utils/enum.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse({
    this.status,
    this.data,
    this.message,
  });

  ApiResponse.loading() : status = Status.loading;
  ApiResponse.error(this.message) : status = Status.error;
  ApiResponse.completed(this.data) : status = Status.success;

  @override
  String toString() {
    return 'Status: $status \n Message: $message \n Data: $data';
  }
}
