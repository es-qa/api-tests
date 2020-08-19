Feature: Create User
  Tests for creating a user


  Background:

  * url 'https://jsonplaceholder.typicode.com/posts'


  Scenario Outline: Create user

    Given request
    """
    {
      "title": '##(<title>)',
      "body": '##(<body>)',
      "userId": '##(<userId>)'
    }
    """
    When method POST
    #Should this really be an async call?
    Then status 201
      And match $.id == 101
      And match $.title == '##(<title>)'
      And match $.body == '##(<body>)'
      And match $.userId == '##(<userId>)'

    Examples:
    | title       | body             | userId |
    | "Moby Dick" | "Call me Ismael" | 1      |
    | ""          | ""               | 0      |
    | null        | null             | 100    |


  Scenario Outline: Create user(negative)

    Given request
    """
    {
      "title": '##(<title>)',
      "body": '##(<body>)',
      "userId": '##(<userId>)',
      "extraField": '##(<extraField>)'
    }
    """
    When method POST
    Then status 400
      And match $.error == "Bad request"
      And match $.errorMessage == "Invalid key or value sent."

    Examples:
      | title       | body             | userId | extraField    |
      #Endpoint should not accept random keys in request
      | "Moby Dick" | "Call me Ismael" | 1      | "Extra value" |
      #Expect type enforcement on userId rather than returning whatever type is passed in.
      | ""          | ""               | ""     | null          |
      #At least userId should be required for a successful POST.
      | null        | null             | null   | null          |
      #Again type enforcement.
      | true        | null             | 1      | null          |