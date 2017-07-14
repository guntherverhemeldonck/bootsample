package be.gfi.academy;

public enum Role {
    JUNIOR_JAVA(450), SENIOR_JAVA(650), ARCHITECT_JAVA(850);

    private final double costPerDay;

    private Role(double costPerDay){
        this.costPerDay = costPerDay;
    }

    public double getCostPerDay(){
        return costPerDay;
    }
}
