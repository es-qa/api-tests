# api-tests
## Running Tests
From IntelliJ IDE tests can be run by right clicking the ParallelRunner
and selecting the `Run` option.

From commandline they can be executed using Maven:
`mvn test -Dtest=ParallelRunner`

## Karate Syntax
There are a number of Karate specific features utilized in these tests:

`##` signifies a value or field is optional, and if set to `null` will be ignored.

`$` is short for **response**

Karate does not allow interdependent code to span more than one line, hence
triple quotes can be used when code is meant to format across multiple lines.

`contains only` will compare every key/value pair in the response to ensure they match,
and are all that is returned.  Additional or missing key/values will cause the assert to fail.