package be.gfi.academy;


import com.sun.org.apache.bcel.internal.classfile.ConstantLong;

public class Effort {
    private int mandays;
    private Consultant consultant;

    public Effort(int mandays, Consultant consultant) {
        this.mandays = mandays;
        this.consultant = consultant;
    }

    public int getMandays() {
        return mandays;
    }

    public Consultant getConsultant() {
        return consultant;
    }
}
