package com.linkedin.drelephant.notifications;

import java.util.List;
import java.util.Map;

public interface INotificationService {

    void sendNotification(Map<String, List<String>> nameSpaceToJobDefIdMap);
}
