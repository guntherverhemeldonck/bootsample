package be.gfi.academy;

public class Consultant {
    private String acronym;
    private String name;
    private Role role;
    private double salary;
    private Department department;

    public Consultant(String acronym, String name, Role role, double salary, Department department) {
        this.acronym = acronym;
        this.name = name;
        this.role = role;
        this.salary = salary;
        this.department = department;
    }

    public String getAcronym() {
        return acronym;
    }

    public String getName() {
        return name;
    }

    public Role getRole() {
        return role;
    }

    public double getSalary() {
        return salary;
    }

    public Department getDepartment() {
        return department;
    }
}
