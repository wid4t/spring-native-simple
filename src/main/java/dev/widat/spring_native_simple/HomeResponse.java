package dev.widat.spring_native_simple;

public class HomeResponse {
    private String message;

    public HomeResponse(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
