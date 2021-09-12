String register = """
mutation register(\$registerInput: CreateUserInput!) {
  register(
    registerInput: \$registerInput
  ) {
    accessToken
    message
    success
  }
}

""";

String login = """
mutation login(\$loginInput: LoginInput!) {
  login(
    loginInput: \$loginInput
  ) {
    user {
      id
      name
      email
      surname
    }
    success
    accessToken
  }
}

""";
