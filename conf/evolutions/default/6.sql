#
# Copyright 2016 LinkedIn Corp.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.
#

# --- !Ups


CREATE TABLE `check_point` (
  `id`              BIGINT          NOT NULL AUTO_INCREMENT,
  `last_time`       BIGINT          UNSIGNED DEFAULT 0           COMMENT 'the time till which jobs have been fetched from RM',
  PRIMARY KEY (`id`)
);

INSERT INTO check_point (id, last_time)
   VALUES (1,0);


CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME`          varchar(120)    NOT NULL,
  `ENTRY_ID`            varchar(95)     NOT NULL,
  `TRIGGER_NAME`        varchar(200)    NOT NULL,
  `TRIGGER_GROUP`       varchar(200)    NOT NULL,
  `INSTANCE_NAME`       varchar(200)    NOT NULL,
  `FIRED_TIME`          bigint(13)      NOT NULL,
  `SCHED_TIME`          bigint(13)      NOT NULL,
  `PRIORITY`            int(11)         NOT NULL,
  `STATE`               varchar(16)     NOT NULL,
  `JOB_NAME`            varchar(200)    DEFAULT NULL,
  `JOB_GROUP`           varchar(200)    DEFAULT NULL,
  `IS_NONCONCURRENT`    varchar(1)      DEFAULT NULL,
  `REQUESTS_RECOVERY`   varchar(1)      DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME`              varchar(120)        NOT NULL,
  `JOB_NAME`                varchar(200)        NOT NULL,
  `JOB_GROUP`               varchar(200)        NOT NULL,
  `DESCRIPTION`             varchar(250)        DEFAULT NULL,
  `JOB_CLASS_NAME`          varchar(250)        NOT NULL,
  `IS_DURABLE`              varchar(1)          NOT NULL,
  `IS_NONCONCURRENT`        varchar(1)          NOT NULL,
  `IS_UPDATE_DATA`          varchar(1)          NOT NULL,
  `REQUESTS_RECOVERY`       varchar(1)          NOT NULL,
  `JOB_DATA`                blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME`          varchar(120)        NOT NULL,
  `TRIGGER_NAME`        varchar(200)        NOT NULL,
  `TRIGGER_GROUP`       varchar(200)        NOT NULL,
  `JOB_NAME`            varchar(200)        NOT NULL,
  `JOB_GROUP`           varchar(200)        NOT NULL,
  `DESCRIPTION`         varchar(250)        DEFAULT NULL,
  `NEXT_FIRE_TIME`      bigint(13)          DEFAULT NULL,
  `PREV_FIRE_TIME`      bigint(13)          DEFAULT NULL,
  `PRIORITY`            int(11)             DEFAULT NULL,
  `TRIGGER_STATE`       varchar(16)         NOT NULL,
  `TRIGGER_TYPE`        varchar(8)          NOT NULL,
  `START_TIME`          bigint(13)          NOT NULL,
  `END_TIME`            bigint(13)          DEFAULT NULL,
  `CALENDAR_NAME`       varchar(200)        DEFAULT NULL,
  `MISFIRE_INSTR`       smallint(2)         DEFAULT NULL,
  `JOB_DATA`            blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME`      varchar(120)        NOT NULL,
  `LOCK_NAME`       varchar(40)         NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME`          varchar(120)        NOT NULL,
  `TRIGGER_GROUP`       varchar(200)        NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME`              varchar(120)        NOT NULL,
  `INSTANCE_NAME`           varchar(200)        NOT NULL,
  `LAST_CHECKIN_TIME`       bigint(13)          NOT NULL,
  `CHECKIN_INTERVAL`        bigint(13)          NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME`              varchar(120)        NOT NULL,
  `TRIGGER_NAME`            varchar(200)        NOT NULL,
  `TRIGGER_GROUP`           varchar(200)        NOT NULL,
  `REPEAT_COUNT`            bigint(7)           NOT NULL,
  `REPEAT_INTERVAL`         bigint(12)          NOT NULL,
  `TIMES_TRIGGERED`         bigint(10)          NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME`          varchar(120)        NOT NULL,
  `TRIGGER_NAME`        varchar(200)        NOT NULL,
  `TRIGGER_GROUP`       varchar(200)        NOT NULL,
  `STR_PROP_1`          varchar(512)        DEFAULT NULL,
  `STR_PROP_2`          varchar(512)        DEFAULT NULL,
  `STR_PROP_3`          varchar(512)        DEFAULT NULL,
  `INT_PROP_1`          int(11)             DEFAULT NULL,
  `INT_PROP_2`          int(11)             DEFAULT NULL,
  `LONG_PROP_1`         bigint(20)          DEFAULT NULL,
  `LONG_PROP_2`         bigint(20)          DEFAULT NULL,
  `DEC_PROP_1`          decimal(13,4)       DEFAULT NULL,
  `DEC_PROP_2`          decimal(13,4)       DEFAULT NULL,
  `BOOL_PROP_1`         varchar(1)          DEFAULT NULL,
  `BOOL_PROP_2`         varchar(1)          DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME`          varchar(120)        NOT NULL,
  `TRIGGER_NAME`        varchar(200)        NOT NULL,
  `TRIGGER_GROUP`       varchar(200)        NOT NULL,
  `BLOB_DATA`           blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME`          varchar(120)        NOT NULL,
  `CALENDAR_NAME`       varchar(200)        NOT NULL,
  `CALENDAR`            blob                NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME`          varchar(120)        NOT NULL,
  `TRIGGER_NAME`        varchar(200)        NOT NULL,
  `TRIGGER_GROUP`       varchar(200)        NOT NULL,
  `CRON_EXPRESSION`     varchar(200)        NOT NULL,
  `TIME_ZONE_ID`        varchar(80)         DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET session sql_mode = '';

CREATE TABLE `QRTZ_EXECUTIONS` (
  `id`                  bigint(20)              NOT NULL AUTO_INCREMENT,
  `startedAt`           timestamp               NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `completedAt`         timestamp               NOT NULL DEFAULT '0000-00-00 00:00:00',
  `jobName`             varchar(255)            NOT NULL DEFAULT '',
  `succeeded`           tinyint(1)              NOT NULL,
  `jobOutput`           text,
  `jobClass`            varchar(255)            NOT NULL DEFAULT '',
  `clusterName`         varchar(255)            NOT NULL DEFAULT '',
  `host`                varchar(255)            DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE QRTZ_JOB_DETAILS;

DROP TABLE QRTZ_TRIGGERS;

DROP TABLE QRTZ_LOCKS;

DROP TABLE QRTZ_PAUSED_TRIGGER_GRPS;

DROP TABLE QRTZ_SCHEDULER_STATE;

DROP TABLE QRTZ_SIMPLE_TRIGGERS;

DROP TABLE QRTZ_SIMPROP_TRIGGERS;

DROP TABLE QRTZ_BLOB_TRIGGERS;

DROP TABLE QRTZ_CALENDARS;

DROP TABLE QRTZ_CRON_TRIGGERS;

DROP TABLE QRTZ_EXECUTIONS;

DROP TABLE QRTZ_FIRED_TRIGGERS;

DROP TABLE check_point;

SET FOREIGN_KEY_CHECKS=1;

# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions