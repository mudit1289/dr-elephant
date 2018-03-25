package com.linkedin.drelephant.analysis;

public class JobDetails {

    private String jobDefId;
    private String jobName;
    private String jobType;
    private String userName;
    private String queueName;
    private String scheduler;
    private String worstHeuristic;
    private Severity severity;
    private long score;
    private int JobRuns;
    private long resourceUsed;
    private long resourceWasted;
    private long totalDelay;

    public JobDetails(){
        this.severity = Severity.NONE;
        this.score = 0;
        this.JobRuns = 0;
        this.resourceUsed = 0;
        this.resourceWasted = 0;
        this.totalDelay =0;
    }

    public Severity getSeverity() {
        return severity;
    }

    public void setSeverity(Severity severity) {
        this.severity = severity;
    }

    public String getJobDefId() {
        return jobDefId;
    }

    public void setJobDefId(String jobDefId) {
        this.jobDefId = jobDefId;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getJobType() {
        return jobType;
    }

    public void setJobType(String jobType) {
        this.jobType = jobType;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getQueueName() {
        return queueName;
    }

    public void setQueueName(String queueName) {
        this.queueName = queueName;
    }

    public String getScheduler() {
        return scheduler;
    }

    public void setScheduler(String scheduler) {
        this.scheduler = scheduler;
    }

    public long getScore() {
        return score;
    }

    public void setScore(long score) {
        this.score = score;
    }

    public int getJobRuns() {
        return JobRuns;
    }

    public void setJobRuns(int jobRuns) {
        JobRuns = jobRuns;
    }

    public long getResourceUsed() {
        return resourceUsed;
    }

    public void setResourceUsed(long resourceUsed) {
        this.resourceUsed = resourceUsed;
    }

    public long getResourceWasted() {
        return resourceWasted;
    }

    public void setResourceWasted(long resourceWasted) {
        this.resourceWasted = resourceWasted;
    }

    public long getTotalDelay() {
        return totalDelay;
    }

    public String getWorstHeuristic() {
        return worstHeuristic;
    }

    public void setWorstHeuristic(String worstHeuristic) {
        this.worstHeuristic = worstHeuristic;
    }

    public void setTotalDelay(long totalDelay) {
        this.totalDelay = totalDelay;

    }
}