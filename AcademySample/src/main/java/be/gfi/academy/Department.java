package be.gfi.academy;

public enum Department {
    DIGITAL("Noel Beckers");

    private String manager;

    private Department(String manager) {
        this.manager = manager;
    }

    public String getManager() {
        return manager;
    }
}
