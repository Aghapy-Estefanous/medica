import 'package:dio/dio.dart';
import 'package:medica/core/errors/error_model.dart';

class ServerExceptions implements Exception {
  final ErrorModel errorModel;

  ServerExceptions({required this.errorModel});
}


 void handleDioExceptions(DioException e) {
      switch (e.type) {
      case DioExceptionType.connectionTimeout:
        ServerExceptions(errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.sendTimeout:
        ServerExceptions(errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.receiveTimeout:
        ServerExceptions(errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.badCertificate:
        ServerExceptions(errorModel: ErrorModel.fromJson(e.response!.data));
    
      case DioExceptionType.cancel:
        ServerExceptions(errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.connectionError:
        ServerExceptions(errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.unknown:
        ServerExceptions(errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType
            .badResponse: //acess to database like 403 bad response
            switch(e.response?.statusCode){
                case 400://bad req
                 throw(ServerExceptions(errorModel: ErrorModel.fromJson(e.response?.data)));
                case 401://unauthorized
                   throw(ServerExceptions(errorModel: ErrorModel.fromJson(e.response?.data)));
                case 403://forbidden
                 throw(ServerExceptions(errorModel: ErrorModel.fromJson(e.response?.data)));
                case 404://not found
                 throw(ServerExceptions(errorModel: ErrorModel.fromJson(e.response?.data)));
                case 409://cofficient
                 throw(ServerExceptions(errorModel: ErrorModel.fromJson(e.response?.data)));
                case 422://unprocessable entity
                 throw(ServerExceptions(errorModel: ErrorModel.fromJson(e.response?.data)));
                case 504://server exception
                 throw(ServerExceptions(errorModel: ErrorModel.fromJson(e.response?.data)));
    
            }
    }
  }