import java.util.Calendar;
import java.util.Date;

public class Account {
    int id;
    String userName;
    String fullName;
    String email;
    Date createDate;

    @Override
    public String toString() {
        return "Account Infomartion : ID : " + id + " | Email :" + email+ " | UserName : " + userName + " | FullName : " + fullName + " | createDate : " + createDate;
    }
}
