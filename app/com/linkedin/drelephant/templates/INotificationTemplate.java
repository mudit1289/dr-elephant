package com.linkedin.drelephant.templates;

import java.util.List;

public interface INotificationTemplate {

    String getPayload(String jobType, List<String> jobDefIds);
}
