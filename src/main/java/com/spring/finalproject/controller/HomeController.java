package com.spring.finalproject.controller;

import com.spring.finalproject.entity.*;
import com.spring.finalproject.enums.CartStatus;
import com.spring.finalproject.repository.*;
import com.spring.finalproject.service.AccountService;
import com.spring.finalproject.service.CartService;
import com.spring.finalproject.service.CategoryService;
import com.spring.finalproject.service.ProductService;
import com.spring.finalproject.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping("/")

public class HomeController {

    @Autowired
    ProductService productService;

    @Autowired
    ProductImagesRepository productImagesRepository;


    @Autowired
    CategoryService categoryService;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    CartRepository cartRepository;

    @Autowired
    CartDetailsRepository cartDetailsRepository;

    @Autowired
    ProductPromotionRepository productPromotionRepository;

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    AccountService accountService;

    @Autowired
    AccountRoleRepository accountRoleRepository;


    @RequestMapping(value = {"/","/home"},  method = GET)
    public String getProduct(Model model){
        List<ProductEntity> listProduct = productService.getProductList();
        model.addAttribute("productList", listProduct);
        List<ProductImagesEntity> productImagesList = (List<ProductImagesEntity>) productImagesRepository.findAll();
        model.addAttribute("productImagesList", productImagesList);
        model.addAttribute("cateList", categoryService.getCategoryList());
        model.addAttribute("promotion", productPromotionRepository.getListPromotion());

        List<String> roles = SecurityUtils.getRolesOfUser();
        if (!CollectionUtils.isEmpty(roles) && roles.contains("ROLE_ADMIN")) {
            return "redirect:/admin/home-admin";
        }else if (!CollectionUtils.isEmpty(roles) && roles.contains("ROLE_MANAGER")){
            return "redirect:/management/home-management";
        } else if (!CollectionUtils.isEmpty(roles) && roles.contains("ROLE_USER")){
            return "redirect:/user/index";
        }
        return "login/index";
    }

    @RequestMapping("/")
    public String promotion(Model model){
        model.addAttribute("promotion", productPromotionRepository.getListPromotion());
        return "include/user/slider-header";
    }

    @RequestMapping("/login")
    public String loginPage (Model model) {
        return "login/login";
    }

    @RequestMapping(value = "/logout", method = GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/register", method = GET)
    public String registerPage(Model model){
        model.addAttribute("account", new AccountEntity());
        model.addAttribute("mess", "Registration");
        model.addAttribute("action", "register");
        return "login/register";
    }

    @RequestMapping(value = "/register", method = POST, produces = "text/plain;charset=UTF-8")
    public String newAccount(AccountEntity account){
        accountService.createAccount(account);
        return "login/login";
    }

    @RequestMapping(value = "/edit/{id}", method = GET)
    public String showEditAccount(Model model, @PathVariable long id){
        AccountEntity account = accountRepository.findById(id);
        account.setPassword("");
        model.addAttribute("account", account);
        model.addAttribute("mess", "Update Information");
        model.addAttribute("type", "update");
        model.addAttribute("action", "updateAccount");
        return "login/register";
    }

    @RequestMapping(value = "/edit/updateAccount", method = POST, produces = "text/plain;charset=UTF-8")
    public String updateAccount(@ModelAttribute AccountEntity account){
        account.setPassword(accountService.encrytePassword(account.getPassword()));
        accountRepository.save(account);
        return "redirect: /";
    }

    @RequestMapping(value = "/403")
    public String accessDenied (){
        return "login/403";
    }
}



