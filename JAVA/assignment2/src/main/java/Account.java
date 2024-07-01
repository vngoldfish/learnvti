import java.util.Date;

public class Account {
    int accountId;
    String email;
    String userName;
    String fullName;
    Department department;
    Position    position;
    Group[] groups;
    Date createDate;

    @Override
    public String toString() {
        return "Account information : ID : " + accountId + " | Email : " + email + " | Username : " + userName + " | FullName: "+ fullName + " | DepartmentName : "+ department.departmentName + " | PositionName : " + position.positionName ;
    }
}
