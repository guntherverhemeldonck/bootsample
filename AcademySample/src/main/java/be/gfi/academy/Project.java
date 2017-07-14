package be.gfi.academy;

import be.gfi.academy.strategy.RiskStrategy;
import com.sun.xml.internal.bind.v2.runtime.reflect.opt.Const;

import java.util.Collections;
import java.util.List;

public class Project {
    private String customerName;
    private String projectName;
    private List<Effort> efforts;
    private double totalCost;

    public Project(String customerName, String projectName, List<Effort> efforts) {
        this.customerName = customerName;
        this.projectName = projectName;
        this.efforts = efforts;
    }

    public String getCustomerName() {
        return customerName;
    }

    public String getProjectName() {
        return projectName;
    }

    public List<Effort> getEfforts() {
        return Collections.unmodifiableList(efforts);
    }

    public double getTotalCost() {
        return totalCost;
    }
}
