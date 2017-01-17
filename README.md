# MOIP
Teste manuais, de automação e relatório de bugs.

Testes de automação utilizando Cucumber, Cucumber-api, Capybara, Rspec e Selenium Webdriver.
Foram executados na versão 46.0.1 do Firefox.

Como executar a suíte de automação:

  Dado que eu clonei o projeto para o meu computador
  Quando eu abrir o terminal
  E acessar a pasta do projeto
  E dar bundle na pasta no projeto
  E digitar: cucumber features/{nome_arquivo_.feature}
  E der enter
  Então o sistema deverá rodar todos os cases da feature em questão e exibir o resultado

Segue abaixo a estrutura json que deve ser utilizada nos cenários para criação de um cliente:

{
  "ownId": "0001", 
  "fullname": "Fernanda Moip", 
  "email": "cezario@gmail.com", 
  "birthDate": "1983-11-10", 

  "taxDocument": { 
    "type": "CPF", 
    "number": "12345678901" 
  },
  "phone": { 
    "countryCode": "55",
    "areaCode": "11", 
    "number": "912341234"
  },
  "shippingAddress": { 
    "city": "São Paulo", 
    "complement": "Apartamento A",
    "district": "Chacara Santo Antônio", 
    "street": "Rua Antônio das Chagas", 
    "streetNumber": "94", 
    "zipCode": "04714001", 
    "state": "São Paulo", 
    "country": "Brasil" 
  }
}

Link com levantamento de requisitos/manual para criação de um cliente: 
http://dev.moip.com.br/referencia-api/#criar-cliente-post


Segue abaixo a estrutura json que deve ser utilizada nos cenários para criação de um pedido:

{
  "ownId": "0001",
  "amount": {
    "currency": "BRL",
    "subtotals": {
      "shipping": 10
    }
  },
  "items": [
    {
      "product": "Chocolate",
      "quantity": 100,
      "detail": "Milka Oreo",
      "price": 3
    }
  ],
  "customer": {
    "ownId": "0001", 
    "fullname": "Fernanda Moip", 
    "email": "cezario@gmail.com", 
    "birthDate": "1983-11-10", 

    "taxDocument": { 
      "type": "CPF", 
      "number": "12345678901" 
    },
    "phone": { 
      "countryCode": "55",
      "areaCode": "11", 
      "number": "912341234"
    },
    "shippingAddress": { 
      "city": "São Paulo", 
      "complement": "Apartamento A",
      "district": "Chacara Santo Antônio", 
      "street": "Rua Antônio das Chagas", 
      "streetNumber": "10", 
      "zipCode": "04714000", 
      "state": "São Paulo", 
      "country": "Brasil"
    }
  }
}

Link com levantamento de requisitos/manual para criação de um pedido: 
http://dev.moip.com.br/referencia-api/#criar-pedido-post


Segue abaixo a estrutura json que deve ser utilizada nos cenários para realizar um pagamento com cartão de crédito:

{
    "installmentCount": 1,
    "fundingInstrument": {
        "method": "CREDIT_CARD",
        "creditCard": {
            "expirationMonth": 05,
            "expirationYear": 18,
            "number": "5555666677778884",
            "cvc": "123",
            "holder": {
                "fullname": "Jose Portador da Silva",
                "birthdate": "1988-12-30",
                "taxDocument": {
                    "type": "CPF",
                    "number": "33333333333"
                },
                "phone": {
                    "countryCode": "55",
                    "areaCode": "11",
                    "number": "66778899"
                }
            }
        }
    }
}

Segue abaixo a estrutura json que deve ser utilizada nos cenários para realizar um pagamento com boleto:

{
    "installmentCount": 1,
    "fundingInstrument": {
        "method": "BOLETO",
        "boleto": {
            "expirationDate": "2018-01-01"
        }
    }
}

Link com levantamento de requisitos/manual para realização de um pagamento: 
http://dev.moip.com.br/referencia-api/#criar-pagamento-post