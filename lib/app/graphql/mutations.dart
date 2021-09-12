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
mutation register(\$loginInput: LoginInput!) {
  register(
    loginInput: \$loginInput
  ) {
    accessToken
    success
    user {
      name
      surname
      email
    }
  }
}

""";
