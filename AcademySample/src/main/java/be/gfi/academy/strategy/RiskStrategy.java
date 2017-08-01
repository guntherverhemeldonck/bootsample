package be.gfi.academy.strategy;

import be.gfi.academy.Project;

public interface RiskStrategy {

    public double applyRiskMargin(double amount);
}
