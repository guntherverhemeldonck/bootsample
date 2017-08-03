package be.gfi.academy.form;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Getter
@Setter
public class CustomerForm {
    @Size(max = 75)
    @NotNull
    private String firstname;
    @Size(max = 120)
    @NotNull
    private String lastname;
    @Size(max = 50)
    private String phone;
    @Size(max = 255)
    @Email
    private String email;
    @Size(max = 255)
    private String address;
    @Size(max = 30)
    private String postalcode;
    @Size(max = 255)
    private String city;
    @Size(max = 255)
    private String description;
}
