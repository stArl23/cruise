package com.huidi.cruise.utils;

import java.sql.Time;

public class TimeUtils {
    /**
     * Time calculation
     * @param sign + - like this
     * @param time1 first time will be operated
     * @param time2 second time will be operated
     * @return time result
     */
    //bug2 ignore case like 7:20-6:50
    public static Time timeOperation(String sign, Time time1, Time time2) {
        Time result;
        switch (sign) {
            case "+":
                result = secondToTime(timeToSecond(time1) + timeToSecond(time2));
                break;
            case "-":
                result = secondToTime(timeToSecond(time1) - timeToSecond(time2));
                break;
            default:
                result = new Time(0);
        }
        return result;
    }

    /**
     * Convert int second to Time type
     * format hour:minute:second
     *
     * @param second second will be transformed
     * @return time result
     */
    public static Time secondToTime(int second) {
        int hour = second / 3600;
        second %= 3600;
        int minute = second / 60;
        second = second % 60;
        return Time.valueOf(hour + ":" + minute + ":" + second);
    }

    /**
     * convert time to second
     * format hour:minute:second
     *
     * @param time
     * @return
     */
    public static int timeToSecond(Time time) {
        String[] times = time.toString().split(":");
        return Integer.valueOf(times[0]) * 3600 + Integer.valueOf(times[1]) * 60 + Integer.valueOf(times[2]);
    }


    /**
     * check the time given is in time interval
     *
     * @param earlyTimeBoundary early time boundary
     * @param lateTimeBoundary late time boundary
     * @param now now time
     * @return in duration  or not
     */
    public static Boolean checkTimeBoundary(Time earlyTimeBoundary, Time lateTimeBoundary, Time now) {
        return now.after(earlyTimeBoundary) && now.before(lateTimeBoundary);
    }

    /**
     * deal with bug ,11:00 in last loop and 11:00 in first of this loop
     * @param bound
     * @param delayTime1
     * @return
     */
    public static Boolean equalOrAfter(Time bound, Time delayTime1) {
        return delayTime1.after(bound) || delayTime1.equals(bound);
    }
}
