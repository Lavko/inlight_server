package com.msz.inhouse.inserver.util;

import com.msz.inhouse.inlight.container.Group;

public class GroupMapper {

    public static Group getGroup(int groupNo) {
        switch(groupNo) {
            case 1: return Group.FIRST;
            case 2: return Group.SECOND;
            case 3: return Group.THIRD;
            case 4: return Group.FOURTH;
            default: return Group.ALL;
        }
    }

    public static Group getGroup(String groupNo) {
        switch(groupNo) {
            case "1": return Group.FIRST;
            case "2": return Group.SECOND;
            case "3": return Group.THIRD;
            case "4": return Group.FOURTH;
            default: return Group.ALL;
        }
    }
}
