package be.gfi.academy.form;

import org.hibernate.validator.HibernateValidatorFactory;
import org.junit.Before;
import org.junit.Test;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.util.Set;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class TestSessionForm {

    private Validator validator;
    private SessionForm form;

    @Before
    public void setup() {
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        validator = factory.getValidator();
        form = new SessionForm();
    }

    @Test
    public void valid() {
        form.setSession_date("2017-08-02");
        form.setSession_time("09:00");
        form.setPrice(25.0);
        form.setEvaluation("");
        form.setComplaints("");
        Set<ConstraintViolation<SessionForm>> violations = validator.validate(form);
        assertEquals(0, violations.size());
    }

    @Test
    public void invalid() {
        form.setSession_date("1800-08-02");
        form.setSession_time("99:99");
        form.setPrice(-25);
        form.setEvaluation("<script>console.log('Hello world')</script>");
        form.setComplaints("<script>console.log('Hello world')</script>");
        Set<ConstraintViolation<SessionForm>> violations = validator.validate(form);
        assertEquals(5, violations.size());
    }
}
