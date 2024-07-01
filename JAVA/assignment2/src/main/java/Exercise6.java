import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Exercise6 {
    public static void main(String[] args) throws ParseException {
        question1();
        question2();
        question3();
    }
    private  static  void  question1(){
        //10未満の正の偶数を出力するメソッドを作成する
        for(int i = 0 ; i < 10 ; i++){
            if(i % 2 == 0){
                System.out.println(i + " ");

            }
        }

    }
    private  static  void question2() throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Department dept1 = new Department();
        dept1.departmentId = 1;
        dept1.departmentName = "Sales";

        Department dept2 = new Department();
        dept2.departmentId = 2;
        dept2.departmentName = "Marketing";

        Department dept3 = new Department();
        dept3.departmentId = 3;
        dept3.departmentName = "IT";

        // Khởi tạo các đối tượng của bảng Position
        // 役職のオブジェクトを初期化する
        Position pos1 = new Position();
        pos1.positionId = 1;
        pos1.positionName = "Dev";

        Position pos2 = new Position();
        pos2.positionId = 2;
        pos2.positionName = "Test";

        Position pos3 = new Position();
        pos3.positionId = 3;
        pos3.positionName = "Scrum Master";
        // Khởi tạo các đối tượng của bảng Group
        // グループのオブジェクトを初期化する
        Group gr1 = new Group();
        gr1.groupId = 1;
        gr1.groupName = "Group 1";
        gr1.createDate = dateFormat.parse("2024-01-15");

        Group gr2 = new Group();
        gr2.groupId = 2;
        gr2.groupName = "Group 2";
        gr2.createDate = dateFormat.parse("2024-02-15");
        // Khởi tạo các đối tượng của bảng Account
        // アカウントのオブジェクトを初期化する
        Account ac1 = new Account();
        ac1.accountId = 1;
        ac1.email = "email1@example.com";
        ac1.userName = "username1";
        ac1.fullName = "Full Name 1";
        ac1.department = dept1;
        ac1.position = pos1;
        Group[] groups1 = {gr1,gr2};
        ac1.groups = groups1;
        try{
            ac1.createDate = dateFormat.parse("2024-02-01");
        }catch (ParseException e){
            e.printStackTrace();
        }

        Account ac2 = new Account();
        ac2.accountId = 2;
        ac2.email = "email2@example.com";
        ac2.userName = "username2";
        ac2.fullName = "Full Name 2";
        ac2.department = dept2;
        ac2.position = pos2;
        Group[] groups2 = {gr1};
        ac2.groups = groups2;

        //ac2.createDate = new Date("2024-02-01");
        try{
            ac2.createDate = dateFormat.parse("2024-02-01");
        }catch (ParseException e){
            e.printStackTrace();
        }
        printaccount(ac1);
        printaccount(ac2);


    }
    private static void printaccount (Account account){
        System.out.println(account);
    }

    private static void question3(){
        for (int i = 0 ; i< 10 ; i++){
            System.out.println(i + " ");
        }
    }
}
