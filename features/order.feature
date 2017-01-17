Feature: Creating a order

Scenario: Creating a valid order
  Given I send and accept JSON
  When I add Headers:
      | Authorization | Basic MDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDE6QUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQg== |
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
      "ownId": "0001",
      "fullname": "Fernanda Cezário",
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
  }
  """
  And I send a POST request to "https://sandbox.moip.com.br/v2/orders"
  Then the response status should be "201"
  And print the response
  When I grab "$" as "order"
  Then the items "product" should be "Chocolate"
  And the items "quantity" should be equal 100
  And the items "detail" should be "Milka Oreo"
  And the items "price" should be equal 3

  Scenario: Creating a valid order with two items
    Given I send and accept JSON
    When I add Headers:
        | Authorization | Basic MDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDE6QUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQg== |
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
        },
        {
          "product": "Macarrão",
          "quantity": 55,
          "detail": "Barilla",
          "price": 345
        }
      ],
      "customer": {
        "ownId": "0001",
        "fullname": "Fernanda Cezário",
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
    }
    """
    And I send a POST request to "https://sandbox.moip.com.br/v2/orders"
    Then the response status should be "201"
    And print the response
    When I grab "$" as "order"
    Then the items "product" should be "Chocolate"
    And the items "quantity" should be equal 100
    And the items "detail" should be "Milka Oreo"
    And the items "price" should be equal 3


Scenario: Creating order with the same ownId
  Given I send and accept JSON
  When I add Headers:
      | Authorization | Basic MDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDE6QUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQg== |
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
      "ownId": "0001",
      "fullname": "Fernanda Cezário",
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
  }
  """
  And I send a POST request to "https://sandbox.moip.com.br/v2/orders"
  Then the response status should be "201"
  Given I send and accept JSON
  When I add Headers:
    | Authorization | Basic MDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDE6QUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQg== |
  And I use the last ownId and set JSON request body to:
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
      "ownId": "0001",
      "fullname": "Fernanda Cezário",
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
  }
  """
  And I send a POST request to "https://sandbox.moip.com.br/v2/orders"
  # ESTE CENÁRIO QUEBRA NA AUTOMAÇÃO, POIS O STATUS APRESENTADO É INCORRETO
  Then the response status should be "401"


Scenario: Try to create a order without product
  Given I send and accept JSON
  When I add Headers:
      | Authorization | Basic MDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDE6QUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQg== |
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
        "product": "",
        "quantity": 100,
        "detail": "Milka Oreo",
        "price": 3
      }
    ],
    "customer": {
      "ownId": "0001",
      "fullname": "Fernanda Cezário",
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
  }
  """
  And I send a POST request to "https://sandbox.moip.com.br/v2/orders"
  Then the response status should be "400"
  And print the errors


  Scenario: Try to create a order without customer
    Given I send and accept JSON
    When I add Headers:
        | Authorization | Basic MDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDE6QUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQg== |
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
      ]
    }
    """
    And I send a POST request to "https://sandbox.moip.com.br/v2/orders"
    # ESTE CENÁRIO QUEBRA NA AUTOMAÇÃO, POIS O STATUS APRESENTADO É INCORRETO
    Then the response status should be "401"


  Scenario: Create an order for existent customer
    Given I send and accept JSON
    When I add Headers:
        | Authorization | Basic MDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDE6QUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQg== |
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
        "id": "CUS-YU95ER6YE6RR"
      }
    }
    """
    And I send a POST request to "https://sandbox.moip.com.br/v2/orders"
    Then the response status should be "201"
