package com.xypay.xypay.controller;

import com.xypay.xypay.domain.WorkflowDefinition;
import com.xypay.xypay.service.WorkflowService;
import org.springframework.web.bind.annotation.*;
import java.security.Principal;
import java.util.List;

@RestController
@RequestMapping("/api/workflows")
public class WorkflowController {
    private final WorkflowService service;
    public WorkflowController(WorkflowService service) { this.service = service; }

    @GetMapping
    public List<WorkflowDefinition> list(Principal principal) {
        return service.findByOwner(principal.getName());
    }

    @GetMapping("/all")
    public List<WorkflowDefinition> all() { return service.findAll(); }

    @GetMapping("/{id}")
    public WorkflowDefinition get(@PathVariable Long id) { return service.findById(id); }

    @PostMapping
    public WorkflowDefinition save(@RequestBody WorkflowDefinition def, Principal principal) {
        def.setOwner(principal.getName());
        return service.save(def);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) { service.save(null); }
}
