package models;

public class AppHeuristicSummary {
    private String heuristicName;
    private int totalRunsWithIssues;
    private int criticalRuns;
    private int severeRuns;
    private int moderateRuns;
    private int lowRuns;
    private int normalRuns;

    public AppHeuristicSummary(){
        this.totalRunsWithIssues = 0;
        this.criticalRuns = 0;
        this.severeRuns = 0;
        this.moderateRuns = 0;
        this.lowRuns = 0;
        this.normalRuns = 0;
    }

    public String getHeuristicName() {
        return heuristicName;
    }

    public void setHeuristicName(String heuristicName) {
        this.heuristicName = heuristicName;
    }

    public int getTotalRunsWithIssues() {
        return totalRunsWithIssues;
    }

    public void setTotalRunsWithIssues(int totalRunsWithIssues) {
        this.totalRunsWithIssues = totalRunsWithIssues;
    }

    public int getCriticalRuns() {
        return criticalRuns;
    }

    public void setCriticalRuns(int criticalRuns) {
        this.criticalRuns = criticalRuns;
    }

    public int getSevereRuns() {
        return severeRuns;
    }

    public void setSevereRuns(int severeRuns) {
        this.severeRuns = severeRuns;
    }

    public int getModerateRuns() {
        return moderateRuns;
    }

    public void setModerateRuns(int moderateRuns) {
        this.moderateRuns = moderateRuns;
    }

    public int getLowRuns() {
        return lowRuns;
    }

    public void setLowRuns(int lowRuns) {
        this.lowRuns = lowRuns;
    }

    public int getNormalRuns() {
        return normalRuns;
    }

    public void setNormalRuns(int normalRuns) {
        this.normalRuns = normalRuns;
    }
}