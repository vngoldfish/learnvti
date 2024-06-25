import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
public class Program {
    public static void main(String[] args) throws ParseException {
        // Định dạng ngày tháng
        // 日付フォーマット
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        // Khởi tạo các đối tượng của bảng Department
        // 部署のオブジェクトを初期化する
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

        // Khởi tạo các đối tượng của bảng Account
        // アカウントのオブジェクトを初期化する
        Account ac1 = new Account();
        ac1.accountId = 1;
        ac1.email = "email1@example.com";
        ac1.userName = "username1";
        ac1.fullName = "Full Name 1";
        ac1.department = dept1;
        ac1.position = pos1;
        //ac1.createDate = dateFormat.parse("2024-02-01");
        ac1.createDate = dateFormat.parse("2024-02-01") ;

        Account ac2 = new Account();
        ac2.accountId = 2;
        ac2.email = "email2@example.com";
        ac2.userName = "username2";
        ac2.fullName = "Full Name 2";
        ac2.department = dept2;
        ac2.position = pos2;
        ac2.createDate = dateFormat.parse("2024-02-01");

        Account ac3 = new Account();
        ac3.accountId = 3;
        ac3.email = "email3@example.com";
        ac3.userName = "username3";
        ac3.fullName = "Full Name 3";
        ac3.department = dept3;
        ac3.position = pos3;
        ac3.createDate = dateFormat.parse("2024-03-01");

        // Khởi tạo các đối tượng của bảng Group
        // グループのオブジェクトを初期化する
        Group gr1 = new Group();
        gr1.groupId = 1;
        gr1.groupName = "Group 1";
        gr1.account = ac1;
        gr1.createDate = dateFormat.parse("2024-01-15");

        Group gr2 = new Group();
        gr2.groupId = 2;
        gr2.groupName = "Group 2";
        gr2.account = ac2;
        gr2.createDate = dateFormat.parse("2024-02-15");

        Group gr3 = new Group();
        gr3.groupId = 3;
        gr3.groupName = "Group 3";
        gr3.account = ac3;
        gr3.createDate = dateFormat.parse("2024-03-15");

        // Khởi tạo các đối tượng của bảng GroupAccount
        // グループアカウントのオブジェクトを初期化する
        GroupAccount ga1 = new GroupAccount();
        ga1.group = gr1;
        ga1.account = ac1;
        ga1.joinDate = dateFormat.parse("2024-01-20");

        GroupAccount ga2 = new GroupAccount();
        ga2.group = gr2;
        ga2.account = ac2;
        ga2.joinDate = dateFormat.parse("2024-02-20");

        GroupAccount ga3 = new GroupAccount();
        ga3.group = gr3;
        ga3.account = ac3;
        ga3.joinDate = dateFormat.parse("2024-03-20");

        // Khởi tạo các đối tượng của bảng TypeQuestion
        // 質問タイプのオブジェクトを初期化する
        TypeQuestion tq1 = new TypeQuestion();
        tq1.typeId= 1;
        tq1.typeName = "Essay";

        TypeQuestion tq2 = new TypeQuestion();
        tq2.typeId = 2;
        tq2.typeName = "Multiple-Choice";

        // Khởi tạo các đối tượng của bảng CategoryQuestion
        // 質問カテゴリーのオブジェクトを初期化する
        CategoryQuestion cq1 = new CategoryQuestion();
        cq1.categoryId = 1;
        cq1.categoryName = "Java";

        CategoryQuestion cq2 = new CategoryQuestion();
        cq2.categoryId = 2;
        cq2.categoryName = ".NET";

        CategoryQuestion cq3 = new CategoryQuestion();
        cq3.categoryId = 3;
        cq3.categoryName = "SQL";

        // Khởi tạo các đối tượng của bảng Question
        // 質問のオブジェクトを初期化する
        Question q1 = new Question();
        q1.questionId = 1;
        q1.content = "What is Java?";
        q1.categoryQuestion = cq1;
        q1.typeQuestion = tq1;
        q1.account = ac1;
        q1.createDate = dateFormat.parse("2024-01-10");

        Question q2 = new Question();
        q2.questionId = 2;
        q2.content = "Explain .NET framework.";
        q2.categoryQuestion = cq2;
        q2.typeQuestion = tq2;
        q2.account = ac2;
        q2.createDate = dateFormat.parse("2024-02-10");

        Question q3 = new Question();
        q3.questionId = 3;
        q3.content = "What is SQL?";
        q3.categoryQuestion = cq3;
        q3.typeQuestion = tq1;
        q3.account = ac3;
        q3.createDate = dateFormat.parse("2024-03-10");

        // Khởi tạo các đối tượng của bảng Answer
        // 回答のオブジェクトを初期化する
        Answer ans1 = new Answer();
        ans1.answerId = 1;
        ans1.content = "Java is a programming language.";
        ans1.question = q1;
        ans1.isCorrect = ISCORRECT.TRUE;

        Answer ans2 = new Answer();
        ans2.answerId = 2;
        ans2.content = ".NET is a software framework.";
        ans2.question = q2;
        ans2.isCorrect = ISCORRECT.TRUE;

        Answer ans3 = new Answer();
        ans3.answerId = 3;
        ans3.content = "SQL is a database language.";
        ans3.question = q3;
        ans3.isCorrect = ISCORRECT.FALL;

        // Khởi tạo các đối tượng của bảng Exam
        // 試験のオブジェクトを初期化する
        Exam ex1 = new Exam();
        ex1.examId = 1;
        ex1.code = "EX001";
        ex1.title = "Java Basics";
        ex1.categoryQuestion = cq1;
        ex1.duration = 60;
        ex1.account = ac1;
        ex1.createDate = dateFormat.parse("2024-01-20");

        Exam ex2 = new Exam();
        ex2.examId = 2;
        ex2.code = "EX002";
        ex2.title = ".NET Basics";
        ex2.categoryQuestion = cq2;
        ex2.duration = 60;
        ex2.account = ac2;
        ex2.createDate = dateFormat.parse("2024-02-20");

        Exam ex3 = new Exam();
        ex3.examId = 3;
        ex3.code = "EX003";
        ex3.title = "SQL Basics";
        ex3.categoryQuestion = cq3;
        ex3.duration = 60;
        ex3.account = ac3;
        ex3.createDate = dateFormat.parse("2024-03-20");

        // Khởi tạo các đối tượng của bảng ExamQuestion
        // 試験質問のオブジェクトを初期化する
        ExamQuestion eq1 = new ExamQuestion();
        eq1.examId = ex1;
        eq1.question = q1;

        ExamQuestion eq2 = new ExamQuestion();
        eq2.examId = ex2;
        eq2.question = q2;

        ExamQuestion eq3 = new ExamQuestion();
        eq3.examId = ex3;
        eq3.question = q3;

        // Các đối tượng đã được khởi tạo
        // オブジェクトが初期化されました
        System.out.println(ac1.email);
        System.out.println(ans1.content);
        System.out.println(cq1.categoryName);
        System.out.println(dept1.departmentName);
        System.out.println(ex1.duration);
        System.out.println(eq1.question);
        System.out.println(gr1.groupName);


    }
}
