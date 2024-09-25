class ApiConstants {
  /// base Url

  static const String apiKey = "n9Q2Rw3jvtqd2zIskqjSnQ==VaVRlsKdBASzv2eM";
  static const String baseUrl = "https://api.api-ninjas.com";

  /// base Api
  static String carModel = "/v1/cars";
  static String token = "barer token";

  static bool isTester = true;
  static const duration = Duration(seconds: 30);
  static const contentType = "application/json";

  static bool validate(int? statusCode) => statusCode! <= 205;

  // headers
  static Map<String, String> headers = <String, String>{"Content-Type": "application/json", "X-Api-Key": apiKey};

  static Map<String, String> defaultParam({required String model, String? fuelType, String? cylinders}) {
    final Map<String, String> params = <String, String>{
      "limit": "10",
      "model": model,
    };

    if (fuelType != null) {
      params["fuel_type"] = fuelType;
    }

    if (cylinders != null) {
      params["cylinders"] = cylinders;
    }

    return params;
  }

  /// params

  static Map<String, String> emptyParams() => <String, String>{};

  /// body
  static Map<String, dynamic> bodyEmpty() => <String, dynamic>{};

  static Map<String, dynamic> bodyLoginUser({required String email, required String password}) =>
      <String, String>{"email": email, "password": password};
}
