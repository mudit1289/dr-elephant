package com.linkedin.drelephant.analysis;

public class HeuristicDetails {

    private String heuristicName;
    private Severity severity;
    private long score;
    private int criticalSeverity;
    private int severeSeverity;
    private int moderateSeverity;

    public HeuristicDetails() {
        this.severity = Severity.NONE;
        this.score = 0;
        this.criticalSeverity = 0;
        this.severeSeverity = 0;
        this.moderateSeverity = 0;

    }

    public String getHeuristicName() {
        return heuristicName;
    }

    public void setHeuristicName(String heuristicName) {
        this.heuristicName = heuristicName;
    }

    public Severity getSeverity() {
        return severity;
    }

    public void setSeverity(Severity severity) {
        this.severity = severity;
    }

    public long getScore() {
        return score;
    }

    public void setScore(long score) {
        this.score = score;
    }

    public int getCriticalSeverity() {
        return criticalSeverity;
    }

    public void setCriticalSeverity(int criticalSeverity) {
        this.criticalSeverity = criticalSeverity;
    }

    public int getSevereSeverity() {
        return severeSeverity;
    }

    public void setSevereSeverity(int severeSeverity) {
        this.severeSeverity = severeSeverity;
    }

    public int getModerateSeverity() {
        return moderateSeverity;
    }

    public void setModerateSeverity(int moderateSeverity) {
        this.moderateSeverity = moderateSeverity;
    }
}

