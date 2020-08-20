Feature: Get Users
  Tests for getting existing users.


  Scenario Outline: Get users

    * def responses = read('users.json')

    Given url 'https://jsonplaceholder.typicode.com/posts'
      And params {"id": '##(<id>)', "userId": '##(<userId>)'}
    When method GET
    Then status 200
      And match $ contains only <response>

    Examples:
    | userId | id   | response           |
    | null   | null | responses.allUsers |
    | null   | 1    | responses.id1      |
    | 1      | null | responses.userId1  |
    | -1     | null | []                 |