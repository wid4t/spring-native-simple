package dev.widat.spring_native_simple;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {
    @GetMapping("")
    public HomeResponse home(){
        return new HomeResponse("Hello, Native!");
    }
}