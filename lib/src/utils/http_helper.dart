import 'package:intellyjent/src/core/core.dart';
import 'dart:convert';
import 'package:http/http.dart' as https;

class HttpHelper extends GetConnect {
  HttpHelper._();

  static final HttpHelper instance = HttpHelper._();

  @override
  String get baseUrl => "https://intellyjent.com/api/v1/";
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = "https://intellyjent.com/";
    httpClient.addRequestModifier<dynamic>((request) async {
      request.headers["content-type"] = 'application/json';
      request.headers["Accept"] = 'application/json';
      request.headers["Accept-Encoding"] = 'identity';
      return request;
    });
  }

  Future getDynamicRequest(String url, String param) async {
    print('calling the get dynamic function ');
    // returns {"status": "fail", "message": "something went wrong"} for other issues
    String getUrl = "$url/$param";
    if (param == '') {
      getUrl = url;
    }
    // Map<String, String> headers = {"Authorization": "Token ${UserData.token}"};
    Map<String, String> headers = {"Authorization": "Token ${UserData.token}"};
    try {
      var response = await https.get(
        Uri.parse(baseUrl + getUrl),
        headers: headers,
      );
      print('this is the get dynamic function ');
      print(response.body);

      if (response.statusCode == 200) {
        // Successful response
        return {
          "status": "success",
          "data": jsonDecode(response.body),
        };
      } else {
        // Handle error based on status code
        print(
            'HTTP error: ${response.statusCode} ${jsonDecode(response.body)}');

        // Check for the specific error and redirect to login page
        if (response.statusCode == 403 &&
            jsonDecode(response.body)['detail'] ==
                'Invalid authentication. Could not decode token.') {
          Get.off(() => const Login());
          return;
        }

        return {"status": "fail", "message": 'Something went wrong'};
      }
    } catch (e) {
      if (e is TimeoutException) {
        // Handle timeout error here
        return {"status": "fail", "message": 'Request timed out'};
      } else {
        print(e);
        return {"status": "fail", "message": 'Something went wrong'};
      }
    }
  }

  Future getRequest(String url, {Converter? converter}) async {
    try {
      var res = await get(url,
              headers: UserData.token == null
                  ? {}
                  : {"Authorization": "Token ${UserData.token}"})
          .timeout(
        const Duration(seconds: 60),
      );
      // if (kDebugMode) print(res.body);

      if (res.body == null &&
          !(res.statusCode == 200 ||
              res.statusCode == 201 ||
              res.statusCode == 204)) {
        throw Exception(["Response body returned null"]);
      }
      var decodedBody = res.body;

      if (res.statusCode == 200 || res.statusCode == 201) {
        HttpResponse response = SuccessResponse(result: decodedBody);
        if (converter != null) {
          return (response as SuccessResponse).withConverter(converter);
        }
        return response;
      }

      return ErrorResponse.fromJson(decodedBody);
    } catch (e) {
      return ErrorResponse(message: e.toString());
    }
  }

  Future<HttpResponse> postRequest(String url,
      {Map<String, dynamic>? body, Converter? converter}) async {
    try {
      var res = await post(url, body,
              headers: UserData.token == null
                  ? {}
                  : {"Authorization": " Token ${UserData.token}"})
          .timeout(
        const Duration(seconds: 60),
      );
      print('God abeg ${res.body}');

      if (kDebugMode) print(res.body);

      if (res.body == null &&
          !(res.statusCode == 200 ||
              res.statusCode == 201 ||
              res.statusCode == 204)) {
        throw Exception(["Response body returned null"]);
      }
      var decodedBody = res.body;

      if (res.statusCode == 200 || res.statusCode == 201) {
        HttpResponse response = SuccessResponse(result: decodedBody);
        if (converter != null) {
          return (response as SuccessResponse).withConverter(converter);
        }
        return response;
      }

      return ErrorResponse.fromJson(decodedBody);
    } catch (e) {
      return ErrorResponse(message: e.toString());
    }
  }

  Future<HttpResponse> postRequestNoAuth(String url,
      {Map<String, dynamic>? body, Converter? converter}) async {
    print('Making POST request to: ${httpClient.baseUrl}$url');
    print('Request body: ${jsonEncode(body)}');

    try {
      final fullUrl = Uri.parse("${httpClient.baseUrl}$url");

      final res = await https
          .post(
            fullUrl,
            headers: {
              'Content-Type': 'application/json',
              // add any other headers here if needed
            },
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 60));

      print("Status Code: ${res.statusCode}");
      print("Response Body: ${res.body}");

      if (res.body.isEmpty ||
          !(res.statusCode == 200 ||
              res.statusCode == 201 ||
              res.statusCode == 204)) {
        throw Exception(["Response body returned null or empty"]);
      }

      var decodedBody = jsonDecode(res.body);
      print('Decoded response: $decodedBody');

      if (res.statusCode == 200 || res.statusCode == 201) {
        HttpResponse response = SuccessResponse(result: decodedBody);
        if (converter != null) {
          return (response as SuccessResponse).withConverter(converter);
        }
        return response;
      }

      return ErrorResponse.fromJson(decodedBody);
    } catch (e, stackTrace) {
      print("Exception caught: $e");
      print("StackTrace: $stackTrace");
      return ErrorResponse(message: e.toString());
    }
  }

  ///signup function
  Future<HttpResponse> signupPostRequestNoAuth(String url,
      {Map<String, dynamic>? body, Converter? converter}) async {
    print('Making POST request to: ${httpClient.baseUrl}$url');
    print('Request body: ${jsonEncode(body)}');

    try {
      final fullUrl = Uri.parse("${httpClient.baseUrl}$url");

      final res = await https
          .post(
            fullUrl,
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 60));

      print("Status Code: ${res.statusCode}");
      print("Response Body: ${res.body}");

      // Always decode the body first if it's not empty
      Map<String, dynamic>? decodedBody =
          res.body.isNotEmpty ? jsonDecode(res.body) : null;

      // ✅ Handle 201 with "detail" message
      if (res.statusCode == 200 || res.statusCode == 201) {
        print("good res caught: $decodedBody");
        return SuccessResponse(result: decodedBody);
      }

      // ❌ Handle 400+ with "detail"
      if (decodedBody != null && decodedBody.containsKey('detail')) {
        print("Exception caught: ${decodedBody['detail']}");
        return ErrorResponse(message: decodedBody['detail']);
      }

      // ❌ Fallback generic error
      return ErrorResponse(message: "Unexpected error occurred.");
    } catch (e, stackTrace) {
      print("Exception caught: $e");
      print("StackTrace: $stackTrace");
      return ErrorResponse(message: e.toString());
    }
  }

  // Future<HttpResponse> postRequestStatusResponse(String url,
  //     {Map<String, dynamic>? body, Converter? converter}) async {
  //   try {
  //     var res = await post(url, body,
  //             headers: UserData.token == null
  //                 ? {}
  //                 : {"Authorization": "Token ${UserData.token}"})
  //         .timeout(
  //       const Duration(seconds: 60),
  //     );

  //     if (kDebugMode) print(res.body);

  //     if (res.body == null &&
  //         !(res.statusCode == 200 ||
  //             res.statusCode == 201 ||
  //             res.statusCode == 204)) {
  //       throw Exception(["Response body returned null"]);
  //     }
  //     var decodedBody = res.body;
  //     print(res.statusCode);

  //     if (res.statusCode! >= 200 && res.statusCode! <= 205) {
  //       HttpResponse response =
  //           SuccessResponse(result: {'status_code': res.statusCode});
  //       if (converter != null) {
  //         return (response as SuccessResponse).withConverter(converter);
  //       }
  //       return response;
  //     }

  //     if (res.statusCode == 400) {
  //       return ErrorResponse.fromJson(decodedBody);
  //     }
  //     return ErrorResponse.fromJson(decodedBody);
  //   } catch (e) {
  //     return ErrorResponse(message: e.toString());
  //   }
  // }

 

