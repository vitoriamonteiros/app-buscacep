![headerbuscacep](https://github.com/user-attachments/assets/6e3f99df-069b-47e1-92f0-424b7b1ba6de)

O aplicativo Busca CEP é um projeto Flutter desenvolvido para a matéria de Mobile II do curso de Sistemas para Internet. Este aplicativo permite a busca de informações de endereços brasileiros a partir do CEP (Código de Endereçamento Postal), utilizando a API ViaCEP para obter os dados necessários. As requisições HTTP são realizadas com o auxílio do pacote Dio. Desenvolvido por mim e já apresentado, o aplicativo tem como objetivo facilitar a consulta de endereços de forma rápida e eficiente.

## Interface
Telas de pesquisa bem-sucedida:
![buscacep1](https://github.com/user-attachments/assets/dbcfe6c9-c472-4939-bea8-4e15f2ab501a)

Telas de erros:
![buscacep2](https://github.com/user-attachments/assets/247da6ac-bdf9-444c-80f9-e3123ae7d28c)


### API Utilizada

**ViaCEP** é uma API pública e gratuita que fornece dados de endereços brasileiros com base no CEP. Através dela, é possível obter informações como:
- Logradouro (rua, avenida, etc.)
- Bairro
- Cidade
- UF (Unidade Federativa)

Para mais detalhes sobre a API ViaCEP, você pode visitar [aqui](https://viacep.com.br/).

### O objetivo do aplicativo

O buscador de CEP do aplicativo permite ao usuário inserir um CEP e obter as informações completas do endereço correspondente. O aplicativo valida o CEP, faz a requisição à API e exibe os dados de forma organizada na tela. Isso facilita a busca e visualização de endereços com base em CEPs específicos.

## Instalação

Para instalar e executar este projeto localmente:

1. Clone o repositório:
   ```sh
   git clone https://github.com/vitoriamonteiros/app-buscacep.git

1. Navegue até o diretório do projeto:
    ```sh
    cd app-buscacep
1. Instale as dependências:
    ```
    flutter pub get
    ```

1. Execute o aplicativo:

    ```
    flutter run
    ```

## Estrutura de Arquivos

* **app.dart:** Configurações principais do aplicativo.
* **controller.dart:** Controle de lógica e estado da aplicação.
* **main.dart:** Ponto de entrada do aplicativo.
* **page.dart:** Interface de usuário e interação.
* **provider.dart:** Comunicação com a API ViaCEP usando Dio.

## Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento de aplicativos móveis.
- **Dart**: Linguagem de programação usada com o Flutter.
- **Dio**: Biblioteca para requisições HTTP.
- **API ViaCEP**: API para busca de informações de endereço a partir do CEP.

## Licença
Este projeto está licenciado sob a Licença MIT.

## Desenvolvedora

Desenvolvedora: [Vitória Monteiro](https://www.vitoriamonteiro.com.br/)  
Você pode conferir meu perfil no LinkedIn clicando no botão abaixo:

[![LinkedIn](https://img.shields.io/badge/LinkedIn-%230A66C2?style=flat-square&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/vitoriamonteiros/)
