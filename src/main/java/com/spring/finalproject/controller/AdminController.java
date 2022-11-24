package com.spring.finalproject.controller;

import com.spring.finalproject.entity.AccountEntity;
import com.spring.finalproject.entity.CartDetailsEntity;
import com.spring.finalproject.enums.UserStatus;
import com.spring.finalproject.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.parameters.P;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AccountService accountService;


    @RequestMapping(value = "/home-admin")
    public String viewHomeAdmin(Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("message", "Hello Admin: " + username);
        model.addAttribute("username", username);
        return "admin/home-admin";
    }

    // -------- User Admin ---------
    @RequestMapping(value = "/view-user",method = GET)
    public String viewUser(Model model){
        model.addAttribute("accountList",accountService.viewAllAccount());
        return "admin/view-staff";
    }

    @RequestMapping(value = "/update-user/{id}",method = GET)
    public String editUser(Model model, @PathVariable("id") Long id){

        model.addAttribute("account",accountService.findByAccountId(id));
        model.addAttribute("statusUser", UserStatus.values());
        model.addAttribute("type", "update");
        model.addAttribute("action","/admin/update-user");

        return "admin/update-add-staff";
    }

    @RequestMapping(value = "/update-user",method = POST)
    public String updateUser( @ModelAttribute AccountEntity account ){
        accountService.save(account);
        return "redirect:/admin/view-user";
    }

    @RequestMapping (value = "/delete-user/{id}", method = GET)
    public String deteteUser(@PathVariable Long id){
        accountService.deleteAccount(id);
        return "redirect:/admin/view-user";
    }
}
