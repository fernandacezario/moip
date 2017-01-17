Feature: Creating a client

  Scenario: Sending request without authorization header
    Given I send and accept JSON
    When I send a POST request to "https://sandbox.moip.com.br/v2/customers"
    Then the response status should be "401"
    And print the response

  Scenario: Fetching all clients
    Given I send and accept JSON
    When I add Headers:
        | Authorization | Basic MDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDE6QUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQg== |
    And I send a GET request to "https://sandbox.moip.com.br/v2/customers"
    Then the response status should be "200"
    And the JSON response should have key "customers"

  Scenario: Sending request without body
    Given I send and accept JSON
    When I add Headers:
        | Authorization | Basic MDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDE6QUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQg== |
    And I send a POST request to "https://sandbox.moip.com.br/v2/customers"
    Then the response status should be "400"
    And print the errors

  Scenario: Creating a valid client
    Given I send and accept JSON
    When I add Headers:
        | Authorization | Basic MDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDE6QUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQg== |
    And I generate ownId and set JSON request body to:
    """
    {
      "ownId": "tempOwnId",
      "fullname": "Jose Silva",
      "email": "jose_silva0@email.com",
      "birthDate": "1988-12-30",
      "taxDocument": {
        "type": "CPF",
        "number": "22222222222"
      },
      "phone": {
        "countryCode": "55",
        "areaCode": "11",
        "number": "66778899"
      },
      "shippingAddress": {
        "city": "Sao Paulo",
        "complement": "8",
        "district": "Itaim",
        "street": "Avenida Faria Lima",
        "streetNumber": "2927",
        "zipCode": "01234000",
        "state": "SP",
        "country": "BRA"
      }
    }
    """
    And I send a POST request to "https://sandbox.moip.com.br/v2/customers"
    Then the response status should be "201"
    And print the response
    When I grab "$" as "customer"
    Then the customer "fullname" should be "Jose Silva"
    And the taxDocument "number" should be "22222222222"
    And the phone "number" should be "66778899"
    And the shippingAddress "city" should be "Sao Paulo"

  Scenario: Creating clients with the same ownId
    Given I send and accept JSON
    When I add Headers:
        | Authorization | Basic MDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDE6QUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQg== |
    And I generate ownId and set JSON request body to:
    """
    {
      "ownId": "tempOwnId",
      "fullname": "Jose Silva",
      "email": "jose_silva0@email.com",
      "birthDate": "1988-12-30",
      "taxDocument": {
        "type": "CPF",
        "number": "22222222222"
      },
      "phone": {
        "countryCode": "55",
        "areaCode": "11",
        "number": "66778899"
      },
      "shippingAddress": {
        "city": "Sao Paulo",
        "complement": "8",
        "district": "Itaim",
        "street": "Avenida Faria Lima",
        "streetNumber": "2927",
        "zipCode": "01234000",
        "state": "SP",
        "country": "BRA"
      }
    }
    """
    And I send a POST request to "https://sandbox.moip.com.br/v2/customers"
    Then the response status should be "201"
    Given I send and accept JSON
    When I add Headers:
      | Authorization | Basic MDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDE6QUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQg== |
    And I use the last ownId and set JSON request body to:
    """
    {
      "ownId": "tempOwnId",
      "fullname": "Jose Silva Jr",
      "email": "jose_silva0@email.com",
      "birthDate": "1988-12-30",
      "taxDocument": {
        "type": "CPF",
        "number": "22222222222"
      },
      "phone": {
        "countryCode": "55",
        "areaCode": "11",
        "number": "66778899"
      },
      "shippingAddress": {
        "city": "Sao Paulo",
        "complement": "8",
        "district": "Itaim",
        "street": "Avenida Faria Lima",
        "streetNumber": "2927",
        "zipCode": "01234000",
        "state": "SP",
        "country": "BRA"
      }
    }
    """
    And I send a POST request to "https://sandbox.moip.com.br/v2/customers"
    Then the response status should be "400"
    And print the errors

  Scenario: Try to create a client without fullname
    Given I send and accept JSON
    When I add Headers:
        | Authorization | Basic MDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDE6QUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQg== |
    And I generate ownId and set JSON request body to:
    """
    {
      "ownId": "tempOwnId",
      "fullname": "",
      "email": "jose_silva0@email.com",
      "birthDate": "1988-12-30",
      "taxDocument": {
        "type": "CPF",
        "number": "22222222222"
      },
      "phone": {
        "countryCode": "55",
        "areaCode": "11",
        "number": "66778899"
      },
      "shippingAddress": {
        "city": "Sao Paulo",
        "complement": "8",
        "district": "Itaim",
        "street": "Avenida Faria Lima",
        "streetNumber": "2927",
        "zipCode": "01234000",
        "state": "SP",
        "country": "BRA"
      }
    }
    """
    And I send a POST request to "https://sandbox.moip.com.br/v2/customers"
    Then the response status should be "400"
    And print the errors
