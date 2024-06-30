import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

public class Exercies3 {
    public static void main(String[] args) throws ParseException {
        // MAIN
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



        // Khởi tạo các đối tượng của bảng GroupAccount
        // グループアカウントのオブジェクトを初期化する
        GroupAccount ga1 = new GroupAccount();
        ga1.group = gr1;
        ga1.accounts = new Account[] {ac2,ac1};
        ga1.joinDate = dateFormat.parse("2024-01-20");

        GroupAccount ga2 = new GroupAccount();
        ga2.group = gr2;
        ga2.accounts = new Account[] {ac1};
        ga2.joinDate = dateFormat.parse("2024-02-20");
        GroupAccount ga3 = new GroupAccount();
        ga1.group = gr1;
        ga1.joinDate = dateFormat.parse("2024-01-20");


        // Khởi tạo các đối tượng bảng exam
        //examテーブルのオブジェクトを初期化する
        Exam ex1 = new Exam();
        ex1.examId = 1;
        ex1.title ="title exam 1";
        ex1.code ="adajdaklsdjaklsdjlajsdaklsjdklajsdklajsdklajsd";
        ex1.createDate = dateFormat.parse("2024-02-20");
        // Question 1 : 最初のExamの情報を出力し、create dateプロパティをベトナム形式でフォーマットします
        System.out.println("Question 1 : 最初のexamの情報を出力し、create date プロバティをベトナム形式でフォーマットします" );
        Locale locale = new Locale("vi","VN");
        DateFormat dateFormat1 = DateFormat.getDateInstance(DateFormat.DEFAULT,locale);
        String date = dateFormat1.format(ex1.createDate);
        System.out.println(ex1.code + ":" + date );

        //Question 2 : Examの作成日時情報を次のフォーマットで出力します: 年 – 月 – 日 – 時 – 分 – 秒
        System.out.println("Question 2 : Examの作成日時情報を次のフォーマットで出力します: 年 – 月 – 日 – 時 – 分 – 秒");
        String pattern = "yyyy-MM-DD-HH-mm-ss";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        System.out.println(simpleDateFormat.format(ex1.createDate));
        // Question 3 : Question 2でcreate dateプロパティの年だけを出力します
        System.out.println("Question 3 : Question 2でcreate dateプロパティの年だけを出力します");
        String pattern1 = "YYYY";
        simpleDateFormat = new SimpleDateFormat(pattern1);
        System.out.println(simpleDateFormat.format(ex1.createDate));
        // Question 4 : Question 2でcreate dateプロパティの月と年だけを出力します
        System.out.println("Question 4 : Question 2でcreate dateプロパティの月と年だけを出力します");
        String pattern2 = "YYYY-MM";
        simpleDateFormat = new SimpleDateFormat(pattern2);
        System.out.println(simpleDateFormat.format(ex1.createDate));
        //Question 5 : Question 2でcreate dateの "MM-DD" だけを出力します
        System.out.println("Question 5 : Question 2でcreate dateの MM-DD だけを出力します");
        String pattern3 = "MM-dd";
        simpleDateFormat = new SimpleDateFormat(pattern3);
        System.out.println(simpleDateFormat.format(ex1.createDate));
    }
}
