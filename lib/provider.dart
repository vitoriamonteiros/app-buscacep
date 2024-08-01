import 'package:dio/dio.dart';

class CEPProvider {
  Dio dio = Dio(); // declarando o puglin Dio

  initDio() {
    dio.options.connectTimeout = const Duration(seconds: 5); //tempo maximo espera para estabelecer a Conexão
    dio.options.receiveTimeout = const Duration(seconds: 10); // tempo maximo esperar para receber os Dados
  }



  Future<Map<String,dynamic>> getCEPApi(String url, String cep) async{
    initDio();
    try {
      //initDio();
      final response = await dio.get(url);
      return response.data; // dados recebidos
    } on DioError catch (e) { //DioError e
      return {'erro': true, 'mensagem': e.message};
      //print(e);//DioException: ${e.menssagem}
    }
    //return {};
  }
}