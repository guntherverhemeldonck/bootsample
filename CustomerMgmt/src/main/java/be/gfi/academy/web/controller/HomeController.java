package be.gfi.academy.web.controller;

import be.gfi.academy.dao.CustomerRepository;
import be.gfi.academy.model.Customer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class HomeController {
    private static Logger log = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    private CustomerRepository repo;

    @ResponseBody
    @RequestMapping("/search")
    public List<Customer> search(@RequestParam(name = "q") String qry) {
        return repo.lookupByName(qry);
    }
}