package com.rainbowforest.Application.controller.api;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.rainbowforest.Application.model.constructionSite.ConstructionSite;
import com.rainbowforest.Application.model.constructionSite.ConstructionSiteAdress;
import com.rainbowforest.Application.service.constructionsite.ConstructionSiteService;
import com.rainbowforest.Application.utilities.UserUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/construction-sites")
@Secured({"ROLE_ADMIN", "ROLE_USER"})
@JsonIgnoreProperties({"constructionSite", "hibernateLazyInitializer", "handler"})
public class ConstructionSiteRestController {

    @Autowired
    private ConstructionSiteService constructionSiteService;

    @GetMapping
    public ResponseEntity<List<ConstructionSite>> getAll() {
        return ResponseEntity.ok(constructionSiteService.findAllConstructionSite());
    }

    @GetMapping("/my")
    public ResponseEntity<List<ConstructionSite>> getMy() {
        String userName = UserUtilities.getLoggedUser();
        return ResponseEntity.ok(constructionSiteService.getAllConstructionSiteByUserName(userName));
    }


    @GetMapping("/{id}")
    public ResponseEntity<ConstructionSite> getOne(@PathVariable int id) {
        ConstructionSite cs = constructionSiteService.findOneCsById(id);
        return cs != null ? ResponseEntity.ok(cs) : ResponseEntity.notFound().build();
    }

    @PostMapping
    @Secured("ROLE_ADMIN")
    public ResponseEntity<ConstructionSite> save(@RequestBody ConstructionSite cs) {
        if (cs.getConstructionSiteAdress() == null) {
            cs.setConstructionSiteAdress(new ConstructionSiteAdress());
        }
        constructionSiteService.addConstructionSite(cs);
        return ResponseEntity.ok(cs);
    }

    @PutMapping("/{id}")
    @Secured("ROLE_ADMIN")
    public ResponseEntity<ConstructionSite> update(@PathVariable int id, @RequestBody ConstructionSite cs) {
        constructionSiteService.updateConstructionSite(cs.getBuildingName(), cs.getBuildingCode(), cs.getStatus(), id);
        if (cs.getConstructionSiteAdress() != null) {
            ConstructionSiteAdress addr = cs.getConstructionSiteAdress();
            constructionSiteService.updateConstructionSiteAdress(
                    addr.getStreet(), addr.getStreetNumber(), addr.getLocality(),
                    addr.getZipCode(), addr.getCountry(), id);
        }
        return ResponseEntity.ok(cs);
    }

    @DeleteMapping("/{id}")
    @Secured("ROLE_ADMIN")
    public ResponseEntity<Void> delete(@PathVariable int id) {
        // Add deleteConstructionSite to service if not present
        return ResponseEntity.noContent().build();
    }
}
