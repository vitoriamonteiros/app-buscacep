import 'package:app_cep/controller.dart';
import 'package:app_cep/provider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final CEPController ctlCEP;

  final CEPProvider provider = CEPProvider();

  final TextEditingController _inputText = TextEditingController();
  final TextEditingController _inputRua = TextEditingController();
  final TextEditingController _inputBairro = TextEditingController();
  final TextEditingController _inputCidade = TextEditingController();
  final TextEditingController _inputUf = TextEditingController();

  final _formState = GlobalKey<FormState>();

  @override
  void initState () {
    super.initState();
    ctlCEP = CEPController(provider: CEPProvider(), input: _inputText);
    ctlCEP.addListener(_updateFields); // para aparecer os resultados
  }

  void _updateFields() {
    setState(() {
      _inputRua.text = ctlCEP.rua;
      _inputBairro.text = ctlCEP.bairro;
      _inputCidade.text = ctlCEP.cidade;
      _inputUf.text = ctlCEP.uf;
    });
    
  }

  void setMsgError(String titulo, String mensagem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.warning,
                color: Colors.red,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                titulo,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              ],
            ),
          content: Text(
            mensagem,
            style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            child: Text(
              'Ok',
              style: TextStyle(color: Colors.red),
             )),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 233, 244),
      body: Padding(
        padding: const EdgeInsets.all(18.0), // para nao quebrar a pagina
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildText('Busca CEP', 40),
                Form(
                  key: _formState,
                  child: Column(
                    children: [
                      Image.asset(
                      'assets/cep.png',
                      width: 200,
                      height: 100,
                      ),
                      
                      buildTextField('Informe o CEP', 
                      _inputText,
                      isCepField: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, digite o CEP'; // Checa se o campo está vazio
                        }
                        if (value.length != 8) {
                          return 'O CEP deve ter 8 dígitos'; // tamanho do CEP
                        }
                        //ctlCEP.setMsgError('Erro de Validação', 'O CEP é inválido');
                        return null; // null se não houver erro
                      }),
                      buildButton('Consultar CEP'),
                      buildTextField('Rua', _inputRua, enabled: false),
                      buildTextField('Bairro', _inputBairro, enabled: false),
                      buildTextField('Cidade', _inputCidade, enabled: false),
                      buildTextField('UF', _inputUf, enabled: false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController input, {bool enabled = true, String? Function(String?)? validator, bool isCepField = false}){
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
      child: TextFormField(
        controller: input,
        enabled: enabled, // para controlar e nao digitar nos campos de respostas
        keyboardType: TextInputType.number,
        //maxLength: 8, //contagem dos dígitos obrigatória
        maxLength: isCepField ? 8 : null,
        style: const TextStyle(
          color: Colors.purple,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0)
            ),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.purple),
          prefixIcon: isCepField ? Icon(Icons.search, color: Colors.purple) : null, // adiciona o ícone de busca apenas para o campo de CEP
        ),
        validator: validator, // adiciona a função de validação
      ),
    );
  }


  Widget buildButton(String texto){
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () async{
            if(_formState.currentState!.validate()){ // currentState é estado atual do formulário

               await ctlCEP.buscaCEP();
              if (ctlCEP.error != ''){
                setMsgError('Erro', ctlCEP.error); // ele puxa do controller 
              }
            }
          },
          icon: const Icon(Icons.add_location_alt,
          color: Colors.purple,),
          label: Text(
            texto,
            style: const TextStyle(
              color: Colors.purple, 
              fontSize: 16
            ),
          ),
        ),
      ),
    );
  }

  Widget buildText(String texto, double size){
    return Padding(
    padding: const EdgeInsets.only(top: 30.0),  // padding apenas no topo do texto
    child: Text(
      texto,
      style: TextStyle(
        color: Colors.purple,
        fontSize: size,
        fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
