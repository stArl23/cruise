create table berth
(
    id           varchar(64)      not null
        primary key,
    s_number     int default 0    null comment 'serial number for all ships',
    is_available bit default b'1' null,
    constraint s_number_UNIQUE
        unique (s_number)
)
    comment 'berthes for all ship';

INSERT INTO cruise_ship_management.berth (id, s_number, is_available)
VALUES ('1546571733643172407', 1, true);
INSERT INTO cruise_ship_management.berth (id, s_number, is_available)
VALUES ('1546571733993382182', 2, true);
INSERT INTO cruise_ship_management.berth (id, s_number, is_available)
VALUES ('1546571734006547300', 3, true);
INSERT INTO cruise_ship_management.berth (id, s_number, is_available)
VALUES ('1546571734032723011', 4, true);
INSERT INTO cruise_ship_management.berth (id, s_number, is_available)
VALUES ('1546571734057987602', 5, true);
INSERT INTO cruise_ship_management.berth (id, s_number, is_available)
VALUES ('1546571734079297141', 6, true);
INSERT INTO cruise_ship_management.berth (id, s_number, is_available)
VALUES ('1546571734099492893', 7, true);
INSERT INTO cruise_ship_management.berth (id, s_number, is_available)
VALUES ('1546571734120294366', 8, true);
INSERT INTO cruise_ship_management.berth (id, s_number, is_available)
VALUES ('1546571734131329444', 9, true);
create table record
(
    id             varchar(64)             not null
        primary key,
    start_berth    int                     null,
    arrive_berth   int                     null,
    ship_name      varchar(16)             null,
    ship_traffic   int                     null,
    arrive_time    time                    null,
    on_or_out_time time default '00:00:05' null comment 'time needed for all customers get in or get out of ships',
    total_time     time                    null comment 'total time needed for this round ship trip',
    date           date                    null,
    start_time     time                    null
)
    comment 'everyday ship records';

INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707752995868013', 1, 5, 'S1', 100, '07:15:00', '00:06:40', '00:18:20', '2019-03-04', '07:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707752997661925', 2, 6, 'B5', 200, '07:20:00', '00:13:20', '00:21:40', '2019-03-04', '07:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707752998536702', 1, 5, 'S2', 100, '07:25:00', '00:06:40', '00:18:20', '2019-03-04', '07:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753002652560', 1, 7, 'S4', 100, '07:30:00', '00:06:40', '00:18:20', '2019-03-04', '07:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753003322872', 1, 5, 'S8', 100, '07:35:00', '00:06:40', '00:18:20', '2019-03-04', '07:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753006883082', 2, 6, 'B1', 200, '07:40:00', '00:13:20', '00:21:40', '2019-03-04', '07:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753009804366', 1, 5, 'S5', 100, '07:45:00', '00:06:40', '00:18:20', '2019-03-04', '07:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753012348344', 2, 7, 'B2', 200, '07:50:00', '00:13:20', '00:21:40', '2019-03-04', '07:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753014456608', 5, 1, 'S1', 100, '07:36:40', '00:06:40', '00:18:20', '2019-03-04', '07:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753015948648', 6, 1, 'B5', 200, '07:48:20', '00:13:20', '00:21:40', '2019-03-04', '07:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753018990392', 5, 2, 'S2', 100, '07:46:40', '00:06:40', '00:18:20', '2019-03-04', '07:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753028378063', 7, 3, 'S4', 100, '07:51:40', '00:06:40', '00:18:20', '2019-03-04', '07:36:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753029377009', 5, 2, 'S8', 100, '07:56:40', '00:06:40', '00:18:20', '2019-03-04', '07:41:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753030283391', 6, 1, 'B1', 200, '08:08:20', '00:13:20', '00:21:40', '2019-03-04', '07:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753034963569', 5, 2, 'S5', 100, '08:06:40', '00:06:40', '00:18:20', '2019-03-04', '07:51:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753035170350', 7, 2, 'B2', 200, '08:18:20', '00:13:20', '00:21:40', '2019-03-04', '08:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753036302748', 1, 5, 'B3', 200, '08:05:00', '00:13:20', '00:21:40', '2019-03-04', '07:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753036979227', 1, 6, 'S3', 100, '08:10:00', '00:06:40', '00:18:20', '2019-03-04', '07:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753042780704', 1, 7, 'S6', 100, '08:15:00', '00:06:40', '00:18:20', '2019-03-04', '08:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753042956719', 2, 5, 'B4', 200, '08:20:00', '00:13:20', '00:21:40', '2019-03-04', '08:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753046889493', 1, 6, 'S7', 100, '08:25:00', '00:06:40', '00:18:20', '2019-03-04', '08:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753049437369', 1, 7, 'S5', 100, '08:30:00', '00:06:40', '00:18:20', '2019-03-04', '08:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753051460463', 1, 5, 'S7', 100, '08:35:00', '00:06:40', '00:18:20', '2019-03-04', '08:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753054292896', 5, 1, 'B3', 200, '08:33:20', '00:13:20', '00:21:40', '2019-03-04', '08:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753054481907', 6, 2, 'S3', 100, '08:31:40', '00:06:40', '00:18:20', '2019-03-04', '08:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753054679557', 1, 6, 'S2', 100, '08:40:00', '00:06:40', '00:18:20', '2019-03-04', '08:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753055180607', 7, 3, 'S6', 100, '08:36:40', '00:06:40', '00:18:20', '2019-03-04', '08:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753059660114', 5, 1, 'B4', 200, '08:48:20', '00:13:20', '00:21:40', '2019-03-04', '08:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753060171878', 5, 2, 'S7', 100, '08:56:40', '00:06:40', '00:18:20', '2019-03-04', '08:41:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753060238192', 6, 2, 'S7', 100, '08:46:40', '00:06:40', '00:18:20', '2019-03-04', '08:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753060616340', 6, 3, 'S2', 100, '09:01:40', '00:06:40', '00:18:20', '2019-03-04', '08:46:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753060969378', 7, 3, 'S5', 100, '08:51:40', '00:06:40', '00:18:20', '2019-03-04', '08:36:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753061368842', 1, 5, 'S1', 100, '08:55:00', '00:06:40', '00:18:20', '2019-03-04', '08:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753061675148', 1, 6, 'S4', 100, '09:00:00', '00:06:40', '00:18:20', '2019-03-04', '08:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753064164413', 1, 5, 'S8', 100, '09:05:00', '00:06:40', '00:18:20', '2019-03-04', '08:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753065204726', 1, 6, 'S6', 100, '09:10:00', '00:06:40', '00:18:20', '2019-03-04', '08:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753065252323', 1, 5, 'S3', 100, '09:15:00', '00:06:40', '00:18:20', '2019-03-04', '09:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753065731431', 2, 7, 'B1', 200, '09:30:00', '00:13:20', '00:21:40', '2019-03-04', '09:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753065838562', 4, 6, 'B4', 200, '09:20:00', '00:13:20', '00:21:40', '2019-03-04', '09:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753065934948', 1, 5, 'B5', 200, '09:25:00', '00:13:20', '00:21:40', '2019-03-04', '09:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753066498884', 5, 1, 'S1', 100, '09:16:40', '00:06:40', '00:18:20', '2019-03-04', '09:01:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753066725758', 6, 2, 'S4', 100, '09:21:40', '00:06:40', '00:18:20', '2019-03-04', '09:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753066919577', 5, 1, 'S8', 100, '09:26:40', '00:06:40', '00:18:20', '2019-03-04', '09:11:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753067770729', 5, 1, 'S3', 100, '09:36:40', '00:06:40', '00:18:20', '2019-03-04', '09:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753067956478', 6, 1, 'B4', 200, '09:48:20', '00:13:20', '00:21:40', '2019-03-04', '09:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753067971169', 6, 2, 'S6', 100, '09:31:40', '00:06:40', '00:18:20', '2019-03-04', '09:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753068149109', 7, 3, 'B1', 200, '09:58:20', '00:13:20', '00:21:40', '2019-03-04', '09:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753068221374', 5, 2, 'B5', 200, '09:53:20', '00:13:20', '00:21:40', '2019-03-04', '09:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753068611935', 1, 7, 'S6', 100, '09:55:00', '00:06:40', '00:18:20', '2019-03-04', '09:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753068840740', 1, 5, 'B2', 200, '09:45:00', '00:13:20', '00:21:40', '2019-03-04', '09:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753068848477', 2, 6, 'B3', 200, '09:50:00', '00:13:20', '00:21:40', '2019-03-04', '09:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753069255399', 1, 5, 'S3', 100, '10:10:00', '00:06:40', '00:18:20', '2019-03-04', '09:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753069448862', 1, 6, 'S2', 100, '10:15:00', '00:06:40', '00:18:20', '2019-03-04', '10:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753069576372', 1, 5, 'S7', 100, '10:20:00', '00:06:40', '00:18:20', '2019-03-04', '10:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753069785656', 1, 5, 'S5', 100, '10:00:00', '00:06:40', '00:18:20', '2019-03-04', '09:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753069897036', 1, 6, 'S1', 100, '10:05:00', '00:06:40', '00:18:20', '2019-03-04', '09:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753069915843', 5, 1, 'B2', 200, '10:13:20', '00:13:20', '00:21:40', '2019-03-04', '09:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753070102810', 6, 2, 'S2', 100, '10:36:40', '00:06:40', '00:18:20', '2019-03-04', '10:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753070129481', 6, 2, 'B3', 200, '10:18:20', '00:13:20', '00:21:40', '2019-03-04', '10:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753070386144', 6, 3, 'S1', 100, '10:26:40', '00:06:40', '00:18:20', '2019-03-04', '10:11:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753070551915', 7, 3, 'S6', 100, '10:16:40', '00:06:40', '00:18:20', '2019-03-04', '10:01:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753070646649', 5, 1, 'S7', 100, '10:41:40', '00:06:40', '00:18:20', '2019-03-04', '10:26:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753070668318', 5, 1, 'S3', 100, '10:31:40', '00:06:40', '00:18:20', '2019-03-04', '10:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753070892216', 5, 4, 'S5', 100, '10:21:40', '00:06:40', '00:18:20', '2019-03-04', '10:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753071125546', 1, 6, 'S1', 100, '11:00:00', '00:06:40', '00:18:20', '2019-03-04', '10:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753071149312', 1, 5, 'S8', 100, '10:35:00', '00:06:40', '00:18:20', '2019-03-04', '10:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753071668714', 1, 6, 'S4', 100, '10:50:00', '00:06:40', '00:18:20', '2019-03-04', '10:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753071724340', 1, 5, 'S8', 100, '10:45:00', '00:06:40', '00:18:20', '2019-03-04', '10:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753071747528', 1, 6, 'S4', 100, '10:40:00', '00:06:40', '00:18:20', '2019-03-04', '10:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753071980815', 1, 5, 'S3', 100, '10:55:00', '00:06:40', '00:18:20', '2019-03-04', '10:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753072389720', 1, 5, 'S6', 100, '11:05:00', '00:06:40', '00:18:20', '2019-03-04', '10:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753083177706', 1, 6, 'S2', 100, '11:20:00', '00:06:40', '00:18:20', '2019-03-04', '11:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753083257359', 6, 2, 'S4', 100, '11:11:40', '00:06:40', '00:18:20', '2019-03-04', '10:56:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753083283548', 5, 1, 'S8', 100, '11:06:40', '00:06:40', '00:18:20', '2019-03-04', '10:51:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753083351146', 6, 2, 'S5', 100, '11:31:40', '00:06:40', '00:18:20', '2019-03-04', '11:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753083364598', 6, 3, 'S4', 100, '11:01:40', '00:06:40', '00:18:20', '2019-03-04', '10:46:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753083378943', 6, 2, 'S1', 100, '11:21:40', '00:06:40', '00:18:20', '2019-03-04', '11:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753083538587', 1, 6, 'S5', 100, '11:10:00', '00:06:40', '00:18:20', '2019-03-04', '10:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753083776979', 5, 1, 'S3', 100, '11:16:40', '00:06:40', '00:18:20', '2019-03-04', '11:01:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753083813142', 5, 2, 'S8', 100, '10:56:40', '00:06:40', '00:18:20', '2019-03-04', '10:41:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753083883087', 5, 1, 'S6', 100, '11:26:40', '00:06:40', '00:18:20', '2019-03-04', '11:11:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753083909759', 1, 5, 'S7', 100, '11:15:00', '00:06:40', '00:18:20', '2019-03-04', '11:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753084166996', 1, 7, 'B2', 200, '11:35:00', '00:13:20', '00:21:40', '2019-03-04', '11:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753084361838', 2, 6, 'B4', 200, '11:30:00', '00:13:20', '00:21:40', '2019-03-04', '11:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753084502241', 1, 5, 'B3', 200, '11:25:00', '00:13:20', '00:21:40', '2019-03-04', '11:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753084568046', 5, 1, 'S7', 100, '11:36:40', '00:06:40', '00:18:20', '2019-03-04', '11:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753084654341', 6, 2, 'S2', 100, '11:41:40', '00:06:40', '00:18:20', '2019-03-04', '11:26:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753084787410', 2, 5, 'B1', 200, '11:40:00', '00:13:20', '00:21:40', '2019-03-04', '11:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753085131850', 5, 1, 'B3', 200, '11:53:20', '00:13:20', '00:21:40', '2019-03-04', '11:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753085808709', 6, 2, 'B4', 200, '11:58:20', '00:13:20', '00:21:40', '2019-03-04', '11:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753085868458', 1, 6, 'B5', 200, '11:45:00', '00:13:20', '00:21:40', '2019-03-04', '11:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753086108815', 1, 6, 'S4', 100, '12:40:00', '00:06:40', '00:18:20', '2019-03-04', '12:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753086187501', 1, 6, 'S3', 100, '12:30:00', '00:06:40', '00:18:20', '2019-03-04', '12:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753086238263', 1, 5, 'S5', 100, '12:45:00', '00:06:40', '00:18:20', '2019-03-04', '12:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753086313334', 7, 3, 'B2', 200, '12:03:20', '00:13:20', '00:21:40', '2019-03-04', '11:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753086392819', 6, 2, 'B5', 200, '12:13:20', '00:13:20', '00:21:40', '2019-03-04', '11:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753086494241', 1, 5, 'S2', 100, '12:15:00', '00:06:40', '00:18:20', '2019-03-04', '12:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753086599989', 1, 6, 'S1', 100, '12:20:00', '00:06:40', '00:18:20', '2019-03-04', '12:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753086853972', 5, 1, 'B1', 200, '12:08:20', '00:13:20', '00:21:40', '2019-03-04', '11:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753086953698', 1, 5, 'S7', 100, '12:25:00', '00:06:40', '00:18:20', '2019-03-04', '12:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753086967597', 1, 5, 'S8', 100, '12:35:00', '00:06:40', '00:18:20', '2019-03-04', '12:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753087120110', 1, 6, 'S6', 100, '12:50:00', '00:06:40', '00:18:20', '2019-03-04', '12:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753087292226', 6, 2, 'S1', 100, '12:41:40', '00:06:40', '00:18:20', '2019-03-04', '12:26:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753087522664', 5, 1, 'S8', 100, '12:56:40', '00:06:40', '00:18:20', '2019-03-04', '12:41:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753087569798', 6, 2, 'S4', 100, '13:01:40', '00:06:40', '00:18:20', '2019-03-04', '12:46:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753087651728', 5, 1, 'S7', 100, '12:46:40', '00:06:40', '00:18:20', '2019-03-04', '12:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753087895103', 5, 1, 'S2', 100, '12:36:40', '00:06:40', '00:18:20', '2019-03-04', '12:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753087955765', 2, 5, 'B5', 200, '12:55:00', '00:13:20', '00:21:40', '2019-03-04', '12:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753087999010', 6, 2, 'S3', 100, '12:51:40', '00:06:40', '00:18:20', '2019-03-04', '12:36:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753088117168', 6, 2, 'S6', 100, '13:11:40', '00:06:40', '00:18:20', '2019-03-04', '12:56:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753088118641', 5, 1, 'S5', 100, '13:06:40', '00:06:40', '00:18:20', '2019-03-04', '12:51:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753088194758', 5, 1, 'B5', 200, '13:23:20', '00:13:20', '00:21:40', '2019-03-04', '13:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753088320706', 2, 5, 'B1', 200, '13:10:00', '00:13:20', '00:21:40', '2019-03-04', '12:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753088566552', 1, 6, 'B3', 200, '13:05:00', '00:13:20', '00:21:40', '2019-03-04', '12:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753089219957', 1, 7, 'B2', 200, '13:15:00', '00:13:20', '00:21:40', '2019-03-04', '13:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753090114307', 5, 4, 'S6', 100, '13:46:40', '00:06:40', '00:18:20', '2019-03-04', '13:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753090191861', 7, 3, 'B2', 200, '13:43:20', '00:13:20', '00:21:40', '2019-03-04', '13:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753090205884', 6, 1, 'B3', 200, '13:33:20', '00:13:20', '00:21:40', '2019-03-04', '13:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753090233285', 1, 5, 'S6', 100, '13:25:00', '00:06:40', '00:18:20', '2019-03-04', '13:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753090416831', 2, 6, 'B4', 200, '13:20:00', '00:13:20', '00:21:40', '2019-03-04', '13:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753090492575', 6, 1, 'B4', 200, '13:48:20', '00:13:20', '00:21:40', '2019-03-04', '13:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753090613131', 1, 7, 'S3', 100, '13:30:00', '00:06:40', '00:18:20', '2019-03-04', '13:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753090802446', 1, 5, 'S5', 100, '13:55:00', '00:06:40', '00:18:20', '2019-03-04', '13:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753090831795', 5, 2, 'B1', 200, '13:38:20', '00:13:20', '00:21:40', '2019-03-04', '13:23:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753090949099', 7, 2, 'S3', 100, '13:51:40', '00:06:40', '00:18:20', '2019-03-04', '13:36:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753091391414', 1, 6, 'S7', 100, '14:00:00', '00:06:40', '00:18:20', '2019-03-04', '13:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753091534450', 1, 6, 'S1', 100, '14:10:00', '00:06:40', '00:18:20', '2019-03-04', '13:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753091582813', 1, 5, 'S2', 100, '14:05:00', '00:06:40', '00:18:20', '2019-03-04', '13:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753092127958', 1, 5, 'S7', 100, '14:35:00', '00:06:40', '00:18:20', '2019-03-04', '14:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753092158003', 1, 6, 'S5', 100, '14:40:00', '00:06:40', '00:18:20', '2019-03-04', '14:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753092205431', 5, 1, 'S2', 100, '14:26:40', '00:06:40', '00:18:20', '2019-03-04', '14:11:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753092210301', 1, 5, 'S4', 100, '14:15:00', '00:06:40', '00:18:20', '2019-03-04', '14:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753092294773', 1, 6, 'S8', 100, '14:30:00', '00:06:40', '00:18:20', '2019-03-04', '14:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753092581354', 1, 6, 'S8', 100, '14:20:00', '00:06:40', '00:18:20', '2019-03-04', '14:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753092811605', 1, 5, 'S4', 100, '14:25:00', '00:06:40', '00:18:20', '2019-03-04', '14:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753092894698', 6, 3, 'S7', 100, '14:21:40', '00:06:40', '00:18:20', '2019-03-04', '14:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753092957044', 5, 2, 'S5', 100, '14:16:40', '00:06:40', '00:18:20', '2019-03-04', '14:01:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753093104613', 1, 5, 'S6', 100, '14:45:00', '00:06:40', '00:18:20', '2019-03-04', '14:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753093236384', 2, 5, 'B4', 200, '15:05:00', '00:13:20', '00:21:40', '2019-03-04', '14:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753093238995', 6, 2, 'S1', 100, '14:31:40', '00:06:40', '00:18:20', '2019-03-04', '14:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753093331080', 5, 1, 'S4', 100, '14:46:40', '00:06:40', '00:18:20', '2019-03-04', '14:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753093374489', 5, 1, 'S7', 100, '14:56:40', '00:06:40', '00:18:20', '2019-03-04', '14:41:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753093455932', 1, 6, 'S3', 100, '14:50:00', '00:06:40', '00:18:20', '2019-03-04', '14:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753093551531', 1, 5, 'S1', 100, '14:55:00', '00:06:40', '00:18:20', '2019-03-04', '14:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753093573237', 1, 6, 'S2', 100, '15:00:00', '00:06:40', '00:18:20', '2019-03-04', '14:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753093639870', 6, 2, 'S5', 100, '15:01:40', '00:06:40', '00:18:20', '2019-03-04', '14:46:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753093832340', 6, 2, 'S8', 100, '14:51:40', '00:06:40', '00:18:20', '2019-03-04', '14:36:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753093940786', 6, 2, 'S8', 100, '14:41:40', '00:06:40', '00:18:20', '2019-03-04', '14:26:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753093977987', 5, 1, 'S4', 100, '14:36:40', '00:06:40', '00:18:20', '2019-03-04', '14:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753094340252', 1, 5, 'B1', 200, '15:35:00', '00:13:20', '00:21:40', '2019-03-04', '15:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753094377831', 5, 1, 'B4', 200, '15:33:20', '00:13:20', '00:21:40', '2019-03-04', '15:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753094460484', 6, 2, 'S3', 100, '15:11:40', '00:06:40', '00:18:20', '2019-03-04', '14:56:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753094524559', 2, 6, 'B3', 200, '15:40:00', '00:13:20', '00:21:40', '2019-03-04', '15:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753094551584', 2, 7, 'B2', 200, '15:15:00', '00:13:20', '00:21:40', '2019-03-04', '15:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753094681698', 6, 2, 'S2', 100, '15:21:40', '00:06:40', '00:18:20', '2019-03-04', '15:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753094742803', 5, 1, 'S6', 100, '15:06:40', '00:06:40', '00:18:20', '2019-03-04', '14:51:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753094770524', 6, 2, 'B5', 200, '15:38:20', '00:13:20', '00:21:40', '2019-03-04', '15:23:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753094811505', 7, 3, 'B2', 200, '15:43:20', '00:13:20', '00:21:40', '2019-03-04', '15:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753094927509', 1, 6, 'B5', 200, '15:10:00', '00:13:20', '00:21:40', '2019-03-04', '14:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753094974896', 5, 1, 'S1', 100, '15:16:40', '00:06:40', '00:18:20', '2019-03-04', '15:01:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753095633202', 1, 7, 'S2', 100, '15:45:00', '00:06:40', '00:18:20', '2019-03-04', '15:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753096146868', 5, 1, 'B1', 200, '16:03:20', '00:13:20', '00:21:40', '2019-03-04', '15:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753096539253', 1, 5, 'S8', 100, '16:10:00', '00:06:40', '00:18:20', '2019-03-04', '15:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753096868828', 6, 2, 'B3', 200, '16:08:20', '00:13:20', '00:21:40', '2019-03-04', '15:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753096894172', 1, 5, 'S7', 100, '16:00:00', '00:06:40', '00:18:20', '2019-03-04', '15:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753096900842', 1, 6, 'S1', 100, '15:55:00', '00:06:40', '00:18:20', '2019-03-04', '15:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753096914722', 1, 5, 'S5', 100, '15:50:00', '00:06:40', '00:18:20', '2019-03-04', '15:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753096922459', 1, 6, 'S4', 100, '16:05:00', '00:06:40', '00:18:20', '2019-03-04', '15:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753100770960', 7, 3, 'S2', 100, '16:06:40', '00:06:40', '00:18:20', '2019-03-04', '15:51:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753102175939', 5, 4, 'S5', 100, '16:11:40', '00:06:40', '00:18:20', '2019-03-04', '15:56:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753102448873', 6, 2, 'S4', 100, '16:26:40', '00:06:40', '00:18:20', '2019-03-04', '16:11:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753102510236', 5, 1, 'S7', 100, '16:21:40', '00:06:40', '00:18:20', '2019-03-04', '16:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753102518491', 5, 1, 'S8', 100, '16:31:40', '00:06:40', '00:18:20', '2019-03-04', '16:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551707753102581454', 6, 3, 'S1', 100, '16:16:40', '00:06:40', '00:18:20', '2019-03-04', '16:01:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164398425777', 1, 5, 'S1', 100, '07:15:00', '00:06:40', '00:18:20', '2019-01-16', '07:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164399273450', 1, 7, 'S4', 100, '07:30:00', '00:06:40', '00:18:20', '2019-01-16', '07:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164399591870', 1, 5, 'S2', 100, '07:25:00', '00:06:40', '00:18:20', '2019-01-16', '07:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164399841316', 2, 6, 'B8', 200, '07:20:00', '00:13:20', '00:21:40', '2019-01-16', '07:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164400954206', 2, 5, 'B3', 200, '07:35:00', '00:13:20', '00:21:40', '2019-01-16', '07:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164401431099', 1, 7, 'S5', 100, '07:45:00', '00:06:40', '00:18:20', '2019-01-16', '07:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164401526835', 6, 1, 'B8', 200, '07:48:20', '00:13:20', '00:21:40', '2019-01-16', '07:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164401583555', 5, 1, 'S1', 100, '07:36:40', '00:06:40', '00:18:20', '2019-01-16', '07:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164401743682', 1, 6, 'B4', 200, '07:40:00', '00:13:20', '00:21:40', '2019-01-16', '07:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164401922400', 5, 2, 'S2', 100, '07:46:40', '00:06:40', '00:18:20', '2019-01-16', '07:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164402125145', 2, 6, 'B6', 200, '08:10:00', '00:13:20', '00:21:40', '2019-01-16', '07:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164402233339', 6, 2, 'B4', 200, '08:08:20', '00:13:20', '00:21:40', '2019-01-16', '07:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164402564489', 5, 1, 'B3', 200, '08:03:20', '00:13:20', '00:21:40', '2019-01-16', '07:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164402670173', 7, 3, 'S4', 100, '07:51:40', '00:06:40', '00:18:20', '2019-01-16', '07:36:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164402723088', 1, 5, 'B5', 200, '08:05:00', '00:13:20', '00:21:40', '2019-01-16', '07:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164402765476', 7, 3, 'S5', 100, '08:06:40', '00:06:40', '00:18:20', '2019-01-16', '07:51:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164403129360', 2, 5, 'B1', 200, '08:20:00', '00:13:20', '00:21:40', '2019-01-16', '08:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164403220870', 1, 6, 'B7', 200, '08:25:00', '00:13:20', '00:21:40', '2019-01-16', '08:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164403416671', 5, 1, 'B5', 200, '08:33:20', '00:13:20', '00:21:40', '2019-01-16', '08:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164403637161', 2, 7, 'B2', 200, '08:30:00', '00:13:20', '00:21:40', '2019-01-16', '08:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164403898955', 1, 7, 'S3', 100, '08:15:00', '00:06:40', '00:18:20', '2019-01-16', '08:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164404114459', 7, 3, 'S3', 100, '08:36:40', '00:06:40', '00:18:20', '2019-01-16', '08:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164404162289', 1, 5, 'B7', 200, '08:55:00', '00:13:20', '00:21:40', '2019-01-16', '08:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164404280426', 2, 6, 'B2', 200, '09:00:00', '00:13:20', '00:21:40', '2019-01-16', '08:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164404302024', 6, 2, 'B6', 200, '08:38:20', '00:13:20', '00:21:40', '2019-01-16', '08:23:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164404596136', 6, 2, 'B7', 200, '08:53:20', '00:13:20', '00:21:40', '2019-01-16', '08:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164404761507', 5, 1, 'B1', 200, '08:48:20', '00:13:20', '00:21:40', '2019-01-16', '08:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164404952691', 7, 3, 'B2', 200, '08:58:20', '00:13:20', '00:21:40', '2019-01-16', '08:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164405166235', 1, 7, 'B8', 200, '09:05:00', '00:13:20', '00:21:40', '2019-01-16', '08:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164405208680', 5, 1, 'B7', 200, '09:23:20', '00:13:20', '00:21:40', '2019-01-16', '09:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164405715278', 1, 6, 'B3', 200, '09:15:00', '00:13:20', '00:21:40', '2019-01-16', '09:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164405833797', 2, 5, 'B4', 200, '09:10:00', '00:13:20', '00:21:40', '2019-01-16', '08:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164405896450', 6, 2, 'B2', 200, '09:28:20', '00:13:20', '00:21:40', '2019-01-16', '09:13:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164406383107', 5, 1, 'B4', 200, '09:38:20', '00:13:20', '00:21:40', '2019-01-16', '09:23:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164406543473', 1, 5, 'B1', 200, '09:45:00', '00:13:20', '00:21:40', '2019-01-16', '09:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164406652001', 6, 2, 'B3', 200, '09:43:20', '00:13:20', '00:21:40', '2019-01-16', '09:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164406838021', 7, 3, 'B8', 200, '09:33:20', '00:13:20', '00:21:40', '2019-01-16', '09:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164407227702', 1, 7, 'B5', 200, '09:55:00', '00:13:20', '00:21:40', '2019-01-16', '09:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164407334652', 1, 5, 'S2', 100, '10:10:00', '00:06:40', '00:18:20', '2019-01-16', '09:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164407525443', 1, 5, 'S5', 100, '10:00:00', '00:06:40', '00:18:20', '2019-01-16', '09:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164407770996', 1, 6, 'S1', 100, '10:05:00', '00:06:40', '00:18:20', '2019-01-16', '09:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164407976774', 2, 6, 'B6', 200, '09:50:00', '00:13:20', '00:21:40', '2019-01-16', '09:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164408117423', 1, 6, 'S4', 100, '10:15:00', '00:06:40', '00:18:20', '2019-01-16', '10:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164408118277', 5, 1, 'B1', 200, '10:13:20', '00:13:20', '00:21:40', '2019-01-16', '09:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164408360308', 6, 2, 'B6', 200, '10:18:20', '00:13:20', '00:21:40', '2019-01-16', '10:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164408545692', 7, 3, 'B5', 200, '10:23:20', '00:13:20', '00:21:40', '2019-01-16', '10:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164408875094', 5, 4, 'S5', 100, '10:21:40', '00:06:40', '00:18:20', '2019-01-16', '10:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164408916479', 6, 1, 'S1', 100, '10:26:40', '00:06:40', '00:18:20', '2019-01-16', '10:11:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164409127014', 1, 6, 'B2', 200, '10:55:00', '00:13:20', '00:21:40', '2019-01-16', '10:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164409232523', 5, 4, 'S2', 100, '10:31:40', '00:06:40', '00:18:20', '2019-01-16', '10:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164409358288', 4, 7, 'B6', 200, '10:50:00', '00:13:20', '00:21:40', '2019-01-16', '10:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164409410198', 4, 6, 'B5', 200, '10:40:00', '00:13:20', '00:21:40', '2019-01-16', '10:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164409587045', 6, 1, 'S4', 100, '10:36:40', '00:06:40', '00:18:20', '2019-01-16', '10:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164409663097', 1, 5, 'S3', 100, '10:35:00', '00:06:40', '00:18:20', '2019-01-16', '10:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164409718006', 1, 5, 'B8', 200, '10:45:00', '00:13:20', '00:21:40', '2019-01-16', '10:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164410330783', 6, 1, 'B2', 200, '11:23:20', '00:13:20', '00:21:40', '2019-01-16', '11:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164410395028', 2, 5, 'B7', 200, '11:00:00', '00:13:20', '00:21:40', '2019-01-16', '10:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164410432607', 5, 1, 'S3', 100, '10:56:40', '00:06:40', '00:18:20', '2019-01-16', '10:41:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164410671761', 5, 2, 'B8', 200, '11:13:20', '00:13:20', '00:21:40', '2019-01-16', '10:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164410719067', 7, 3, 'B6', 200, '11:18:20', '00:13:20', '00:21:40', '2019-01-16', '11:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164410958069', 6, 1, 'B5', 200, '11:08:20', '00:13:20', '00:21:40', '2019-01-16', '10:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164410968301', 5, 2, 'B7', 200, '11:28:20', '00:13:20', '00:21:40', '2019-01-16', '11:13:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164411164981', 5, 1, 'B3', 200, '11:53:20', '00:13:20', '00:21:40', '2019-01-16', '11:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164411207776', 6, 2, 'B4', 200, '11:58:20', '00:13:20', '00:21:40', '2019-01-16', '11:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164411253893', 7, 3, 'B1', 200, '12:03:20', '00:13:20', '00:21:40', '2019-01-16', '11:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164411298389', 1, 7, 'B1', 200, '11:35:00', '00:13:20', '00:21:40', '2019-01-16', '11:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164411459926', 2, 6, 'B4', 200, '11:30:00', '00:13:20', '00:21:40', '2019-01-16', '11:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164411648279', 2, 5, 'B4', 200, '11:40:00', '00:13:20', '00:21:40', '2019-01-16', '11:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164411679981', 1, 5, 'B3', 200, '11:25:00', '00:13:20', '00:21:40', '2019-01-16', '11:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164411881422', 1, 6, 'B1', 200, '11:45:00', '00:13:20', '00:21:40', '2019-01-16', '11:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164412143142', 5, 1, 'B6', 200, '12:43:20', '00:13:20', '00:21:40', '2019-01-16', '12:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164412191992', 5, 1, 'B4', 200, '12:08:20', '00:13:20', '00:21:40', '2019-01-16', '11:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164412253102', 2, 5, 'B3', 200, '12:30:00', '00:13:20', '00:21:40', '2019-01-16', '12:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164412384563', 5, 1, 'B3', 200, '12:58:20', '00:13:20', '00:21:40', '2019-01-16', '12:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164412512194', 1, 6, 'B2', 200, '12:35:00', '00:13:20', '00:21:40', '2019-01-16', '12:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164412532032', 2, 6, 'B8', 200, '12:20:00', '00:13:20', '00:21:40', '2019-01-16', '12:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164412685047', 6, 2, 'B1', 200, '12:13:20', '00:13:20', '00:21:40', '2019-01-16', '11:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164412705194', 6, 2, 'B8', 200, '12:48:20', '00:13:20', '00:21:40', '2019-01-16', '12:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164412866886', 7, 3, 'B5', 200, '12:53:20', '00:13:20', '00:21:40', '2019-01-16', '12:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164412894302', 1, 5, 'B6', 200, '12:15:00', '00:13:20', '00:21:40', '2019-01-16', '12:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164412931180', 1, 7, 'B5', 200, '12:25:00', '00:13:20', '00:21:40', '2019-01-16', '12:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164413134444', 5, 1, 'B7', 200, '13:33:20', '00:13:20', '00:21:40', '2019-01-16', '13:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164413252629', 3, 6, 'B7', 200, '13:35:00', '00:13:20', '00:21:40', '2019-01-16', '13:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164413411725', 1, 7, 'S1', 100, '13:15:00', '00:06:40', '00:18:20', '2019-01-16', '13:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164413455432', 6, 2, 'S3', 100, '13:31:40', '00:06:40', '00:18:20', '2019-01-16', '13:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164413481692', 1, 5, 'B6', 200, '13:40:00', '00:13:20', '00:21:40', '2019-01-16', '13:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164413493646', 1, 6, 'S3', 100, '13:10:00', '00:06:40', '00:18:20', '2019-01-16', '12:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164413709853', 1, 5, 'S2', 100, '13:30:00', '00:06:40', '00:18:20', '2019-01-16', '13:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164413717383', 1, 5, 'S4', 100, '13:20:00', '00:06:40', '00:18:20', '2019-01-16', '13:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164413785058', 6, 2, 'B2', 200, '13:03:20', '00:13:20', '00:21:40', '2019-01-16', '12:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164413785791', 7, 3, 'S1', 100, '13:36:40', '00:06:40', '00:18:20', '2019-01-16', '13:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164413879212', 1, 6, 'S5', 100, '13:25:00', '00:06:40', '00:18:20', '2019-01-16', '13:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164413978917', 1, 5, 'B7', 200, '13:05:00', '00:13:20', '00:21:40', '2019-01-16', '12:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414126301', 5, 2, 'S5', 100, '15:21:40', '00:06:40', '00:18:20', '2019-01-16', '15:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414133181', 2, 5, 'B3', 200, '15:50:00', '00:13:20', '00:21:40', '2019-01-16', '15:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414158454', 7, 3, 'B4', 200, '14:33:20', '00:13:20', '00:21:40', '2019-01-16', '14:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414164516', 6, 2, 'B1', 200, '14:28:20', '00:13:20', '00:21:40', '2019-01-16', '14:13:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414165507', 5, 1, 'B2', 200, '14:23:20', '00:13:20', '00:21:40', '2019-01-16', '14:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414186523', 1, 6, 'S2', 100, '14:50:00', '00:06:40', '00:18:20', '2019-01-16', '14:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414201504', 1, 5, 'B5', 200, '14:45:00', '00:13:20', '00:21:40', '2019-01-16', '14:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414222609', 1, 5, 'B2', 200, '15:20:00', '00:13:20', '00:21:40', '2019-01-16', '15:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414322120', 1, 7, 'B7', 200, '15:45:00', '00:13:20', '00:21:40', '2019-01-16', '15:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414332988', 1, 6, 'B8', 200, '14:15:00', '00:13:20', '00:21:40', '2019-01-16', '14:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414353851', 6, 3, 'S5', 100, '13:46:40', '00:06:40', '00:18:20', '2019-01-16', '13:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414382515', 6, 1, 'B5', 200, '15:43:20', '00:13:20', '00:21:40', '2019-01-16', '15:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414418583', 1, 6, 'B1', 200, '15:55:00', '00:13:20', '00:21:40', '2019-01-16', '15:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414444562', 7, 3, 'B7', 200, '16:13:20', '00:13:20', '00:21:40', '2019-01-16', '15:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414446853', 5, 1, 'B3', 200, '16:18:20', '00:13:20', '00:21:40', '2019-01-16', '16:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414465003', 6, 2, 'B1', 200, '16:23:20', '00:13:20', '00:21:40', '2019-01-16', '16:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414488380', 7, 3, 'S1', 100, '15:16:40', '00:06:40', '00:18:20', '2019-01-16', '15:01:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414494512', 6, 3, 'S3', 100, '15:26:40', '00:06:40', '00:18:20', '2019-01-16', '15:11:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414551429', 1, 5, 'B8', 200, '15:35:00', '00:13:20', '00:21:40', '2019-01-16', '15:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414555427', 2, 5, 'B3', 200, '14:10:00', '00:13:20', '00:21:40', '2019-01-16', '13:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414580748', 6, 2, 'B8', 200, '14:43:20', '00:13:20', '00:21:40', '2019-01-16', '14:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414622943', 1, 5, 'S4', 100, '15:10:00', '00:06:40', '00:18:20', '2019-01-16', '14:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414654730', 6, 2, 'B6', 200, '16:08:20', '00:13:20', '00:21:40', '2019-01-16', '15:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414661623', 5, 2, 'S4', 100, '13:41:40', '00:06:40', '00:18:20', '2019-01-16', '13:26:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414670236', 5, 1, 'B8', 200, '16:03:20', '00:13:20', '00:21:40', '2019-01-16', '15:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414685135', 2, 6, 'B6', 200, '15:40:00', '00:13:20', '00:21:40', '2019-01-16', '15:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414697290', 1, 7, 'S1', 100, '14:55:00', '00:06:40', '00:18:20', '2019-01-16', '14:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414716452', 1, 5, 'B2', 200, '13:55:00', '00:13:20', '00:21:40', '2019-01-16', '13:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414788296', 3, 6, 'B5', 200, '15:15:00', '00:13:20', '00:21:40', '2019-01-16', '15:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414814473', 6, 2, 'S2', 100, '15:11:40', '00:06:40', '00:18:20', '2019-01-16', '14:56:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414834996', 5, 1, 'B5', 200, '15:13:20', '00:13:20', '00:21:40', '2019-01-16', '14:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414873049', 1, 7, 'B4', 200, '14:05:00', '00:13:20', '00:21:40', '2019-01-16', '13:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414876614', 6, 1, 'B7', 200, '14:03:20', '00:13:20', '00:21:40', '2019-01-16', '13:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414878241', 5, 2, 'B2', 200, '15:48:20', '00:13:20', '00:21:40', '2019-01-16', '15:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414882596', 5, 2, 'B6', 200, '14:08:20', '00:13:20', '00:21:40', '2019-01-16', '13:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414884358', 2, 6, 'B1', 200, '14:00:00', '00:13:20', '00:21:40', '2019-01-16', '13:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414908065', 1, 6, 'S3', 100, '15:05:00', '00:06:40', '00:18:20', '2019-01-16', '14:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414924245', 1, 5, 'S5', 100, '15:00:00', '00:06:40', '00:18:20', '2019-01-16', '14:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414951406', 5, 1, 'S2', 100, '13:51:40', '00:06:40', '00:18:20', '2019-01-16', '13:36:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414958451', 5, 1, 'S4', 100, '15:31:40', '00:06:40', '00:18:20', '2019-01-16', '15:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720164414969897', 5, 1, 'B3', 200, '14:38:20', '00:13:20', '00:21:40', '2019-01-16', '14:23:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963106924', 7, 3, 'S4', 100, '07:51:40', '00:06:40', '00:18:20', '2018-03-05', '07:36:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963112140', 6, 2, 'B4', 200, '08:08:20', '00:13:20', '00:21:40', '2018-03-05', '07:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963143067', 1, 5, 'B5', 200, '08:05:00', '00:13:20', '00:21:40', '2018-03-05', '07:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963204074', 5, 1, 'B5', 200, '08:33:20', '00:13:20', '00:21:40', '2018-03-05', '08:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963221647', 2, 6, 'B6', 200, '09:50:00', '00:13:20', '00:21:40', '2018-03-05', '09:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963243881', 2, 5, 'B3', 200, '07:35:00', '00:13:20', '00:21:40', '2018-03-05', '07:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963254085', 1, 7, 'S3', 100, '08:15:00', '00:06:40', '00:18:20', '2018-03-05', '08:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963298410', 5, 1, 'B7', 200, '09:23:20', '00:13:20', '00:21:40', '2018-03-05', '09:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963363253', 1, 5, 'S1', 100, '07:15:00', '00:06:40', '00:18:20', '2018-03-05', '07:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963366384', 5, 1, 'B1', 200, '08:48:20', '00:13:20', '00:21:40', '2018-03-05', '08:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963394836', 1, 7, 'B8', 200, '09:05:00', '00:13:20', '00:21:40', '2018-03-05', '08:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963397956', 1, 6, 'B3', 200, '09:15:00', '00:13:20', '00:21:40', '2018-03-05', '09:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963405973', 2, 5, 'B4', 200, '09:10:00', '00:13:20', '00:21:40', '2018-03-05', '08:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963438985', 1, 6, 'B7', 200, '08:25:00', '00:13:20', '00:21:40', '2018-03-05', '08:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963462060', 5, 1, 'S1', 100, '07:36:40', '00:06:40', '00:18:20', '2018-03-05', '07:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963469482', 5, 2, 'S2', 100, '07:46:40', '00:06:40', '00:18:20', '2018-03-05', '07:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963477142', 6, 2, 'B7', 200, '08:53:20', '00:13:20', '00:21:40', '2018-03-05', '08:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963481577', 6, 2, 'B3', 200, '09:43:20', '00:13:20', '00:21:40', '2018-03-05', '09:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963615409', 5, 1, 'B3', 200, '08:03:20', '00:13:20', '00:21:40', '2018-03-05', '07:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963623318', 7, 3, 'B8', 200, '09:33:20', '00:13:20', '00:21:40', '2018-03-05', '09:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963645238', 7, 3, 'S3', 100, '08:36:40', '00:06:40', '00:18:20', '2018-03-05', '08:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963649464', 6, 2, 'B2', 200, '09:28:20', '00:13:20', '00:21:40', '2018-03-05', '09:13:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963655406', 2, 6, 'B8', 200, '07:20:00', '00:13:20', '00:21:40', '2018-03-05', '07:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963662493', 1, 5, 'S2', 100, '07:25:00', '00:06:40', '00:18:20', '2018-03-05', '07:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963694247', 2, 6, 'B6', 200, '08:10:00', '00:13:20', '00:21:40', '2018-03-05', '07:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963696006', 7, 3, 'B2', 200, '08:58:20', '00:13:20', '00:21:40', '2018-03-05', '08:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963712041', 1, 5, 'B1', 200, '09:45:00', '00:13:20', '00:21:40', '2018-03-05', '09:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963737578', 1, 6, 'B4', 200, '07:40:00', '00:13:20', '00:21:40', '2018-03-05', '07:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963740763', 2, 6, 'B2', 200, '09:00:00', '00:13:20', '00:21:40', '2018-03-05', '08:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963753635', 7, 3, 'S5', 100, '08:06:40', '00:06:40', '00:18:20', '2018-03-05', '07:51:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963755326', 1, 5, 'B7', 200, '08:55:00', '00:13:20', '00:21:40', '2018-03-05', '08:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963787784', 2, 5, 'B1', 200, '08:20:00', '00:13:20', '00:21:40', '2018-03-05', '08:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963807855', 2, 7, 'B2', 200, '08:30:00', '00:13:20', '00:21:40', '2018-03-05', '08:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963843057', 1, 7, 'S4', 100, '07:30:00', '00:06:40', '00:18:20', '2018-03-05', '07:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963889090', 1, 7, 'S5', 100, '07:45:00', '00:06:40', '00:18:20', '2018-03-05', '07:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963932254', 5, 1, 'B4', 200, '09:38:20', '00:13:20', '00:21:40', '2018-03-05', '09:23:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963967129', 6, 1, 'B8', 200, '07:48:20', '00:13:20', '00:21:40', '2018-03-05', '07:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231963971276', 6, 2, 'B6', 200, '08:38:20', '00:13:20', '00:21:40', '2018-03-05', '08:23:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979103811', 7, 3, 'S1', 100, '13:36:40', '00:06:40', '00:18:20', '2018-03-05', '13:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979108350', 5, 1, 'S4', 100, '15:31:40', '00:06:40', '00:18:20', '2018-03-05', '15:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979125268', 1, 6, 'S5', 100, '13:25:00', '00:06:40', '00:18:20', '2018-03-05', '13:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979133401', 2, 5, 'B3', 200, '14:10:00', '00:13:20', '00:21:40', '2018-03-05', '13:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979135719', 1, 7, 'S1', 100, '14:55:00', '00:06:40', '00:18:20', '2018-03-05', '14:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979142028', 1, 6, 'S2', 100, '14:50:00', '00:06:40', '00:18:20', '2018-03-05', '14:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979157954', 5, 1, 'B3', 200, '14:38:20', '00:13:20', '00:21:40', '2018-03-05', '14:23:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979165696', 1, 7, 'S1', 100, '13:15:00', '00:06:40', '00:18:20', '2018-03-05', '13:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979166624', 6, 2, 'S2', 100, '15:11:40', '00:06:40', '00:18:20', '2018-03-05', '14:56:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979171814', 5, 1, 'S2', 100, '13:51:40', '00:06:40', '00:18:20', '2018-03-05', '13:36:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979184305', 4, 7, 'B6', 200, '10:50:00', '00:13:20', '00:21:40', '2018-03-05', '10:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979186251', 5, 1, 'B8', 200, '16:03:20', '00:13:20', '00:21:40', '2018-03-05', '15:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979193796', 7, 3, 'B1', 200, '12:03:20', '00:13:20', '00:21:40', '2018-03-05', '11:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979194610', 1, 5, 'S5', 100, '10:00:00', '00:06:40', '00:18:20', '2018-03-05', '09:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979194931', 1, 7, 'B4', 200, '14:05:00', '00:13:20', '00:21:40', '2018-03-05', '13:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979229635', 1, 5, 'B3', 200, '11:25:00', '00:13:20', '00:21:40', '2018-03-05', '11:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979248283', 4, 6, 'B5', 200, '10:40:00', '00:13:20', '00:21:40', '2018-03-05', '10:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979250607', 6, 1, 'B5', 200, '11:08:20', '00:13:20', '00:21:40', '2018-03-05', '10:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979286852', 6, 3, 'S5', 100, '13:46:40', '00:06:40', '00:18:20', '2018-03-05', '13:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979300432', 5, 2, 'B6', 200, '14:08:20', '00:13:20', '00:21:40', '2018-03-05', '13:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979317883', 6, 2, 'B4', 200, '11:58:20', '00:13:20', '00:21:40', '2018-03-05', '11:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979324423', 6, 2, 'B8', 200, '14:43:20', '00:13:20', '00:21:40', '2018-03-05', '14:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979338412', 1, 5, 'B8', 200, '10:45:00', '00:13:20', '00:21:40', '2018-03-05', '10:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979340221', 1, 6, 'S3', 100, '15:05:00', '00:06:40', '00:18:20', '2018-03-05', '14:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979343972', 5, 2, 'S5', 100, '15:21:40', '00:06:40', '00:18:20', '2018-03-05', '15:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979347555', 6, 1, 'S4', 100, '10:36:40', '00:06:40', '00:18:20', '2018-03-05', '10:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979363647', 3, 6, 'B7', 200, '13:35:00', '00:13:20', '00:21:40', '2018-03-05', '13:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979376503', 6, 2, 'B6', 200, '10:18:20', '00:13:20', '00:21:40', '2018-03-05', '10:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979382502', 2, 6, 'B6', 200, '15:40:00', '00:13:20', '00:21:40', '2018-03-05', '15:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979384736', 7, 3, 'B5', 200, '12:53:20', '00:13:20', '00:21:40', '2018-03-05', '12:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979393486', 7, 3, 'B5', 200, '10:23:20', '00:13:20', '00:21:40', '2018-03-05', '10:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979403167', 5, 1, 'B5', 200, '15:13:20', '00:13:20', '00:21:40', '2018-03-05', '14:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979412567', 5, 2, 'B8', 200, '11:13:20', '00:13:20', '00:21:40', '2018-03-05', '10:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979420467', 1, 6, 'S1', 100, '10:05:00', '00:06:40', '00:18:20', '2018-03-05', '09:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979421098', 1, 6, 'B2', 200, '10:55:00', '00:13:20', '00:21:40', '2018-03-05', '10:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979428255', 2, 6, 'B4', 200, '11:30:00', '00:13:20', '00:21:40', '2018-03-05', '11:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979442370', 6, 2, 'B8', 200, '12:48:20', '00:13:20', '00:21:40', '2018-03-05', '12:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979454668', 6, 2, 'B2', 200, '13:03:20', '00:13:20', '00:21:40', '2018-03-05', '12:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979461439', 2, 6, 'B8', 200, '12:20:00', '00:13:20', '00:21:40', '2018-03-05', '12:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979476570', 5, 1, 'B1', 200, '10:13:20', '00:13:20', '00:21:40', '2018-03-05', '09:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979488636', 6, 2, 'B1', 200, '12:13:20', '00:13:20', '00:21:40', '2018-03-05', '11:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979488821', 5, 2, 'B7', 200, '11:28:20', '00:13:20', '00:21:40', '2018-03-05', '11:13:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979499731', 6, 2, 'B1', 200, '14:28:20', '00:13:20', '00:21:40', '2018-03-05', '14:13:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979511265', 6, 1, 'B5', 200, '15:43:20', '00:13:20', '00:21:40', '2018-03-05', '15:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979513035', 1, 6, 'S4', 100, '10:15:00', '00:06:40', '00:18:20', '2018-03-05', '10:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979523239', 1, 5, 'B8', 200, '15:35:00', '00:13:20', '00:21:40', '2018-03-05', '15:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979530657', 1, 6, 'B1', 200, '15:55:00', '00:13:20', '00:21:40', '2018-03-05', '15:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979559441', 5, 2, 'B2', 200, '15:48:20', '00:13:20', '00:21:40', '2018-03-05', '15:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979559792', 6, 1, 'B2', 200, '11:23:20', '00:13:20', '00:21:40', '2018-03-05', '11:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979562796', 2, 5, 'B4', 200, '11:40:00', '00:13:20', '00:21:40', '2018-03-05', '11:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979565468', 2, 6, 'B1', 200, '14:00:00', '00:13:20', '00:21:40', '2018-03-05', '13:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979571514', 1, 5, 'B2', 200, '13:55:00', '00:13:20', '00:21:40', '2018-03-05', '13:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979574417', 6, 2, 'B1', 200, '16:23:20', '00:13:20', '00:21:40', '2018-03-05', '16:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979600172', 6, 1, 'S1', 100, '10:26:40', '00:06:40', '00:18:20', '2018-03-05', '10:11:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979612899', 6, 3, 'S3', 100, '15:26:40', '00:06:40', '00:18:20', '2018-03-05', '15:11:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979614551', 5, 4, 'S2', 100, '10:31:40', '00:06:40', '00:18:20', '2018-03-05', '10:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979623070', 1, 5, 'S4', 100, '13:20:00', '00:06:40', '00:18:20', '2018-03-05', '13:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979633691', 5, 1, 'B3', 200, '11:53:20', '00:13:20', '00:21:40', '2018-03-05', '11:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979634026', 1, 7, 'B1', 200, '11:35:00', '00:13:20', '00:21:40', '2018-03-05', '11:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979662630', 6, 2, 'S3', 100, '13:31:40', '00:06:40', '00:18:20', '2018-03-05', '13:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979679442', 5, 4, 'S5', 100, '10:21:40', '00:06:40', '00:18:20', '2018-03-05', '10:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979694360', 1, 6, 'S3', 100, '13:10:00', '00:06:40', '00:18:20', '2018-03-05', '12:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979698343', 5, 1, 'B6', 200, '12:43:20', '00:13:20', '00:21:40', '2018-03-05', '12:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979699928', 1, 7, 'B7', 200, '15:45:00', '00:13:20', '00:21:40', '2018-03-05', '15:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979710923', 1, 5, 'B7', 200, '13:05:00', '00:13:20', '00:21:40', '2018-03-05', '12:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979717349', 5, 1, 'S3', 100, '10:56:40', '00:06:40', '00:18:20', '2018-03-05', '10:41:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979737433', 2, 5, 'B7', 200, '11:00:00', '00:13:20', '00:21:40', '2018-03-05', '10:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979738310', 5, 1, 'B4', 200, '12:08:20', '00:13:20', '00:21:40', '2018-03-05', '11:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979751952', 5, 1, 'B3', 200, '12:58:20', '00:13:20', '00:21:40', '2018-03-05', '12:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979753465', 7, 3, 'B7', 200, '16:13:20', '00:13:20', '00:21:40', '2018-03-05', '15:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979756857', 1, 6, 'B8', 200, '14:15:00', '00:13:20', '00:21:40', '2018-03-05', '14:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979767555', 1, 5, 'B6', 200, '13:40:00', '00:13:20', '00:21:40', '2018-03-05', '13:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979770532', 5, 1, 'B2', 200, '14:23:20', '00:13:20', '00:21:40', '2018-03-05', '14:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979778423', 1, 5, 'S2', 100, '10:10:00', '00:06:40', '00:18:20', '2018-03-05', '09:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979788096', 1, 5, 'B5', 200, '14:45:00', '00:13:20', '00:21:40', '2018-03-05', '14:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979833654', 1, 5, 'B6', 200, '12:15:00', '00:13:20', '00:21:40', '2018-03-05', '12:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979846172', 1, 6, 'B2', 200, '12:35:00', '00:13:20', '00:21:40', '2018-03-05', '12:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979862222', 1, 5, 'S5', 100, '15:00:00', '00:06:40', '00:18:20', '2018-03-05', '14:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979864218', 6, 2, 'B6', 200, '16:08:20', '00:13:20', '00:21:40', '2018-03-05', '15:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979874182', 1, 5, 'B2', 200, '15:20:00', '00:13:20', '00:21:40', '2018-03-05', '15:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979876786', 2, 5, 'B3', 200, '12:30:00', '00:13:20', '00:21:40', '2018-03-05', '12:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979876964', 1, 6, 'B1', 200, '11:45:00', '00:13:20', '00:21:40', '2018-03-05', '11:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979882512', 1, 7, 'B5', 200, '09:55:00', '00:13:20', '00:21:40', '2018-03-05', '09:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979886526', 1, 7, 'B5', 200, '12:25:00', '00:13:20', '00:21:40', '2018-03-05', '12:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979891688', 6, 1, 'B7', 200, '14:03:20', '00:13:20', '00:21:40', '2018-03-05', '13:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979900876', 1, 5, 'S3', 100, '10:35:00', '00:06:40', '00:18:20', '2018-03-05', '10:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979908992', 1, 5, 'S4', 100, '15:10:00', '00:06:40', '00:18:20', '2018-03-05', '14:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979920720', 1, 5, 'S2', 100, '13:30:00', '00:06:40', '00:18:20', '2018-03-05', '13:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979923055', 3, 6, 'B5', 200, '15:15:00', '00:13:20', '00:21:40', '2018-03-05', '15:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979934178', 5, 2, 'S4', 100, '13:41:40', '00:06:40', '00:18:20', '2018-03-05', '13:26:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979963558', 7, 3, 'B4', 200, '14:33:20', '00:13:20', '00:21:40', '2018-03-05', '14:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979966879', 5, 1, 'B7', 200, '13:33:20', '00:13:20', '00:21:40', '2018-03-05', '13:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979985085', 7, 3, 'S1', 100, '15:16:40', '00:06:40', '00:18:20', '2018-03-05', '15:01:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979992031', 5, 1, 'B3', 200, '16:18:20', '00:13:20', '00:21:40', '2018-03-05', '16:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979996486', 2, 5, 'B3', 200, '15:50:00', '00:13:20', '00:21:40', '2018-03-05', '15:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551720231979999764', 7, 3, 'B6', 200, '11:18:20', '00:13:20', '00:21:40', '2018-03-05', '11:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216854188531', 2, 6, 'B8', 200, '07:20:00', '00:13:20', '00:21:40', '2019-03-05', '07:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216854233462', 1, 7, 'S4', 100, '07:30:00', '00:06:40', '00:18:20', '2019-03-05', '07:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216854258071', 1, 5, 'S1', 100, '07:15:00', '00:06:40', '00:18:20', '2019-03-05', '07:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216854508451', 1, 5, 'S2', 100, '07:25:00', '00:06:40', '00:18:20', '2019-03-05', '07:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216854535800', 1, 6, 'B4', 200, '07:40:00', '00:13:20', '00:21:40', '2019-03-05', '07:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216854608796', 1, 7, 'S5', 100, '07:45:00', '00:06:40', '00:18:20', '2019-03-05', '07:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216854828967', 6, 1, 'B8', 200, '07:48:20', '00:13:20', '00:21:40', '2019-03-05', '07:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216854911069', 2, 5, 'B3', 200, '07:35:00', '00:13:20', '00:21:40', '2019-03-05', '07:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216854970772', 5, 1, 'S1', 100, '07:36:40', '00:06:40', '00:18:20', '2019-03-05', '07:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216855124037', 1, 5, 'B5', 200, '08:05:00', '00:13:20', '00:21:40', '2019-03-05', '07:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216855149501', 2, 6, 'B6', 200, '08:10:00', '00:13:20', '00:21:40', '2019-03-05', '07:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216855384716', 6, 2, 'B6', 200, '08:38:20', '00:13:20', '00:21:40', '2019-03-05', '08:23:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216855536122', 1, 6, 'B7', 200, '08:25:00', '00:13:20', '00:21:40', '2019-03-05', '08:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216855556039', 2, 5, 'B1', 200, '08:20:00', '00:13:20', '00:21:40', '2019-03-05', '08:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216855596426', 6, 2, 'B4', 200, '08:08:20', '00:13:20', '00:21:40', '2019-03-05', '07:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216855623693', 2, 7, 'B2', 200, '08:30:00', '00:13:20', '00:21:40', '2019-03-05', '08:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216855634650', 5, 1, 'B5', 200, '08:33:20', '00:13:20', '00:21:40', '2019-03-05', '08:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216855679057', 7, 3, 'S5', 100, '08:06:40', '00:06:40', '00:18:20', '2019-03-05', '07:51:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216855724627', 5, 2, 'S2', 100, '07:46:40', '00:06:40', '00:18:20', '2019-03-05', '07:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216855763078', 1, 7, 'S3', 100, '08:15:00', '00:06:40', '00:18:20', '2019-03-05', '08:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216855792513', 6, 2, 'B7', 200, '08:53:20', '00:13:20', '00:21:40', '2019-03-05', '08:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216855846961', 7, 3, 'S4', 100, '07:51:40', '00:06:40', '00:18:20', '2019-03-05', '07:36:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216855865285', 5, 1, 'B1', 200, '08:48:20', '00:13:20', '00:21:40', '2019-03-05', '08:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216855956096', 7, 3, 'S3', 100, '08:36:40', '00:06:40', '00:18:20', '2019-03-05', '08:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216855970782', 5, 1, 'B3', 200, '08:03:20', '00:13:20', '00:21:40', '2019-03-05', '07:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216856124338', 5, 1, 'B7', 200, '09:23:20', '00:13:20', '00:21:40', '2019-03-05', '09:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216856239385', 5, 1, 'B4', 200, '09:38:20', '00:13:20', '00:21:40', '2019-03-05', '09:23:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216856367913', 1, 5, 'B7', 200, '08:55:00', '00:13:20', '00:21:40', '2019-03-05', '08:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216856406899', 7, 3, 'B2', 200, '08:58:20', '00:13:20', '00:21:40', '2019-03-05', '08:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216856568730', 1, 7, 'B8', 200, '09:05:00', '00:13:20', '00:21:40', '2019-03-05', '08:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216856619597', 2, 6, 'B2', 200, '09:00:00', '00:13:20', '00:21:40', '2019-03-05', '08:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216856626120', 2, 5, 'B4', 200, '09:10:00', '00:13:20', '00:21:40', '2019-03-05', '08:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216856836639', 1, 6, 'B3', 200, '09:15:00', '00:13:20', '00:21:40', '2019-03-05', '09:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216856841156', 6, 2, 'B2', 200, '09:28:20', '00:13:20', '00:21:40', '2019-03-05', '09:13:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216856864058', 7, 3, 'B8', 200, '09:33:20', '00:13:20', '00:21:40', '2019-03-05', '09:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216857124358', 1, 5, 'S5', 100, '10:00:00', '00:06:40', '00:18:20', '2019-03-05', '09:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216857142362', 1, 5, 'B1', 200, '09:45:00', '00:13:20', '00:21:40', '2019-03-05', '09:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216857354700', 1, 5, 'S2', 100, '10:10:00', '00:06:40', '00:18:20', '2019-03-05', '09:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216857398008', 1, 7, 'B5', 200, '09:55:00', '00:13:20', '00:21:40', '2019-03-05', '09:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216857522292', 2, 6, 'B6', 200, '09:50:00', '00:13:20', '00:21:40', '2019-03-05', '09:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216857531296', 5, 1, 'B1', 200, '10:13:20', '00:13:20', '00:21:40', '2019-03-05', '09:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216857590836', 1, 6, 'S1', 100, '10:05:00', '00:06:40', '00:18:20', '2019-03-05', '09:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216857756893', 6, 2, 'B3', 200, '09:43:20', '00:13:20', '00:21:40', '2019-03-05', '09:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216857811284', 6, 2, 'B6', 200, '10:18:20', '00:13:20', '00:21:40', '2019-03-05', '10:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216857850385', 1, 6, 'S4', 100, '10:15:00', '00:06:40', '00:18:20', '2019-03-05', '10:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216857962691', 7, 3, 'B5', 200, '10:23:20', '00:13:20', '00:21:40', '2019-03-05', '10:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216858108998', 6, 1, 'S1', 100, '10:26:40', '00:06:40', '00:18:20', '2019-03-05', '10:11:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216858192014', 6, 1, 'S4', 100, '10:36:40', '00:06:40', '00:18:20', '2019-03-05', '10:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216858260568', 5, 4, 'S2', 100, '10:31:40', '00:06:40', '00:18:20', '2019-03-05', '10:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216858298212', 4, 7, 'B6', 200, '10:50:00', '00:13:20', '00:21:40', '2019-03-05', '10:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216858552935', 1, 5, 'S3', 100, '10:35:00', '00:06:40', '00:18:20', '2019-03-05', '10:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216858586375', 4, 6, 'B5', 200, '10:40:00', '00:13:20', '00:21:40', '2019-03-05', '10:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216858615983', 1, 5, 'B8', 200, '10:45:00', '00:13:20', '00:21:40', '2019-03-05', '10:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216858792220', 1, 6, 'B2', 200, '10:55:00', '00:13:20', '00:21:40', '2019-03-05', '10:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216858845596', 2, 5, 'B7', 200, '11:00:00', '00:13:20', '00:21:40', '2019-03-05', '10:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216858961016', 5, 4, 'S5', 100, '10:21:40', '00:06:40', '00:18:20', '2019-03-05', '10:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216859161199', 2, 6, 'B4', 200, '11:30:00', '00:13:20', '00:21:40', '2019-03-05', '11:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216859232359', 6, 1, 'B5', 200, '11:08:20', '00:13:20', '00:21:40', '2019-03-05', '10:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216859320033', 1, 7, 'B1', 200, '11:35:00', '00:13:20', '00:21:40', '2019-03-05', '11:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216859327960', 6, 1, 'B2', 200, '11:23:20', '00:13:20', '00:21:40', '2019-03-05', '11:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216859447399', 7, 3, 'B6', 200, '11:18:20', '00:13:20', '00:21:40', '2019-03-05', '11:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216859525019', 1, 5, 'B3', 200, '11:25:00', '00:13:20', '00:21:40', '2019-03-05', '11:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216859575608', 5, 2, 'B7', 200, '11:28:20', '00:13:20', '00:21:40', '2019-03-05', '11:13:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216859670731', 2, 5, 'B4', 200, '11:40:00', '00:13:20', '00:21:40', '2019-03-05', '11:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216859861709', 5, 1, 'S3', 100, '10:56:40', '00:06:40', '00:18:20', '2019-03-05', '10:41:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216859955269', 5, 2, 'B8', 200, '11:13:20', '00:13:20', '00:21:40', '2019-03-05', '10:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216859989529', 1, 6, 'B1', 200, '11:45:00', '00:13:20', '00:21:40', '2019-03-05', '11:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216860154231', 1, 6, 'B2', 200, '12:35:00', '00:13:20', '00:21:40', '2019-03-05', '12:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216860207912', 7, 3, 'B1', 200, '12:03:20', '00:13:20', '00:21:40', '2019-03-05', '11:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216860303414', 2, 6, 'B8', 200, '12:20:00', '00:13:20', '00:21:40', '2019-03-05', '12:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216860417090', 5, 1, 'B4', 200, '12:08:20', '00:13:20', '00:21:40', '2019-03-05', '11:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216860445169', 1, 7, 'B5', 200, '12:25:00', '00:13:20', '00:21:40', '2019-03-05', '12:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216860516741', 6, 2, 'B4', 200, '11:58:20', '00:13:20', '00:21:40', '2019-03-05', '11:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216860638838', 1, 5, 'B6', 200, '12:15:00', '00:13:20', '00:21:40', '2019-03-05', '12:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216860641185', 2, 5, 'B3', 200, '12:30:00', '00:13:20', '00:21:40', '2019-03-05', '12:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216860730085', 6, 2, 'B1', 200, '12:13:20', '00:13:20', '00:21:40', '2019-03-05', '11:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216860775670', 5, 1, 'B6', 200, '12:43:20', '00:13:20', '00:21:40', '2019-03-05', '12:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216860898403', 5, 1, 'B3', 200, '11:53:20', '00:13:20', '00:21:40', '2019-03-05', '11:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216861225100', 6, 2, 'B2', 200, '13:03:20', '00:13:20', '00:21:40', '2019-03-05', '12:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216861509875', 3, 6, 'B7', 200, '13:35:00', '00:13:20', '00:21:40', '2019-03-05', '13:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216861711554', 1, 5, 'S2', 100, '13:30:00', '00:06:40', '00:18:20', '2019-03-05', '13:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216861729405', 7, 3, 'B5', 200, '12:53:20', '00:13:20', '00:21:40', '2019-03-05', '12:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216861771997', 1, 7, 'S1', 100, '13:15:00', '00:06:40', '00:18:20', '2019-03-05', '13:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216861789995', 6, 2, 'B8', 200, '12:48:20', '00:13:20', '00:21:40', '2019-03-05', '12:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216861824338', 1, 5, 'S4', 100, '13:20:00', '00:06:40', '00:18:20', '2019-03-05', '13:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216861854394', 1, 5, 'B7', 200, '13:05:00', '00:13:20', '00:21:40', '2019-03-05', '12:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216861903451', 1, 6, 'S5', 100, '13:25:00', '00:06:40', '00:18:20', '2019-03-05', '13:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216861946466', 1, 6, 'S3', 100, '13:10:00', '00:06:40', '00:18:20', '2019-03-05', '12:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216861972407', 5, 1, 'B3', 200, '12:58:20', '00:13:20', '00:21:40', '2019-03-05', '12:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216862216887', 5, 2, 'S4', 100, '13:41:40', '00:06:40', '00:18:20', '2019-03-05', '13:26:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216862246082', 5, 1, 'B7', 200, '13:33:20', '00:13:20', '00:21:40', '2019-03-05', '13:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216862473344', 1, 5, 'B2', 200, '13:55:00', '00:13:20', '00:21:40', '2019-03-05', '13:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216862496802', 6, 1, 'B7', 200, '14:03:20', '00:13:20', '00:21:40', '2019-03-05', '13:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216862675862', 6, 3, 'S5', 100, '13:46:40', '00:06:40', '00:18:20', '2019-03-05', '13:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216862682780', 6, 2, 'S3', 100, '13:31:40', '00:06:40', '00:18:20', '2019-03-05', '13:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216862829409', 7, 3, 'S1', 100, '13:36:40', '00:06:40', '00:18:20', '2019-03-05', '13:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216862831583', 1, 5, 'B6', 200, '13:40:00', '00:13:20', '00:21:40', '2019-03-05', '13:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216862844032', 5, 2, 'B6', 200, '14:08:20', '00:13:20', '00:21:40', '2019-03-05', '13:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216862962584', 5, 1, 'S2', 100, '13:51:40', '00:06:40', '00:18:20', '2019-03-05', '13:36:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216863187384', 7, 3, 'B4', 200, '14:33:20', '00:13:20', '00:21:40', '2019-03-05', '14:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216863204891', 6, 2, 'B1', 200, '14:28:20', '00:13:20', '00:21:40', '2019-03-05', '14:13:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216863285963', 2, 6, 'B1', 200, '14:00:00', '00:13:20', '00:21:40', '2019-03-05', '13:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216863333295', 5, 1, 'B3', 200, '14:38:20', '00:13:20', '00:21:40', '2019-03-05', '14:23:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216863735995', 1, 7, 'B4', 200, '14:05:00', '00:13:20', '00:21:40', '2019-03-05', '13:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216863760779', 5, 1, 'B2', 200, '14:23:20', '00:13:20', '00:21:40', '2019-03-05', '14:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216863841118', 6, 2, 'B8', 200, '14:43:20', '00:13:20', '00:21:40', '2019-03-05', '14:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216863932443', 1, 6, 'B8', 200, '14:15:00', '00:13:20', '00:21:40', '2019-03-05', '14:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216863941096', 2, 5, 'B3', 200, '14:10:00', '00:13:20', '00:21:40', '2019-03-05', '13:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216864244619', 1, 5, 'S4', 100, '15:10:00', '00:06:40', '00:18:20', '2019-03-05', '14:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216864320931', 1, 5, 'B2', 200, '15:20:00', '00:13:20', '00:21:40', '2019-03-05', '15:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216864430646', 1, 5, 'S5', 100, '15:00:00', '00:06:40', '00:18:20', '2019-03-05', '14:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216864502098', 1, 6, 'S2', 100, '14:50:00', '00:06:40', '00:18:20', '2019-03-05', '14:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216864521863', 1, 7, 'S1', 100, '14:55:00', '00:06:40', '00:18:20', '2019-03-05', '14:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216864542831', 1, 5, 'B5', 200, '14:45:00', '00:13:20', '00:21:40', '2019-03-05', '14:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216864598066', 3, 6, 'B5', 200, '15:15:00', '00:13:20', '00:21:40', '2019-03-05', '15:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216864741836', 1, 6, 'S3', 100, '15:05:00', '00:06:40', '00:18:20', '2019-03-05', '14:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216865155504', 5, 2, 'B2', 200, '15:48:20', '00:13:20', '00:21:40', '2019-03-05', '15:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216865472893', 6, 1, 'B5', 200, '15:43:20', '00:13:20', '00:21:40', '2019-03-05', '15:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216865548708', 2, 5, 'B3', 200, '15:50:00', '00:13:20', '00:21:40', '2019-03-05', '15:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216865579740', 7, 3, 'S1', 100, '15:16:40', '00:06:40', '00:18:20', '2019-03-05', '15:01:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216865593733', 6, 2, 'S2', 100, '15:11:40', '00:06:40', '00:18:20', '2019-03-05', '14:56:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216865619771', 2, 6, 'B6', 200, '15:40:00', '00:13:20', '00:21:40', '2019-03-05', '15:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216865671753', 5, 1, 'B5', 200, '15:13:20', '00:13:20', '00:21:40', '2019-03-05', '14:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216865692685', 6, 3, 'S3', 100, '15:26:40', '00:06:40', '00:18:20', '2019-03-05', '15:11:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216865762715', 5, 2, 'S5', 100, '15:21:40', '00:06:40', '00:18:20', '2019-03-05', '15:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216865909701', 1, 5, 'B8', 200, '15:35:00', '00:13:20', '00:21:40', '2019-03-05', '15:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216865935470', 5, 1, 'S4', 100, '15:31:40', '00:06:40', '00:18:20', '2019-03-05', '15:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216865952951', 1, 7, 'B7', 200, '15:45:00', '00:13:20', '00:21:40', '2019-03-05', '15:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216866186095', 6, 2, 'B6', 200, '16:08:20', '00:13:20', '00:21:40', '2019-03-05', '15:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216866205362', 7, 3, 'B7', 200, '16:13:20', '00:13:20', '00:21:40', '2019-03-05', '15:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216866299482', 6, 2, 'B1', 200, '16:23:20', '00:13:20', '00:21:40', '2019-03-05', '16:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216866309624', 5, 1, 'B3', 200, '16:18:20', '00:13:20', '00:21:40', '2019-03-05', '16:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216866546490', 1, 6, 'B1', 200, '15:55:00', '00:13:20', '00:21:40', '2019-03-05', '15:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551756216866836624', 5, 1, 'B8', 200, '16:03:20', '00:13:20', '00:21:40', '2019-03-05', '15:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696742108836', 1, 5, 'S1', 100, '07:15:00', '00:06:40', '00:18:20', '2019-03-06', '07:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696742894331', 2, 6, 'B8', 200, '07:20:00', '00:13:20', '00:21:40', '2019-03-06', '07:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696743238340', 1, 7, 'S4', 100, '07:30:00', '00:06:40', '00:18:20', '2019-03-06', '07:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696743435758', 1, 6, 'B4', 200, '07:40:00', '00:13:20', '00:21:40', '2019-03-06', '07:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696743442299', 2, 5, 'B3', 200, '07:35:00', '00:13:20', '00:21:40', '2019-03-06', '07:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696743690133', 1, 5, 'S2', 100, '07:25:00', '00:06:40', '00:18:20', '2019-03-06', '07:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696743842283', 1, 7, 'S5', 100, '07:45:00', '00:06:40', '00:18:20', '2019-03-06', '07:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696744143093', 6, 2, 'B4', 200, '08:08:20', '00:13:20', '00:21:40', '2019-03-06', '07:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696744364061', 5, 2, 'S2', 100, '07:46:40', '00:06:40', '00:18:20', '2019-03-06', '07:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696744423344', 7, 3, 'S4', 100, '07:51:40', '00:06:40', '00:18:20', '2019-03-06', '07:36:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696744744304', 5, 1, 'B3', 200, '08:03:20', '00:13:20', '00:21:40', '2019-03-06', '07:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696744772811', 5, 1, 'S1', 100, '07:36:40', '00:06:40', '00:18:20', '2019-03-06', '07:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696744926538', 6, 1, 'B8', 200, '07:48:20', '00:13:20', '00:21:40', '2019-03-06', '07:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696745765746', 7, 3, 'S5', 100, '08:06:40', '00:06:40', '00:18:20', '2019-03-06', '07:51:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696745826976', 1, 7, 'S3', 100, '08:15:00', '00:06:40', '00:18:20', '2019-03-06', '08:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696745859776', 2, 5, 'B1', 200, '08:20:00', '00:13:20', '00:21:40', '2019-03-06', '08:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696745930870', 2, 6, 'B6', 200, '08:10:00', '00:13:20', '00:21:40', '2019-03-06', '07:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696745977999', 1, 5, 'B5', 200, '08:05:00', '00:13:20', '00:21:40', '2019-03-06', '07:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696746149030', 7, 3, 'S3', 100, '08:36:40', '00:06:40', '00:18:20', '2019-03-06', '08:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696746239216', 2, 7, 'B2', 200, '08:30:00', '00:13:20', '00:21:40', '2019-03-06', '08:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696746315636', 5, 1, 'B1', 200, '08:48:20', '00:13:20', '00:21:40', '2019-03-06', '08:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696746463845', 5, 1, 'B5', 200, '08:33:20', '00:13:20', '00:21:40', '2019-03-06', '08:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696746521968', 6, 2, 'B6', 200, '08:38:20', '00:13:20', '00:21:40', '2019-03-06', '08:23:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696746603485', 6, 2, 'B7', 200, '08:53:20', '00:13:20', '00:21:40', '2019-03-06', '08:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696746927790', 1, 6, 'B7', 200, '08:25:00', '00:13:20', '00:21:40', '2019-03-06', '08:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696746988775', 7, 3, 'B2', 200, '08:58:20', '00:13:20', '00:21:40', '2019-03-06', '08:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696747386254', 2, 6, 'B2', 200, '09:00:00', '00:13:20', '00:21:40', '2019-03-06', '08:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696747776317', 1, 5, 'B7', 200, '08:55:00', '00:13:20', '00:21:40', '2019-03-06', '08:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696747933255', 2, 5, 'B4', 200, '09:10:00', '00:13:20', '00:21:40', '2019-03-06', '08:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696747993724', 1, 7, 'B8', 200, '09:05:00', '00:13:20', '00:21:40', '2019-03-06', '08:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696748159692', 6, 2, 'B2', 200, '09:28:20', '00:13:20', '00:21:40', '2019-03-06', '09:13:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696748374971', 7, 3, 'B8', 200, '09:33:20', '00:13:20', '00:21:40', '2019-03-06', '09:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696748405336', 5, 1, 'B7', 200, '09:23:20', '00:13:20', '00:21:40', '2019-03-06', '09:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696748533619', 6, 2, 'B3', 200, '09:43:20', '00:13:20', '00:21:40', '2019-03-06', '09:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696748675685', 1, 6, 'B3', 200, '09:15:00', '00:13:20', '00:21:40', '2019-03-06', '09:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696748724074', 5, 1, 'B4', 200, '09:38:20', '00:13:20', '00:21:40', '2019-03-06', '09:23:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696749126999', 1, 5, 'S5', 100, '10:00:00', '00:06:40', '00:18:20', '2019-03-06', '09:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696749154600', 1, 5, 'S2', 100, '10:10:00', '00:06:40', '00:18:20', '2019-03-06', '09:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696749293828', 2, 6, 'B6', 200, '09:50:00', '00:13:20', '00:21:40', '2019-03-06', '09:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696749358270', 1, 7, 'B5', 200, '09:55:00', '00:13:20', '00:21:40', '2019-03-06', '09:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696749390450', 1, 5, 'B1', 200, '09:45:00', '00:13:20', '00:21:40', '2019-03-06', '09:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696749495653', 1, 6, 'S1', 100, '10:05:00', '00:06:40', '00:18:20', '2019-03-06', '09:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696749832967', 1, 6, 'S4', 100, '10:15:00', '00:06:40', '00:18:20', '2019-03-06', '10:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696750315122', 5, 1, 'B1', 200, '10:13:20', '00:13:20', '00:21:40', '2019-03-06', '09:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696750559733', 6, 1, 'S4', 100, '10:36:40', '00:06:40', '00:18:20', '2019-03-06', '10:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696750713303', 6, 1, 'S1', 100, '10:26:40', '00:06:40', '00:18:20', '2019-03-06', '10:11:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696750736044', 4, 6, 'B5', 200, '10:40:00', '00:13:20', '00:21:40', '2019-03-06', '10:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696750764323', 5, 4, 'S2', 100, '10:31:40', '00:06:40', '00:18:20', '2019-03-06', '10:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696750785732', 6, 2, 'B6', 200, '10:18:20', '00:13:20', '00:21:40', '2019-03-06', '10:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696750810699', 7, 3, 'B5', 200, '10:23:20', '00:13:20', '00:21:40', '2019-03-06', '10:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696750811164', 1, 5, 'S3', 100, '10:35:00', '00:06:40', '00:18:20', '2019-03-06', '10:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696750852170', 5, 4, 'S5', 100, '10:21:40', '00:06:40', '00:18:20', '2019-03-06', '10:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696751345072', 7, 3, 'B6', 200, '11:18:20', '00:13:20', '00:21:40', '2019-03-06', '11:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696751393685', 5, 1, 'S3', 100, '10:56:40', '00:06:40', '00:18:20', '2019-03-06', '10:41:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696751438982', 6, 1, 'B5', 200, '11:08:20', '00:13:20', '00:21:40', '2019-03-06', '10:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696751469480', 1, 5, 'B8', 200, '10:45:00', '00:13:20', '00:21:40', '2019-03-06', '10:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696751500863', 1, 6, 'B2', 200, '10:55:00', '00:13:20', '00:21:40', '2019-03-06', '10:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696751528708', 5, 2, 'B8', 200, '11:13:20', '00:13:20', '00:21:40', '2019-03-06', '10:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696751777964', 6, 1, 'B2', 200, '11:23:20', '00:13:20', '00:21:40', '2019-03-06', '11:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696751782396', 5, 2, 'B7', 200, '11:28:20', '00:13:20', '00:21:40', '2019-03-06', '11:13:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696751836682', 4, 7, 'B6', 200, '10:50:00', '00:13:20', '00:21:40', '2019-03-06', '10:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696751849259', 2, 5, 'B7', 200, '11:00:00', '00:13:20', '00:21:40', '2019-03-06', '10:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696751893376', 1, 5, 'B3', 200, '11:25:00', '00:13:20', '00:21:40', '2019-03-06', '11:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696752208781', 2, 5, 'B4', 200, '11:40:00', '00:13:20', '00:21:40', '2019-03-06', '11:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696752208915', 2, 6, 'B8', 200, '12:20:00', '00:13:20', '00:21:40', '2019-03-06', '12:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696752223392', 1, 7, 'B5', 200, '12:25:00', '00:13:20', '00:21:40', '2019-03-06', '12:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696752230599', 6, 2, 'B1', 200, '12:13:20', '00:13:20', '00:21:40', '2019-03-06', '11:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696752243033', 1, 7, 'B1', 200, '11:35:00', '00:13:20', '00:21:40', '2019-03-06', '11:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696752411335', 6, 2, 'B4', 200, '11:58:20', '00:13:20', '00:21:40', '2019-03-06', '11:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696752517254', 5, 1, 'B4', 200, '12:08:20', '00:13:20', '00:21:40', '2019-03-06', '11:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696752544272', 7, 3, 'B1', 200, '12:03:20', '00:13:20', '00:21:40', '2019-03-06', '11:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696752782812', 1, 5, 'B6', 200, '12:15:00', '00:13:20', '00:21:40', '2019-03-06', '12:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696752821502', 2, 6, 'B4', 200, '11:30:00', '00:13:20', '00:21:40', '2019-03-06', '11:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696752863602', 1, 6, 'B1', 200, '11:45:00', '00:13:20', '00:21:40', '2019-03-06', '11:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696752908131', 5, 1, 'B3', 200, '11:53:20', '00:13:20', '00:21:40', '2019-03-06', '11:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696752965846', 2, 5, 'B3', 200, '12:30:00', '00:13:20', '00:21:40', '2019-03-06', '12:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696753133259', 5, 1, 'B6', 200, '12:43:20', '00:13:20', '00:21:40', '2019-03-06', '12:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696753204395', 1, 5, 'B7', 200, '13:05:00', '00:13:20', '00:21:40', '2019-03-06', '12:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696753233376', 5, 1, 'B3', 200, '12:58:20', '00:13:20', '00:21:40', '2019-03-06', '12:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696753354531', 6, 2, 'B2', 200, '13:03:20', '00:13:20', '00:21:40', '2019-03-06', '12:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696753385387', 6, 2, 'B8', 200, '12:48:20', '00:13:20', '00:21:40', '2019-03-06', '12:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696753415931', 6, 2, 'S3', 100, '13:31:40', '00:06:40', '00:18:20', '2019-03-06', '13:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696753461673', 1, 5, 'S4', 100, '13:20:00', '00:06:40', '00:18:20', '2019-03-06', '13:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696753494663', 7, 3, 'B5', 200, '12:53:20', '00:13:20', '00:21:40', '2019-03-06', '12:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696753497536', 1, 7, 'S1', 100, '13:15:00', '00:06:40', '00:18:20', '2019-03-06', '13:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696753614545', 1, 6, 'S5', 100, '13:25:00', '00:06:40', '00:18:20', '2019-03-06', '13:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696753620578', 3, 6, 'B7', 200, '13:35:00', '00:13:20', '00:21:40', '2019-03-06', '13:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696753638897', 5, 1, 'B7', 200, '13:33:20', '00:13:20', '00:21:40', '2019-03-06', '13:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696753646447', 5, 2, 'S4', 100, '13:41:40', '00:06:40', '00:18:20', '2019-03-06', '13:26:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696753658043', 1, 5, 'S2', 100, '13:30:00', '00:06:40', '00:18:20', '2019-03-06', '13:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696753770089', 1, 6, 'S3', 100, '13:10:00', '00:06:40', '00:18:20', '2019-03-06', '12:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696753926466', 7, 3, 'S1', 100, '13:36:40', '00:06:40', '00:18:20', '2019-03-06', '13:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696753948611', 1, 6, 'B2', 200, '12:35:00', '00:13:20', '00:21:40', '2019-03-06', '12:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696753957917', 1, 5, 'B6', 200, '13:40:00', '00:13:20', '00:21:40', '2019-03-06', '13:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696754122421', 1, 6, 'S2', 100, '14:50:00', '00:06:40', '00:18:20', '2019-03-06', '14:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696754154675', 1, 6, 'B8', 200, '14:15:00', '00:13:20', '00:21:40', '2019-03-06', '14:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696754228784', 1, 7, 'S1', 100, '14:55:00', '00:06:40', '00:18:20', '2019-03-06', '14:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696754246663', 6, 2, 'B1', 200, '14:28:20', '00:13:20', '00:21:40', '2019-03-06', '14:13:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696754281685', 2, 5, 'B3', 200, '14:10:00', '00:13:20', '00:21:40', '2019-03-06', '13:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696754338214', 5, 2, 'B6', 200, '14:08:20', '00:13:20', '00:21:40', '2019-03-06', '13:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696754341684', 1, 5, 'B5', 200, '14:45:00', '00:13:20', '00:21:40', '2019-03-06', '14:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696754363521', 1, 7, 'B4', 200, '14:05:00', '00:13:20', '00:21:40', '2019-03-06', '13:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696754363819', 6, 3, 'S5', 100, '13:46:40', '00:06:40', '00:18:20', '2019-03-06', '13:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696754364737', 5, 1, 'S2', 100, '13:51:40', '00:06:40', '00:18:20', '2019-03-06', '13:36:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696754411200', 6, 2, 'B8', 200, '14:43:20', '00:13:20', '00:21:40', '2019-03-06', '14:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696754442127', 7, 3, 'B4', 200, '14:33:20', '00:13:20', '00:21:40', '2019-03-06', '14:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696754631998', 6, 1, 'B7', 200, '14:03:20', '00:13:20', '00:21:40', '2019-03-06', '13:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696754672069', 1, 5, 'B2', 200, '13:55:00', '00:13:20', '00:21:40', '2019-03-06', '13:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696754827280', 5, 1, 'B3', 200, '14:38:20', '00:13:20', '00:21:40', '2019-03-06', '14:23:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696754861375', 2, 6, 'B1', 200, '14:00:00', '00:13:20', '00:21:40', '2019-03-06', '13:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696754921701', 5, 1, 'B2', 200, '14:23:20', '00:13:20', '00:21:40', '2019-03-06', '14:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696755138401', 2, 6, 'B6', 200, '15:40:00', '00:13:20', '00:21:40', '2019-03-06', '15:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696755202470', 5, 2, 'S5', 100, '15:21:40', '00:06:40', '00:18:20', '2019-03-06', '15:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696755202507', 5, 2, 'B2', 200, '15:48:20', '00:13:20', '00:21:40', '2019-03-06', '15:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696755242160', 2, 5, 'B3', 200, '15:50:00', '00:13:20', '00:21:40', '2019-03-06', '15:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696755261156', 5, 1, 'S4', 100, '15:31:40', '00:06:40', '00:18:20', '2019-03-06', '15:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696755347110', 1, 7, 'B7', 200, '15:45:00', '00:13:20', '00:21:40', '2019-03-06', '15:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696755351135', 1, 6, 'B1', 200, '15:55:00', '00:13:20', '00:21:40', '2019-03-06', '15:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696755359086', 5, 1, 'B5', 200, '15:13:20', '00:13:20', '00:21:40', '2019-03-06', '14:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696755391094', 6, 2, 'S2', 100, '15:11:40', '00:06:40', '00:18:20', '2019-03-06', '14:56:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696755406538', 1, 5, 'B2', 200, '15:20:00', '00:13:20', '00:21:40', '2019-03-06', '15:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696755498750', 7, 3, 'S1', 100, '15:16:40', '00:06:40', '00:18:20', '2019-03-06', '15:01:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696755570203', 1, 6, 'S3', 100, '15:05:00', '00:06:40', '00:18:20', '2019-03-06', '14:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696755623759', 1, 5, 'S5', 100, '15:00:00', '00:06:40', '00:18:20', '2019-03-06', '14:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696755629035', 6, 3, 'S3', 100, '15:26:40', '00:06:40', '00:18:20', '2019-03-06', '15:11:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696755651819', 1, 5, 'S4', 100, '15:10:00', '00:06:40', '00:18:20', '2019-03-06', '14:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696755873054', 6, 1, 'B5', 200, '15:43:20', '00:13:20', '00:21:40', '2019-03-06', '15:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696755879534', 3, 6, 'B5', 200, '15:15:00', '00:13:20', '00:21:40', '2019-03-06', '15:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696755911275', 1, 5, 'B8', 200, '15:35:00', '00:13:20', '00:21:40', '2019-03-06', '15:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696756229124', 6, 2, 'B1', 200, '16:23:20', '00:13:20', '00:21:40', '2019-03-06', '16:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696756493610', 7, 3, 'B7', 200, '16:13:20', '00:13:20', '00:21:40', '2019-03-06', '15:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696756643104', 6, 2, 'B6', 200, '16:08:20', '00:13:20', '00:21:40', '2019-03-06', '15:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696756644377', 5, 1, 'B3', 200, '16:18:20', '00:13:20', '00:21:40', '2019-03-06', '16:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1551792696756797153', 5, 1, 'B8', 200, '16:03:20', '00:13:20', '00:21:40', '2019-03-06', '15:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624029128975', 1, 5, 'S1', 100, '07:15:00', '00:06:40', '00:18:20', '2019-04-13', '07:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624029557642', 2, 6, 'B8', 200, '07:20:00', '00:13:20', '00:21:40', '2019-04-13', '07:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624031271089', 1, 5, 'S2', 100, '07:25:00', '00:06:40', '00:18:20', '2019-04-13', '07:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624032178054', 1, 7, 'S4', 100, '07:30:00', '00:06:40', '00:18:20', '2019-04-13', '07:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624033875631', 1, 6, 'B4', 200, '07:40:00', '00:13:20', '00:21:40', '2019-04-13', '07:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624033971615', 2, 5, 'B3', 200, '07:35:00', '00:13:20', '00:21:40', '2019-04-13', '07:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624034416381', 5, 1, 'S1', 100, '07:36:40', '00:06:40', '00:18:20', '2019-04-13', '07:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624034912145', 1, 7, 'S5', 100, '07:45:00', '00:06:40', '00:18:20', '2019-04-13', '07:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624035251774', 5, 2, 'S2', 100, '07:46:40', '00:06:40', '00:18:20', '2019-04-13', '07:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624035428073', 6, 1, 'B8', 200, '07:48:20', '00:13:20', '00:21:40', '2019-04-13', '07:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624036699162', 7, 3, 'S4', 100, '07:51:40', '00:06:40', '00:18:20', '2019-04-13', '07:36:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624037118633', 5, 1, 'B3', 200, '08:03:20', '00:13:20', '00:21:40', '2019-04-13', '07:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624038822210', 6, 2, 'B4', 200, '08:08:20', '00:13:20', '00:21:40', '2019-04-13', '07:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624039882683', 7, 3, 'S5', 100, '08:06:40', '00:06:40', '00:18:20', '2019-04-13', '07:51:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624040860942', 1, 5, 'B5', 200, '08:05:00', '00:13:20', '00:21:40', '2019-04-13', '07:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624041105342', 1, 7, 'S3', 100, '08:15:00', '00:06:40', '00:18:20', '2019-04-13', '08:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624041528780', 2, 6, 'B6', 200, '08:10:00', '00:13:20', '00:21:40', '2019-04-13', '07:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624041868977', 1, 6, 'B7', 200, '08:25:00', '00:13:20', '00:21:40', '2019-04-13', '08:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624041985759', 2, 5, 'B1', 200, '08:20:00', '00:13:20', '00:21:40', '2019-04-13', '08:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624042192054', 2, 7, 'B2', 200, '08:30:00', '00:13:20', '00:21:40', '2019-04-13', '08:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624042405482', 5, 1, 'B5', 200, '08:33:20', '00:13:20', '00:21:40', '2019-04-13', '08:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624042706344', 6, 2, 'B6', 200, '08:38:20', '00:13:20', '00:21:40', '2019-04-13', '08:23:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624042762019', 7, 3, 'S3', 100, '08:36:40', '00:06:40', '00:18:20', '2019-04-13', '08:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624043102054', 7, 3, 'B2', 200, '08:58:20', '00:13:20', '00:21:40', '2019-04-13', '08:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624043194224', 6, 2, 'B7', 200, '08:53:20', '00:13:20', '00:21:40', '2019-04-13', '08:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624043427333', 5, 1, 'B1', 200, '08:48:20', '00:13:20', '00:21:40', '2019-04-13', '08:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624043445199', 1, 5, 'B7', 200, '08:55:00', '00:13:20', '00:21:40', '2019-04-13', '08:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624044312424', 2, 5, 'B4', 200, '09:10:00', '00:13:20', '00:21:40', '2019-04-13', '08:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624044444140', 1, 6, 'B3', 200, '09:15:00', '00:13:20', '00:21:40', '2019-04-13', '09:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624044577851', 1, 7, 'B8', 200, '09:05:00', '00:13:20', '00:21:40', '2019-04-13', '08:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624044942598', 2, 6, 'B2', 200, '09:00:00', '00:13:20', '00:21:40', '2019-04-13', '08:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624045202791', 5, 1, 'B7', 200, '09:23:20', '00:13:20', '00:21:40', '2019-04-13', '09:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624045609051', 6, 2, 'B2', 200, '09:28:20', '00:13:20', '00:21:40', '2019-04-13', '09:13:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624045827533', 7, 3, 'B8', 200, '09:33:20', '00:13:20', '00:21:40', '2019-04-13', '09:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624046682132', 5, 1, 'B4', 200, '09:38:20', '00:13:20', '00:21:40', '2019-04-13', '09:23:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624046846218', 6, 2, 'B3', 200, '09:43:20', '00:13:20', '00:21:40', '2019-04-13', '09:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624047789843', 1, 7, 'B5', 200, '09:55:00', '00:13:20', '00:21:40', '2019-04-13', '09:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624047796608', 1, 5, 'B1', 200, '09:45:00', '00:13:20', '00:21:40', '2019-04-13', '09:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624047808039', 2, 6, 'B6', 200, '09:50:00', '00:13:20', '00:21:40', '2019-04-13', '09:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624048330790', 1, 6, 'S1', 100, '10:05:00', '00:06:40', '00:18:20', '2019-04-13', '09:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624048591719', 1, 5, 'S2', 100, '10:10:00', '00:06:40', '00:18:20', '2019-04-13', '09:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624048770499', 1, 5, 'S5', 100, '10:00:00', '00:06:40', '00:18:20', '2019-04-13', '09:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624049133253', 7, 3, 'B5', 200, '10:23:20', '00:13:20', '00:21:40', '2019-04-13', '10:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624049320131', 5, 1, 'B1', 200, '10:13:20', '00:13:20', '00:21:40', '2019-04-13', '09:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624049391240', 5, 4, 'S5', 100, '10:21:40', '00:06:40', '00:18:20', '2019-04-13', '10:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624049593289', 1, 6, 'S4', 100, '10:15:00', '00:06:40', '00:18:20', '2019-04-13', '10:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624049707835', 6, 1, 'S1', 100, '10:26:40', '00:06:40', '00:18:20', '2019-04-13', '10:11:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624049861564', 6, 2, 'B6', 200, '10:18:20', '00:13:20', '00:21:40', '2019-04-13', '10:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624050110802', 6, 1, 'S4', 100, '10:36:40', '00:06:40', '00:18:20', '2019-04-13', '10:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624050116587', 4, 6, 'B5', 200, '10:40:00', '00:13:20', '00:21:40', '2019-04-13', '10:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624050520638', 1, 5, 'S3', 100, '10:35:00', '00:06:40', '00:18:20', '2019-04-13', '10:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624050647964', 2, 5, 'B7', 200, '11:00:00', '00:13:20', '00:21:40', '2019-04-13', '10:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624050712118', 1, 6, 'B2', 200, '10:55:00', '00:13:20', '00:21:40', '2019-04-13', '10:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624050887837', 1, 5, 'B8', 200, '10:45:00', '00:13:20', '00:21:40', '2019-04-13', '10:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624050980118', 5, 4, 'S2', 100, '10:31:40', '00:06:40', '00:18:20', '2019-04-13', '10:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624050986972', 4, 7, 'B6', 200, '10:50:00', '00:13:20', '00:21:40', '2019-04-13', '10:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624051299182', 5, 2, 'B8', 200, '11:13:20', '00:13:20', '00:21:40', '2019-04-13', '10:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624051338056', 6, 1, 'B5', 200, '11:08:20', '00:13:20', '00:21:40', '2019-04-13', '10:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624051391443', 5, 1, 'S3', 100, '10:56:40', '00:06:40', '00:18:20', '2019-04-13', '10:41:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624052204182', 7, 3, 'B6', 200, '11:18:20', '00:13:20', '00:21:40', '2019-04-13', '11:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624052276584', 6, 1, 'B2', 200, '11:23:20', '00:13:20', '00:21:40', '2019-04-13', '11:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624053342249', 1, 5, 'B3', 200, '11:25:00', '00:13:20', '00:21:40', '2019-04-13', '11:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624053359014', 5, 2, 'B7', 200, '11:28:20', '00:13:20', '00:21:40', '2019-04-13', '11:13:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624054104846', 1, 6, 'B1', 200, '11:45:00', '00:13:20', '00:21:40', '2019-04-13', '11:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624054259715', 2, 5, 'B4', 200, '11:40:00', '00:13:20', '00:21:40', '2019-04-13', '11:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624054451426', 6, 2, 'B4', 200, '11:58:20', '00:13:20', '00:21:40', '2019-04-13', '11:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624054718838', 1, 7, 'B1', 200, '11:35:00', '00:13:20', '00:21:40', '2019-04-13', '11:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624054785571', 5, 1, 'B3', 200, '11:53:20', '00:13:20', '00:21:40', '2019-04-13', '11:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624054889754', 2, 6, 'B4', 200, '11:30:00', '00:13:20', '00:21:40', '2019-04-13', '11:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624055370468', 6, 2, 'B1', 200, '12:13:20', '00:13:20', '00:21:40', '2019-04-13', '11:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624055501040', 2, 5, 'B3', 200, '12:30:00', '00:13:20', '00:21:40', '2019-04-13', '12:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624055536369', 2, 6, 'B8', 200, '12:20:00', '00:13:20', '00:21:40', '2019-04-13', '12:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624055632468', 7, 3, 'B1', 200, '12:03:20', '00:13:20', '00:21:40', '2019-04-13', '11:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624055812558', 1, 5, 'B6', 200, '12:15:00', '00:13:20', '00:21:40', '2019-04-13', '12:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624055822897', 1, 7, 'B5', 200, '12:25:00', '00:13:20', '00:21:40', '2019-04-13', '12:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624055974153', 5, 1, 'B4', 200, '12:08:20', '00:13:20', '00:21:40', '2019-04-13', '11:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624056291804', 5, 1, 'B3', 200, '12:58:20', '00:13:20', '00:21:40', '2019-04-13', '12:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624056434904', 7, 3, 'B5', 200, '12:53:20', '00:13:20', '00:21:40', '2019-04-13', '12:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624056561442', 1, 6, 'B2', 200, '12:35:00', '00:13:20', '00:21:40', '2019-04-13', '12:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624056587388', 6, 2, 'B2', 200, '13:03:20', '00:13:20', '00:21:40', '2019-04-13', '12:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624056820383', 1, 5, 'B7', 200, '13:05:00', '00:13:20', '00:21:40', '2019-04-13', '12:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624056925188', 6, 2, 'B8', 200, '12:48:20', '00:13:20', '00:21:40', '2019-04-13', '12:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624056983712', 5, 1, 'B6', 200, '12:43:20', '00:13:20', '00:21:40', '2019-04-13', '12:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624057211384', 3, 6, 'B7', 200, '13:35:00', '00:13:20', '00:21:40', '2019-04-13', '13:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624057245787', 1, 6, 'S5', 100, '13:25:00', '00:06:40', '00:18:20', '2019-04-13', '13:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624057626848', 1, 6, 'S3', 100, '13:10:00', '00:06:40', '00:18:20', '2019-04-13', '12:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624057672746', 1, 5, 'S4', 100, '13:20:00', '00:06:40', '00:18:20', '2019-04-13', '13:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624057807511', 1, 7, 'S1', 100, '13:15:00', '00:06:40', '00:18:20', '2019-04-13', '13:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624057945887', 1, 5, 'S2', 100, '13:30:00', '00:06:40', '00:18:20', '2019-04-13', '13:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624057978247', 1, 5, 'B6', 200, '13:40:00', '00:13:20', '00:21:40', '2019-04-13', '13:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624058110715', 5, 1, 'B7', 200, '13:33:20', '00:13:20', '00:21:40', '2019-04-13', '13:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624058289485', 7, 3, 'S1', 100, '13:36:40', '00:06:40', '00:18:20', '2019-04-13', '13:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624058341314', 5, 2, 'B6', 200, '14:08:20', '00:13:20', '00:21:40', '2019-04-13', '13:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624058346634', 6, 2, 'S3', 100, '13:31:40', '00:06:40', '00:18:20', '2019-04-13', '13:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624058438152', 6, 1, 'B7', 200, '14:03:20', '00:13:20', '00:21:40', '2019-04-13', '13:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624058473956', 5, 2, 'S4', 100, '13:41:40', '00:06:40', '00:18:20', '2019-04-13', '13:26:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624058555658', 1, 5, 'B2', 200, '13:55:00', '00:13:20', '00:21:40', '2019-04-13', '13:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624058614292', 6, 3, 'S5', 100, '13:46:40', '00:06:40', '00:18:20', '2019-04-13', '13:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624058619282', 5, 1, 'S2', 100, '13:51:40', '00:06:40', '00:18:20', '2019-04-13', '13:36:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624059146951', 6, 2, 'B1', 200, '14:28:20', '00:13:20', '00:21:40', '2019-04-13', '14:13:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624059244975', 1, 7, 'B4', 200, '14:05:00', '00:13:20', '00:21:40', '2019-04-13', '13:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624059409869', 1, 6, 'B8', 200, '14:15:00', '00:13:20', '00:21:40', '2019-04-13', '14:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624059595959', 2, 6, 'B1', 200, '14:00:00', '00:13:20', '00:21:40', '2019-04-13', '13:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624059674103', 7, 3, 'B4', 200, '14:33:20', '00:13:20', '00:21:40', '2019-04-13', '14:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624059715750', 5, 1, 'B2', 200, '14:23:20', '00:13:20', '00:21:40', '2019-04-13', '14:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624059958625', 2, 5, 'B3', 200, '14:10:00', '00:13:20', '00:21:40', '2019-04-13', '13:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624060131043', 6, 2, 'S2', 100, '15:11:40', '00:06:40', '00:18:20', '2019-04-13', '14:56:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624060399004', 5, 1, 'B5', 200, '15:13:20', '00:13:20', '00:21:40', '2019-04-13', '14:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624060514433', 6, 2, 'B8', 200, '14:43:20', '00:13:20', '00:21:40', '2019-04-13', '14:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624060552088', 5, 1, 'B3', 200, '14:38:20', '00:13:20', '00:21:40', '2019-04-13', '14:23:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624060574132', 1, 6, 'S3', 100, '15:05:00', '00:06:40', '00:18:20', '2019-04-13', '14:50:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624060649064', 1, 5, 'S4', 100, '15:10:00', '00:06:40', '00:18:20', '2019-04-13', '14:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624060651298', 1, 6, 'S2', 100, '14:50:00', '00:06:40', '00:18:20', '2019-04-13', '14:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624060669806', 1, 5, 'B5', 200, '14:45:00', '00:13:20', '00:21:40', '2019-04-13', '14:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624060823691', 3, 6, 'B5', 200, '15:15:00', '00:13:20', '00:21:40', '2019-04-13', '15:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624060840922', 1, 5, 'B2', 200, '15:20:00', '00:13:20', '00:21:40', '2019-04-13', '15:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624060916111', 1, 5, 'S5', 100, '15:00:00', '00:06:40', '00:18:20', '2019-04-13', '14:45:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624060921972', 1, 7, 'S1', 100, '14:55:00', '00:06:40', '00:18:20', '2019-04-13', '14:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624061117439', 5, 1, 'S4', 100, '15:31:40', '00:06:40', '00:18:20', '2019-04-13', '15:16:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624061212792', 5, 2, 'S5', 100, '15:21:40', '00:06:40', '00:18:20', '2019-04-13', '15:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624061257595', 7, 3, 'S1', 100, '15:16:40', '00:06:40', '00:18:20', '2019-04-13', '15:01:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624061508081', 6, 3, 'S3', 100, '15:26:40', '00:06:40', '00:18:20', '2019-04-13', '15:11:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624061686485', 6, 1, 'B5', 200, '15:43:20', '00:13:20', '00:21:40', '2019-04-13', '15:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624062205073', 5, 2, 'B2', 200, '15:48:20', '00:13:20', '00:21:40', '2019-04-13', '15:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624062383979', 2, 5, 'B3', 200, '15:50:00', '00:13:20', '00:21:40', '2019-04-13', '15:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624062589564', 1, 7, 'B7', 200, '15:45:00', '00:13:20', '00:21:40', '2019-04-13', '15:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624062886676', 1, 5, 'B8', 200, '15:35:00', '00:13:20', '00:21:40', '2019-04-13', '15:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624062994563', 2, 6, 'B6', 200, '15:40:00', '00:13:20', '00:21:40', '2019-04-13', '15:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624063405123', 1, 6, 'B1', 200, '15:55:00', '00:13:20', '00:21:40', '2019-04-13', '15:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624063484737', 7, 3, 'B7', 200, '16:13:20', '00:13:20', '00:21:40', '2019-04-13', '15:58:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624063521707', 5, 1, 'B8', 200, '16:03:20', '00:13:20', '00:21:40', '2019-04-13', '15:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624063570797', 6, 2, 'B1', 200, '16:23:20', '00:13:20', '00:21:40', '2019-04-13', '16:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624063823734', 6, 2, 'B6', 200, '16:08:20', '00:13:20', '00:21:40', '2019-04-13', '15:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555296624063950752', 5, 1, 'B3', 200, '16:18:20', '00:13:20', '00:21:40', '2019-04-13', '16:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983590215534', 2, 9, 'B2', 200, '08:51:40', '00:06:40', '00:18:20', null, '08:36:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983590304080', 2, 5, 'S1', 100, '08:21:40', '00:06:40', '00:18:20', null, '08:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983590463383', 4, 8, 'S3', 100, '08:08:20', '00:06:40', '00:18:20', null, '07:53:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983590466311', 3, 6, 'B8', 200, '08:28:20', '00:06:40', '00:18:20', null, '08:13:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983590609857', 7, 4, 'B1', 200, '08:15:00', '00:06:40', '00:18:20', null, '08:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983590832493', 3, 7, 'S4', 100, '07:56:40', '00:06:40', '00:18:20', null, '07:41:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983590885570', 1, 5, 'B1', 200, '07:15:00', '00:06:40', '00:18:20', null, '07:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983590922188', 2, 6, 'S5', 100, '07:45:00', '00:06:40', '00:18:20', null, '07:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983590935106', 1, 8, 'B7', 200, '08:45:00', '00:06:40', '00:18:20', null, '08:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983590960600', 1, 9, 'S2', 100, '08:15:00', '00:06:40', '00:18:20', null, '08:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983591137237', 2, 7, 'B7', 200, '09:47:40', '00:06:40', '00:18:20', null, '09:32:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983591329005', 9, 4, 'B5', 200, '09:45:00', '00:06:40', '00:18:20', null, '09:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983591353885', 1, 6, 'B3', 200, '09:45:00', '00:06:40', '00:18:20', null, '09:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983591416157', 6, 3, 'B8', 200, '08:46:40', '00:06:40', '00:18:20', null, '08:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983591514729', 5, 4, 'B7', 200, '09:15:00', '00:06:40', '00:18:20', null, '09:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983591573210', 2, 7, 'B4', 200, '09:19:10', '00:06:40', '00:18:20', null, '09:04:10');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983591641507', 9, 4, 'B2', 200, '09:10:00', '00:06:40', '00:18:20', null, '08:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983591678799', 1, 5, 'B6', 200, '09:15:00', '00:06:40', '00:18:20', null, '09:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983591707361', 3, 8, 'B5', 200, '09:23:20', '00:06:40', '00:18:20', null, '09:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983591918797', 3, 8, 'B1', 200, '09:50:20', '00:06:40', '00:18:20', null, '09:35:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983592126746', 7, 2, 'S2', 100, '10:21:00', '00:06:40', '00:18:20', null, '10:06:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983592240268', 1, 7, 'B3', 200, '10:48:20', '00:06:40', '00:18:20', null, '10:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983592276976', 9, 3, 'S1', 100, '10:49:40', '00:06:40', '00:18:20', null, '10:34:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983592295399', 9, 4, 'S5', 100, '09:48:20', '00:06:40', '00:18:20', null, '09:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983592337256', 8, 4, 'B6', 200, '10:51:20', '00:06:40', '00:18:20', null, '10:36:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983592420942', 9, 4, 'S3', 100, '09:51:40', '00:06:40', '00:18:20', null, '09:36:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983592519149', 3, 8, 'B5', 200, '10:23:00', '00:06:40', '00:17:40', null, '10:08:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983592533798', 3, 8, 'B8', 200, '10:26:20', '00:06:40', '00:17:40', null, '10:12:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983592548445', 1, 5, 'B4', 200, '10:45:00', '00:06:40', '00:18:20', null, '10:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983592555569', 5, 1, 'B4', 200, '10:15:00', '00:06:40', '00:18:20', null, '10:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983592606336', 2, 6, 'S3', 100, '10:17:40', '00:06:40', '00:18:20', null, '10:02:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983592655404', 8, 2, 'S4', 100, '10:45:00', '00:06:40', '00:15:20', null, '10:33:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983592773067', 4, 6, 'S2', 100, '10:46:40', '00:06:40', '00:18:20', null, '10:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983592831715', 5, 1, 'B4', 200, '11:03:20', '00:06:40', '00:18:20', null, '10:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983592897433', 3, 7, 'S5', 100, '10:20:20', '00:06:40', '00:18:20', null, '10:05:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983592906558', 1, 5, 'B2', 200, '10:15:00', '00:06:40', '00:18:20', null, '10:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983592963321', 6, 2, 'B3', 200, '10:17:40', '00:06:40', '00:18:20', null, '10:02:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983593186650', 6, 2, 'B5', 200, '11:16:40', '00:06:40', '00:18:20', null, '11:01:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983593194366', 3, 7, 'S1', 100, '11:16:40', '00:06:40', '00:18:20', null, '11:01:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983593217563', 4, 9, 'B6', 200, '11:18:20', '00:06:40', '00:18:20', null, '11:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983593247446', 1, 5, 'S3', 100, '11:45:00', '00:06:40', '00:18:20', null, '11:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983593350605', 7, 3, 'B6', 200, '11:36:40', '00:06:40', '00:16:40', null, '11:23:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983593393859', 2, 6, 'S4', 100, '11:15:00', '00:06:40', '00:18:20', null, '11:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983593450316', 4, 8, 'B5', 200, '12:03:20', '00:06:40', '00:18:20', null, '11:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983593461722', 5, 1, 'S3', 100, '11:15:00', '00:06:40', '00:18:20', null, '11:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983593477723', 9, 4, 'B1', 200, '11:51:40', '00:06:40', '00:16:40', null, '11:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983593480792', 9, 4, 'B2', 200, '11:55:00', '00:06:40', '00:16:40', null, '11:41:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983593553413', 9, 4, 'B7', 200, '11:48:20', '00:06:40', '00:16:40', null, '11:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983593595288', 4, 9, 'B4', 200, '11:21:40', '00:06:40', '00:18:20', null, '11:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983593635051', 4, 6, 'S1', 100, '11:58:20', '00:06:40', '00:18:20', null, '11:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983593712043', 9, 3, 'S4', 100, '11:46:40', '00:06:40', '00:18:20', null, '11:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983593741374', 3, 7, 'B6', 200, '12:00:00', '00:06:40', '00:16:40', null, '11:46:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983593755622', 8, 3, 'S1', 100, '11:40:00', '00:06:40', '00:18:20', null, '11:25:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983594113810', 6, 1, 'B5', 200, '12:36:40', '00:06:40', '00:18:20', null, '12:21:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983594138270', 5, 1, 'S4', 100, '12:33:20', '00:06:40', '00:18:20', null, '12:18:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983594149862', 3, 7, 'B8', 200, '12:45:00', '00:06:40', '00:18:20', null, '12:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983594174227', 8, 2, 'B3', 200, '12:25:00', '00:06:40', '00:18:20', null, '12:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983594177787', 2, 8, 'S5', 100, '12:50:00', '00:06:40', '00:18:20', null, '12:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983594242306', 7, 2, 'S5', 100, '12:21:40', '00:06:40', '00:18:20', null, '12:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983594244497', 5, 1, 'B4', 200, '12:45:00', '00:06:40', '00:18:20', null, '12:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983594254161', 2, 8, 'S2', 100, '12:46:40', '00:06:40', '00:18:20', null, '12:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983594299108', 3, 9, 'B5', 200, '12:53:20', '00:06:40', '00:18:20', null, '12:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983594307087', 4, 8, 'B7', 200, '12:25:00', '00:06:40', '00:16:40', null, '12:11:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983594419336', 3, 7, 'B3', 200, '12:48:20', '00:06:40', '00:18:20', null, '12:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983594580539', 4, 6, 'B2', 200, '12:18:20', '00:06:40', '00:16:40', null, '12:05:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983594591758', 6, 1, 'S3', 100, '12:48:20', '00:06:40', '00:18:20', null, '12:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983594761015', 4, 5, 'S4', 100, '12:15:00', '00:06:40', '00:16:40', null, '12:01:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983594764552', 4, 7, 'B1', 200, '12:21:40', '00:06:40', '00:16:40', null, '12:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983594822688', 6, 2, 'S2', 100, '12:18:20', '00:06:40', '00:18:20', null, '12:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983594922828', 5, 2, 'B8', 200, '12:15:00', '00:06:40', '00:18:20', null, '12:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983595111113', 5, 3, 'B3', 200, '13:15:00', '00:06:40', '00:18:20', null, '13:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983595117893', 1, 5, 'S4', 100, '13:15:00', '00:06:40', '00:18:20', null, '13:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983595148042', 6, 3, 'B6', 200, '13:18:20', '00:06:40', '00:18:20', null, '13:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983595239143', 9, 3, 'S1', 100, '13:25:00', '00:06:40', '00:18:20', null, '13:10:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983595410507', 2, 6, 'S5', 100, '13:26:40', '00:06:40', '00:18:20', null, '13:11:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983595424865', 2, 9, 'B4', 200, '13:30:00', '00:06:40', '00:18:20', null, '13:15:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983595545171', 7, 3, 'B8', 200, '13:21:40', '00:06:40', '00:18:20', null, '13:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983595558747', 3, 8, 'S3', 100, '13:28:20', '00:06:40', '00:18:20', null, '13:13:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983595857841', 8, 4, 'S2', 100, '13:23:20', '00:06:40', '00:18:20', null, '13:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983595960278', 7, 1, 'S5', 100, '13:08:20', '00:06:40', '00:16:40', null, '12:55:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983596151239', 6, 1, 'B7', 200, '13:48:20', '00:06:40', '00:18:20', null, '13:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983596273112', 4, 9, 'B6', 200, '13:57:40', '00:06:40', '00:17:40', null, '13:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983596316477', 4, 7, 'S2', 100, '13:51:00', '00:06:40', '00:17:40', null, '13:36:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983596349697', 5, 1, 'B2', 200, '13:45:00', '00:06:40', '00:18:20', null, '13:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983596358034', 4, 5, 'B3', 200, '13:45:00', '00:06:40', '00:18:20', null, '13:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983596562623', 7, 2, 'B1', 200, '13:51:00', '00:06:40', '00:18:20', null, '13:36:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983596574751', 4, 8, 'B8', 200, '13:54:20', '00:06:40', '00:17:40', null, '13:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983596637158', 4, 6, 'S1', 100, '13:47:40', '00:06:40', '00:17:40', null, '13:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983596726439', 2, 9, 'B2', 200, '14:15:00', '00:06:40', '00:18:20', null, '14:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983596819306', 8, 1, 'S2', 100, '14:09:20', '00:06:40', '00:18:20', null, '13:54:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983597191739', 2, 9, 'B7', 200, '14:18:20', '00:06:40', '00:18:20', null, '14:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983597214674', 9, 1, 'B1', 200, '14:39:20', '00:06:40', '00:14:20', null, '14:28:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983597336924', 5, 1, 'S4', 100, '14:50:50', '00:06:40', '00:18:20', null, '14:35:50');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983597537463', 7, 3, 'B5', 200, '14:59:10', '00:06:40', '00:18:20', null, '14:44:10');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983597548224', 5, 1, 'S1', 100, '14:15:00', '00:06:40', '00:18:20', null, '14:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983597600201', 6, 2, 'S3', 100, '14:55:00', '00:06:40', '00:18:20', null, '14:40:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983597636255', 2, 9, 'B1', 200, '14:21:40', '00:06:40', '00:18:20', null, '14:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983597837092', 3, 6, 'S2', 100, '14:45:00', '00:06:40', '00:18:20', null, '14:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983597868544', 8, 1, 'B2', 200, '15:03:20', '00:06:40', '00:18:20', null, '14:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983597878843', 1, 7, 'B1', 200, '14:57:40', '00:06:40', '00:18:20', null, '14:42:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983597903845', 2, 8, 'S1', 100, '15:01:50', '00:06:40', '00:18:20', null, '14:46:50');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983597924126', 9, 3, 'B7', 200, '14:45:00', '00:06:40', '00:16:40', null, '14:31:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983598149914', 2, 5, 'B7', 200, '15:15:00', '00:06:40', '00:16:40', null, '15:01:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983598194381', 8, 2, 'S5', 100, '15:21:40', '00:06:40', '00:18:20', null, '15:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983598222949', 2, 6, 'B8', 200, '16:15:00', '00:06:40', '00:18:20', null, '16:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983598342377', 3, 7, 'B5', 200, '15:45:00', '00:06:40', '00:13:20', null, '15:35:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983598419189', 8, 2, 'B4', 200, '16:15:00', '00:06:40', '00:18:20', null, '16:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983598438494', 3, 6, 'B2', 200, '15:23:20', '00:06:40', '00:18:20', null, '15:08:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983598491270', 4, 8, 'B4', 200, '15:56:40', '00:06:40', '00:18:20', null, '15:41:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983598530706', 3, 9, 'S5', 100, '16:45:00', '00:06:40', '00:18:20', null, '16:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983598637363', 5, 1, 'B6', 200, '15:45:00', '00:06:40', '00:18:20', null, '15:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983598824113', 7, 1, 'B3', 200, '15:15:00', '00:06:40', '00:18:20', null, '15:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983598915203', 6, 4, 'B4', 200, '15:35:00', '00:06:40', '00:18:20', null, '15:20:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983598928372', 5, 3, 'B8', 200, '15:28:20', '00:06:40', '00:18:20', null, '15:13:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983598963150', 1, 7, 'B6', 200, '16:26:40', '00:06:40', '00:18:20', null, '16:11:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983599233727', 5, 1, 'B5', 200, '17:45:00', '00:06:40', '00:18:20', null, '17:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983599306474', 8, 4, 'S2', 100, '17:58:20', '00:06:40', '00:18:20', null, '17:43:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983599441279', 7, 1, 'B6', 200, '16:45:00', '00:06:40', '00:18:20', null, '16:30:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983599522773', 8, 3, 'S5', 100, '17:18:20', '00:06:40', '00:18:20', null, '17:03:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983599859542', 4, 5, 'S4', 100, '16:56:40', '00:06:40', '00:18:20', null, '16:41:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983599908627', 7, 3, 'B1', 200, '17:53:20', '00:06:40', '00:18:20', null, '17:38:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983599926487', 9, 4, 'B8', 200, '17:21:40', '00:06:40', '00:18:20', null, '17:06:40');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983599978722', 6, 2, 'S4', 100, '17:15:00', '00:06:40', '00:18:20', null, '17:00:00');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983599979357', 6, 2, 'B7', 200, '17:48:20', '00:06:40', '00:18:20', null, '17:33:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983600400362', 9, 1, 'S1', 100, '18:03:20', '00:06:40', '00:18:20', null, '17:48:20');
INSERT INTO cruise_ship_management.record (id, start_berth, arrive_berth, ship_name, ship_traffic, arrive_time,
                                           on_or_out_time, total_time, date, start_time)