Future<HttpResponse> postRequestStatusResponse(String url,
    {Map<String, dynamic>? body, Converter? converter}) async {
  try {
    var res = await post(url, body,
        headers: UserData.token == null
            ? {}
            : {"Authorization": "Token ${UserData.token}"})
        .timeout(
      const Duration(seconds: 60),
    );

    if (kDebugMode) print('Raw response: ${res.body}');

    if (res.body == null &&
        !(res.statusCode == 200 ||
            res.statusCode == 201 ||
            res.statusCode == 204)) {
      throw Exception(["Response body returned null"]);
    }

    // Decode only if it's a string
    final decodedBody = res.body is String ? jsonDecode(res.body) : res.body;

    print('Decoded body: $decodedBody');
    print('Status code: ${res.statusCode}');

    if (res.statusCode! >= 200 && res.statusCode! <= 205) {
      HttpResponse response = SuccessResponse(result: decodedBody);
      if (converter != null) {
        return (response as SuccessResponse).withConverter(converter);
      }
      return response;
    }

    return ErrorResponse.fromJson(decodedBody);
  } catch (e) {
    print('Exception occurred: $e');
    return ErrorResponse(message: e.toString());
  }
}



  Future postRequestQuizQuestions(String url,
      {Map<String, dynamic>? body, Converter? converter}) async {
    try {
      var res = await post(url, body,
              headers: UserData.token == null
                  ? {}
                  : {
                      "Authorization": "Token ${UserData.token}",
                      // "Content-Type": "application/json"
                    })
          .timeout(
        const Duration(seconds: 60),
      );
      // if(kdeb)print(res.body);
      // print(' 3ddd ${res.statusCode}');
      // print('3ddd ${res.body}');

      if (res.body == null &&
          !(res.statusCode == 200 ||
              res.statusCode == 201 ||
              res.statusCode == 204)) {
        throw Exception(["Response body returned null"]);
      }
      var decodedBody = res.body;
      print("this is the res from post call: ${res.body}");
      // print(res.statusCode);

      if (res.statusCode == 200 ||
          res.statusCode == 201 ||
          res.statusCode == 203) {
        print('yes from post res ${res.statusCode}');
        return {"status": res.statusCode, "message": decodedBody};
      } else if (res.statusCode == 403) {
        return {
          "status": 403,
          "message": 'You do not have enough points to play'
        };
      } else if (res.statusCode == 503 || res.statusCode == 504) {
        return {"status": 500, "message": 'Application error'};
      }

      return ErrorResponse.fromJson(decodedBody);
    } catch (e) {
      return ErrorResponse(message: e.toString());
    }
  }

  Future<HttpResponse> patchRequest(String url,
      {Map<String, dynamic>? body, Converter? converter}) async {
    try {
      var res = await patch(url, body,
              headers: UserData.token == null
                  ? {}
                  : {"Authorization": "Token ${UserData.token}"})
          .timeout(
        const Duration(seconds: 60),
      );
      print('patch ${res.body}');
      print('patch ${res.statusCode}');

      if (res.body == null &&
          !(res.statusCode == 200 ||
              res.statusCode == 201 ||
              res.statusCode == 204)) {
        throw Exception(["Response body returned null"]);
      }
      var decodedBody = res.body;

      if (res.statusCode == 200 || res.statusCode == 201) {
        HttpResponse response = SuccessResponse(result: decodedBody);
        if (converter != null) {
          return (response as SuccessResponse).withConverter(converter);
        }
        return response;
      }

      return ErrorResponse.fromJson(decodedBody);
    } catch (e) {
      return ErrorResponse(message: e.toString());
    }
  }

  Future<HttpResponse> putRequest(String url,
      {Map<String, dynamic>? body, Converter? converter}) async {
    try {
      var res = await put(url, body,
              headers: UserData.token == null
                  ? {}
                  : {"Authorization": "Token ${UserData.token}"})
          .timeout(
        const Duration(seconds: 60),
      );
      print('put ${res.body}');
      print('put ${res.statusCode}');

      if (res.body == null &&
          !(res.statusCode == 200 ||
              res.statusCode == 201 ||
              res.statusCode == 204)) {
        throw Exception(["Response body returned null"]);
      }
      var decodedBody = res.body;

      if (res.statusCode == 200 || res.statusCode == 201) {
        HttpResponse response = SuccessResponse(result: decodedBody);
        if (converter != null) {
          return (response as SuccessResponse).withConverter(converter);
        }
        return response;
      }

      return ErrorResponse.fromJson(decodedBody);
    } catch (e) {
      return ErrorResponse(message: e.toString());
    }
  }

  Future<HttpResponse> patchRequestGameOver(String url,
      {Map<String, dynamic>? body, Converter? converter}) async {
    try {
      var res = await patch(url, body,
              headers: UserData.token == null
                  ? {}
                  : {
                      "Authorization": "Token ${UserData.token}",
                      "X-Device-Id": UserData.deviceId!
                    })
          .timeout(
        const Duration(seconds: 60),
      );
      print('patch ${res.body}');

      if (res.body == null &&
          !(res.statusCode == 200 ||
              res.statusCode == 201 ||
              res.statusCode == 204)) {
        throw Exception(["Response body returned null"]);
      }
      var decodedBody = res.body;

      if (res.statusCode == 200 || res.statusCode == 201) {
        HttpResponse response = SuccessResponse(result: decodedBody);
        if (converter != null) {
          return (response as SuccessResponse).withConverter(converter);
        }
        return response;
      }

      return ErrorResponse.fromJson(decodedBody);
    } catch (e) {
      return ErrorResponse(message: e.toString());
    }
  }

  Future<HttpResponse> deleteRequest(String url, String userId) async {
    // Construct the URL with the user ID as a path parameter
    String deleteUrl = "$url/$userId";

    try {
      // Perform the delete request
      var response = await https.delete(
        Uri.parse(baseUrl + deleteUrl),
        headers: {
          "Authorization": "Token ${UserData.token}",
          "Content-Type": "application/json",
        },
      );

      // Print the response body for debugging purposes
      print(response.body);

      if (response.statusCode == 204) {
        // Successful deletion (204 No Content)
        return const HttpResponse(
            status: true, message: 'Account deleted successfully');
      } else {
        // Handle error based on status code
        print(
            'HTTP error: ${response.statusCode} ${jsonDecode(response.body)}');
        return ErrorResponse(message: 'Failed to delete account');
      }
    } catch (e) {
      if (e is TimeoutException) {
        // Handle timeout error here
        return ErrorResponse(message: 'Request timed out');
      } else {
        print(e);
        return ErrorResponse(message: 'Something went wrong');
      }
    }
  }
}

