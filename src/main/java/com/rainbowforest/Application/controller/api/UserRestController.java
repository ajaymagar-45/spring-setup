package com.rainbowforest.Application.controller.api;

import com.rainbowforest.Application.model.constructionSite.ConstructionSite;
import com.rainbowforest.Application.model.user.UserAccount;
import com.rainbowforest.Application.model.user.UserAccountDetails;
import com.rainbowforest.Application.model.user.UserRole;
import com.rainbowforest.Application.repository.UserRoleRepository;
import com.rainbowforest.Application.service.constructionsite.ConstructionSiteService;
import com.rainbowforest.Application.service.user.UserService;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/users")
public class
UserRestController {

    @Autowired
    private UserService userService;

    @Autowired
    private ConstructionSiteService constructionSiteService;

    @Autowired
    private UserRoleRepository roleRepository;

    // ── User Details ──────────────────────────────────────────────

    @GetMapping
    @Secured("ROLE_ADMIN")
    public ResponseEntity<List<UserAccountDetails>> getAll() {
        return ResponseEntity.ok(userService.findAllUsers());
    }

    @GetMapping("/{id}")
    @Secured("ROLE_ADMIN")
    public ResponseEntity<UserAccountDetails> getOne(@PathVariable int id) {
        UserAccountDetails u = userService.findOneById(id);
        return u != null ? ResponseEntity.ok(u) : ResponseEntity.notFound().build();
    }

    @GetMapping("/me")
    public ResponseEntity<User> me() {
        User user = userService.getCurrentUser();
        return ResponseEntity.ok(user);
    }
    @GetMapping("/account")
    @Secured("ROLE_ADMIN")
    public ResponseEntity<UserAccount> getByUsername(@RequestParam String userName) {
        UserAccount u = userService.findOneByUserName(userName);
        return u != null ? ResponseEntity.ok(u) : ResponseEntity.notFound().build();
    }

    @PostMapping
    @Secured({"ROLE_ADMIN"})
    public ResponseEntity<UserAccountDetails> save(@RequestBody UserAccountDetails user) {
        userService.addUserDetails(user);
        return ResponseEntity.ok(user);
    }

    @PutMapping("/{id}")
    @Secured("ROLE_ADMIN")
    public ResponseEntity<Void> update(@PathVariable int id, @RequestBody UserAccountDetails user) {
        Integer csId = user.getConstructionSites() != null ? user.getConstructionSites().getId() : null;
        userService.updateUserDetails(
                user.getFirstName(), user.getLastName(), user.getEmail(),
                user.getPhoneNumber(), user.getPosition(), csId, id);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    @Secured("ROLE_ADMIN")
    public ResponseEntity<Void> delete(@PathVariable int id) {
        userService.deleteUser(id);
        return ResponseEntity.noContent().build();
    }

    @PutMapping("/{id}/password")
    @Secured({"ROLE_ADMIN", "ROLE_USER"})
    public ResponseEntity<Void> updatePassword(@PathVariable int id, @RequestBody Map<String, String> body) {
        userService.updatePassword(body.get("newPassword"), id);
        return ResponseEntity.noContent().build();
    }

    // ── Accounts / Security ───────────────────────────────────────

    @GetMapping("/accounts")
    @Secured("ROLE_ADMIN")
    public ResponseEntity<List<UserAccount>> getAllAccounts() {
        return ResponseEntity.ok(userService.findAllAccount());
    }

    @GetMapping("/accounts/{id}")
    @Secured("ROLE_ADMIN")
    public ResponseEntity<UserAccount> getAccount(@PathVariable int id) {
        UserAccount u = userService.findOneAccountById(id);
        return u != null ? ResponseEntity.ok(u) : ResponseEntity.notFound().build();
    }

    @PutMapping("/accounts/{id}/security")
    @Secured("ROLE_ADMIN")
    public ResponseEntity<Void> updateSecurity(@PathVariable int id, @RequestBody Map<String, Object> body) {
        String rawPassword = (String) body.get("password");
        int enabled = (int) body.get("enabled");
        int roleId = (int) body.get("roleId");
        String encoded = new BCryptPasswordEncoder().encode(rawPassword);
        userService.securityUpdate(encoded, enabled, roleId, id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/roles")
    @Secured("ROLE_ADMIN")
    public ResponseEntity<List<UserRole>> getRoles() {
        // Add findAllRoles() to UserService — see README
        return ResponseEntity.ok(roleRepository.findAll());
    }
}