VALUES ('1555573983600750233', 5, 2, 'B2', 200, '18:08:20', '00:06:40', '00:18:20', null, '17:53:20');
create table ship
(
    id           varchar(64)      not null
        primary key,
    s_number     varchar(16)      null,
    capability   int              null,
    is_available bit default b'1' null
);

INSERT INTO cruise_ship_management.ship (id, s_number, capability, is_available)
VALUES ('1546572904937961949', 'B1', 200, true);
INSERT INTO cruise_ship_management.ship (id, s_number, capability, is_available)
VALUES ('1546572905323828032', 'B2', 200, true);
INSERT INTO cruise_ship_management.ship (id, s_number, capability, is_available)
VALUES ('1546572905333971767', 'B3', 200, true);
INSERT INTO cruise_ship_management.ship (id, s_number, capability, is_available)
VALUES ('1546572905341301680', 'B4', 200, true);
INSERT INTO cruise_ship_management.ship (id, s_number, capability, is_available)
VALUES ('1546572905351567869', 'B5', 200, true);
INSERT INTO cruise_ship_management.ship (id, s_number, capability, is_available)
VALUES ('1546572905362926749', 'B6', 200, true);
INSERT INTO cruise_ship_management.ship (id, s_number, capability, is_available)
VALUES ('1546572905380792404', 'B7', 200, true);
INSERT INTO cruise_ship_management.ship (id, s_number, capability, is_available)
VALUES ('1546572905393501399', 'B8', 200, true);
INSERT INTO cruise_ship_management.ship (id, s_number, capability, is_available)
VALUES ('1546572905406989348', 'S1', 100, true);
INSERT INTO cruise_ship_management.ship (id, s_number, capability, is_available)
VALUES ('1546572905421647193', 'S2', 100, true);
INSERT INTO cruise_ship_management.ship (id, s_number, capability, is_available)
VALUES ('1546572905433729815', 'S3', 100, true);
INSERT INTO cruise_ship_management.ship (id, s_number, capability, is_available)
VALUES ('1546572905442965185', 'S4', 100, true);
INSERT INTO cruise_ship_management.ship (id, s_number, capability, is_available)
VALUES ('1546572905449282580', 'S5', 100, true);
create table user
(
    id       varchar(64)   not null
        primary key,
    username varchar(32)   null,
    password varchar(64)   null,
    role_id  int default 0 not null
)
    comment 'user accounts'' information';

INSERT INTO cruise_ship_management.user (id, username, password, role_id)
VALUES ('1546571852822429797', 'root', '177d67df66d4a77d7631d69d98dd6fbb', 0);