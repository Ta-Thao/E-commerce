package com.spring.finalproject.controller;

import com.spring.finalproject.mail.MailSender;
import com.spring.finalproject.mail.QRCodeGenerator;
import com.spring.finalproject.entity.*;
import com.spring.finalproject.repository.*;
import com.spring.finalproject.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.persistence.ManyToOne;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping(value = "/user")
public class UserController {
    @Autowired
    ProductRepository productRepository;

    @Autowired
    ProductService productService;

    @Autowired
    ProductImagesRepository productImagesRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    CategoryService categoryService;

    @Autowired
    ProductSpecificationRepository productSpecificationRepository;

    @Autowired
    CartRepository cartRepository;

    @Autowired
    CartService cartService;

    @Autowired
    CartDetailsRepository cartDetailsRepository;

    @Autowired
    CartDetailsService cartDetailsService;

    @Autowired
    FeedbackRepository feedbackRepository;

    @Autowired
    FeedbackService feedbackService;

    @Autowired
    ProductPromotionRepository productPromotionRepository;

    @Autowired
    AccountRepository accountRepository;

    @RequestMapping(value = "/index", method = GET)
    public String viewHome(Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }

        AccountEntity account = accountRepository.findByEmailLike(username);
        long id = account.getId();
        model.addAttribute("message", "Hello: " + username);
        model.addAttribute("username", username);
        model.addAttribute("id", id);

        List<ProductEntity> listProduct = productService.getProductList();
        model.addAttribute("productList", listProduct);
        List<ProductImagesEntity> productImagesList = (List<ProductImagesEntity>) productImagesRepository.findAll();
        model.addAttribute("productImagesList", productImagesList);
        model.addAttribute("cateList", categoryService.getCategoryList());
        model.addAttribute("promotion", productPromotionRepository.getListPromotion());

        return "user/index";
    }

    @RequestMapping(value = "/shop", method = GET)
    public String getShop(Model model){
        return listByPage(model, 1);
    }

    @GetMapping("/page/{pageNumber}")
    public String listByPage(Model model, @PathVariable("pageNumber") int currentPage){
        Page<ProductEntity> page = productService.listAll(currentPage);
        long totalItems = page.getTotalElements();
        int totalPages = page.getTotalPages();

        List<ProductEntity> listProduct = page.getContent();

        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalItems", totalItems);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("productList", listProduct);
        return "user/shop";
    }


    @RequestMapping(value = "/search", method = GET)
    public String search(@RequestParam("searchInput")String searchInput, Model model){
        List<ProductEntity> resultList;
        if (searchInput.isEmpty()){
            resultList = (List<ProductEntity>) productRepository.findAll();
        } else{
            resultList = productRepository.findByProNameContainingIgnoreCase(searchInput);
        }

        model.addAttribute("productList", resultList);
        model.addAttribute("searchInput", searchInput);
        return "user/shop";
    }


    @RequestMapping(value = "/viewProduct/{cateId}/{id}", method = GET)
    public String viewProduct(Model model, @PathVariable long id, @PathVariable long cateId){
        model.addAttribute("product", productRepository.getListProductById(id));
        model.addAttribute("proSpec", productSpecificationRepository.getProSpecById(id));
        model.addAttribute("proCate", productRepository.getListProductByCateId(cateId));
        model.addAttribute("comment", new FeedbackEntity());
        model.addAttribute("feedback", feedbackRepository.getFeedbackEntityById(id));
        return "user/single-product";
    }

    @RequestMapping(method = POST, value = "/comment/submit", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String submitComment(FeedbackEntity feedback, @RequestBody String body) {
        feedbackService.submitComment(feedback, body);
        return feedback.getUsername() + "||" + feedback.getContent() + "||" + feedback.getRates() + "||" + feedback.getProductFeedback();
    }

    @GetMapping(value = "/cart")
    public String showCart(Model model){
        return "user/cart";
    }


    @RequestMapping(value = "/checkout", method = GET)
    public String newGuest(Model model){
        model.addAttribute("cart", new CartEntity());
        model.addAttribute("action", "/user/checkout");
        return "user/checkout";
    }

    @RequestMapping(value = "/checkout", method = POST)
    public String checkout(CartEntity carts, @RequestBody String body ){
        cartService.checkout(carts, body);
        return "redirect: /";
    }

    @RequestMapping(value = "/checkout/{id}", method = GET)
    public String userCheckout(Model model, @PathVariable long id){
        AccountEntity account = accountRepository.findById(id);
        CartEntity cart = new CartEntity();
        cart.setCustomerName(account.getFullName());
        cart.setEmail(account.getEmail());
        cart.setAddress(account.getAddress());
        cart.setPhoneNumber(account.getPhoneNumber());
        cartRepository.save(cart);
        model.addAttribute("cart", cart);
        model.addAttribute("action", "/user/checkout");
        return "user/checkout";
    }

    @RequestMapping(value = "user/checkout", method = POST)
    public String userCheckouts(CartEntity cartEntity, @RequestBody String body, @ModelAttribute AccountEntity accountEntity){
        cartService.checkout(cartEntity, body);
        return "redirect:/";
    }

    @RequestMapping(value = "/cart/{id}", method = GET)
    public String viewOrder(Model model, @PathVariable long id){
        List<CartDetailsEntity> cartDetails = cartDetailsRepository.getCartDetails(id);
        model.addAttribute("ordered", cartDetails);
        return "user/home-user";
    }
}
