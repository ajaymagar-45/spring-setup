    package com.rainbowforest.Application.controller.admin;


    import org.springframework.security.access.annotation.Secured;
    import org.springframework.stereotype.Controller;
    import org.springframework.web.bind.annotation.GetMapping;
    import org.springframework.web.bind.annotation.RequestMapping;

    @Controller
    public class AdminPageController {

        @GetMapping("admin")
        @Secured(value = {"ROLE_ADMIN"})
        public String adminPage() {
            return "admin/admindashboard";
        }
    }