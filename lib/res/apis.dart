class AppAction {
  static final BASE_URL = "http://test.api.sevenbuddies.com/api/v1";

  static final SIGN_UP = BASE_URL + "/accounts/register/";
  static final SIGN_IN = BASE_URL + "/accounts/login/";
  
  static final HEADERS = {
    "Content-Type": "application/json",
    "X-Requested-With": "XMLHttpRequest"
  };
}
