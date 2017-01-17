Feature: Creating a payment

Scenario: Creating a valid payment
  Given I send and accept JSON
  When I add Headers:
      | Authorization | Basic V1hJWFVMUUhMVUtPN0hQS0pCNE5USFVTUlFWT0RNN0s6RklDVldWUTlSVFE1WkhRRVhNUFFLNUdTWlJKVFpPTEtMWlFHTTc0Qg== |
  And I generate ownId and set JSON request body to:
  """
  {
    "ownId": "tempOwnId",
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
      "ownId": "3131313131",
      "fullname": "Fernanda Cezário",
      "email": "oie@gmail.com",
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
  }
  """
  And I send a POST request to "https://sandbox.moip.com.br/v2/orders"
  Then the response status should be "201"
  And print the response
  And I grab "$['id']" as "order_id"
  Given I send and accept JSON
  When I add Headers:
      | Authorization | Basic V1hJWFVMUUhMVUtPN0hQS0pCNE5USFVTUlFWT0RNN0s6RklDVldWUTlSVFE1WkhRRVhNUFFLNUdTWlJKVFpPTEtMWlFHTTc0Qg== |
  And I set JSON request body to:
  """
  {
    "installmentCount": 1,
    "fundingInstrument": {
        "method": "CREDIT_CARD",
        "creditCard": {
            "expirationMonth": "05",
            "expirationYear": 18,
            "number": "5555666677778884",
            "cvc": "123",
            "holder": {
                "fullname": "Jose Portador da Silva",
                "birthdate": "1988-12-30",
                "taxDocument": {
                    "type": "CPF",
                    "number": "33333333333"
                }
            }
        }
    }
  }
  """
  And I send a POST request to create a payment
  Then the response status should be "201"
  And print the response
  And I grab "$['id']" as "payment_id"
  Given I open the URL "https://conta-sandbox.moip.com.br"
  When I sign in
  Then the payment status must be pago
