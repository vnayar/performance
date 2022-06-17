package com.example.web;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.http.HttpStatus;

class UserRequest {
  String username;
}

@RestController
@RequestMapping(path = "/users")
public class WebController {
  @PostMapping("{username}")
  String postUser(@PathVariable String username, @RequestBody UserRequest userRequest) {
    if (username != userRequest.username) {
      throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Username does not match!");
    }
    return "OK";
  }
}
