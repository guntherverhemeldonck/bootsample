package be.gfi.academy.web.controller;

import be.gfi.academy.dao.CustomerRepository;
import be.gfi.academy.dao.SessionRepository;
import be.gfi.academy.model.Customer;
import be.gfi.academy.model.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class CustomerController {
    private static Logger log = LoggerFactory.getLogger(CustomerController.class);

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private SessionRepository sessionRepository;

    @RequestMapping(value = "/customer/{id}", method = RequestMethod.GET)
    public String getCustomerById(@PathVariable long id, Model model) {
        log.info("Customer details for {}", id);
        model.addAttribute("customer", customerRepository.findOne(id));
        model.addAttribute("sessions", sessionRepository.findAllForCustomer(id));
        return "customer";
    }

    @RequestMapping(value = "/customer", method = RequestMethod.POST)
    public String createCustomerAndSession(final Customer customer, final Session session,
                                           @RequestParam(name = "session_date") String date,
                                           @RequestParam(name = "session_time") String time,
                                           final RedirectAttributes redirectAttribs) throws Exception {

        log.info("Creating customer ...");
        String flash = "Klant werd aangemaakt.";
        customer.setCreatedAt(new Date());
        customer.setActive(true);
        final Customer cust = customerRepository.save(customer);

        if (!StringUtils.isEmpty(date) && !StringUtils.isEmpty(time)) {
            final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            final Date sessionDate = sdf.parse(date + " " + time);
            session.setSessionDate(sessionDate);
            session.setCustomerId(cust.getId());
            session.setCreatedAt(new Date());
            sessionRepository.save(session);
            flash += "<br>Sessie werd toegevoegd.";
        }

        redirectAttribs.addFlashAttribute("success", flash);
        return "redirect:/customer/" + cust.getId();
    }

    @RequestMapping(value = "/customer/{id}", method = RequestMethod.POST)
    public String updateCustomer(@PathVariable(name = "id") long id, final Customer customer,
                                 final RedirectAttributes redirectAttribs) {

        log.info("Updating customer {}", id);
        customerRepository.save(customer);
        redirectAttribs.addAttribute("id", id).addFlashAttribute("success", "Klant werd gewijzigd.");
        return "redirect:/customer/{id}";
    }

    @RequestMapping(value = "/customer/{id}/session/{sid}", method = RequestMethod.POST)
    public String updateSession(@PathVariable(name = "id") long custId,
                                @PathVariable(name = "sid") long sid,
                                Session session,
                                RedirectAttributes redirectAttribs) throws Exception {

        log.info("Update session ...");
        final Session dbSession = sessionRepository.findOne(sid);
        dbSession.setPrice(session.getPrice());
        dbSession.setEvaluation(session.getEvaluation());
        dbSession.setComplaints(session.getComplaints());
        session.setUpdatedAt(new Date());
        sessionRepository.save(dbSession);
        redirectAttribs.addFlashAttribute("success", "Sessie werd gewijzigd.");
        return "redirect:/customer/" + custId;
    }

    @RequestMapping(value = "/customer/{id}/session", method = RequestMethod.POST)
    public String addSession(@PathVariable(name = "id") long custId,
                             @RequestParam(name = "session_date") String date,
                             @RequestParam(name = "session_time") String time,
                             Session session,
                             RedirectAttributes redirectAttribs) throws Exception {

        log.info("Create session for user {} ...", custId);
        final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        final Date sessionDate = sdf.parse(date + " " + time);
        session.setCustomerId(custId);
        session.setSessionDate(sessionDate);
        session.setCreatedAt(new Date());

        sessionRepository.save(session);

        redirectAttribs.addFlashAttribute("success", "Sessie werd toegevoegd.");
        return "redirect:/customer/" + custId;
    }
}