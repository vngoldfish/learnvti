import java.util.Date;

public class Group {
    int groupId;
    String groupName;
    Account account;
    Date createDate;

    @Override
    public String toString() {
        return "Group Infomation : GroupId : " + groupId + " | Group Name : " + groupName +  " | CreateDate : " + createDate;
    }
}
