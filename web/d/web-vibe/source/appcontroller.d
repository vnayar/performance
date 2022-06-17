module appcontroller;

import vibe.web.common : path;
import vibe.http.common : HTTPStatusException;
import vibe.http.server : HTTPServerRequest;
import vibe.data.json : deserializeJson;

struct UserRequest {
  string username;
}

@path("/users")
class AppController {
  @path(":username")
  string postData(string _username, HTTPServerRequest request) {
    UserRequest userRequest = request.json().deserializeJson!UserRequest();
    if (_username != userRequest.username) {
      throw new HTTPStatusException(400, "Username does not match!");
    }
    return "OK";
  }
}
