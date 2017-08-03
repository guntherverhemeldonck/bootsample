package be.gfi.academy.form;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.SafeHtml;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Getter
@Setter
public class SessionForm {
    @Pattern(regexp = "^(20)\\d\\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$")
    private String session_date;
    @Pattern(regexp = "^([01]?\\d|2[0-3])(:[0-5]\\d){1,2}$")
    private String session_time;
    @Max(999)
    @Min(0)
    private double price;
    @Size(max = 1000)
    @SafeHtml
    private String complaints;
    @Size(max = 1000)
    @SafeHtml
    private String evaluation;
}