class HttpResponse {
  final bool status;
  final String message;

  const HttpResponse({required this.status, required this.message});
}

class SuccessResponseMap extends SuccessResponse<Map<String, dynamic>> {
  SuccessResponseMap({
    super.status,
    super.message,
    super.result,
  });

  @override
  SuccessResponseMap withConverter(Converter converter) =>
      SuccessResponseMap(result: converter(result!));
}

class SuccessResponse<T> extends HttpResponse {
  final T? result;
  SuccessResponse(
      {super.status = true,
      super.message = "Connection successful",
      this.result});

  SuccessResponse withConverter(Converter converter) =>
      SuccessResponse(result: converter(result));

  @override
  String toString() => "SuccessResponse(message:$message)";
}

class ErrorResponse extends HttpResponse {
  final List<HttpError> errors;

  ErrorResponse({
    super.status = false,
    super.message = "Connection failed",
    this.errors = const [],
  });

  factory ErrorResponse.fromJson(dynamic json) {
    if (json is List) {
      // The response is a list of error messages
      return ErrorResponse(message: json.join(", "));
    } else if (json is Map<String, dynamic>) {
      // The response is a map
      List<HttpError> createErrors = [];

      for (String key in json.keys) {
        if (key != 'message') {
          createErrors.add(HttpError(
            errorTitle: key,
            errorMessage:
                json[key].runtimeType == String ? [json[key]] : [...json[key]],
          ));
        }
      }

      // Extract the 'message' field from the JSON if it exists
      String message = json.containsKey('message')
          ? json['message'] as String
          : "Connection failed";

      return ErrorResponse(
        message: message,
        errors: createErrors,
      );
    } else {
      // Handle unexpected types
      return ErrorResponse(
          message: "Unexpected error format: ${json.runtimeType}");
    }
  }

  @override
  String toString() => "ErrorResponse(message:$message, errors: $errors)";
}

class HttpError {
  final String errorTitle;
  final List<String> errorMessage;
  const HttpError({required this.errorTitle, required this.errorMessage});

  @override
  String toString() =>
      "HttpError(errorTitle: $errorTitle,errorMessage: $errorMessage)";
}

typedef Converter<T> = T Function(dynamic json);
