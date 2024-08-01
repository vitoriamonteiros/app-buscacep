import 'package:app_cep/provider.dart';
import 'package:flutter/material.dart';

class CEPController extends ChangeNotifier {
  final TextEditingController input;
  final CEPProvider provider;
  //String _cep = '';
  String _rua = '';
  String _bairro = '';
  String _cidade = '';
  String _uf = '';
  String _mensagem = '';
  String _error = '';

  CEPController({required this.provider, required this.input}); // obrigando a passar esses dois argumentos provider e input

  //String get cep => _cep;
  String get rua => _rua;
  String get bairro => _bairro;
  String get cidade => _cidade;
  String get uf => _uf;
  String get mensagem => _mensagem;
  String get error => _error;

//para limpar os campos na consulta
  void clearFields() {
    if (_mensagem.isNotEmpty) {
      _rua = '';
      _bairro = '';
      _cidade = '';
      _uf = '';
      notifyListeners();
    }
  }
  

  void setMsgError(String titulo, String msg) {
    _mensagem = msg;
    clearFields(); //limpar os campos das respostas
    notifyListeners();
  }

  void setWaiting(String msg) {
    _mensagem = msg;
    notifyListeners();
    //clearFields();
  }


  Future<void> buscaCEP() async {
    String cep = input.text.trim();
    if (cep.length != 8) {
      setMsgError('CEP Inválido', 'CEP deve possuir 8 dígitos!');
      return;
    }

    try {
      var url = 'https://viacep.com.br/ws/$cep/json/';
      var resultado = await provider.getCEPApi(url, cep); 

      if (resultado.containsKey('erro')) {
       throw Exception('Erro ao consultar CEP!');
      } else {
        _rua = resultado['logradouro'].toUpperCase();
        _bairro = resultado['bairro'].toUpperCase();
        _cidade = resultado['localidade'].toUpperCase();
        _uf = resultado['uf'].toUpperCase();
        _mensagem = ''; // limpa mensagem de erro se houver sucesso
        notifyListeners();
      }
    } on Exception catch (e) {
      _error = e.toString(); // ele ta capturando a mensafgem de erro de cima 
      notifyListeners();
      // print(e.toString());
      // throw Exception(e.toString());
    } 
  }

}
