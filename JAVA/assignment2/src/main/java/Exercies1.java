import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Exercies1 {
    public static void  main(String[] args) throws ParseException {
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




        // Question 1:
        System.out.println("----- Question 1 ------");
        if (ac2.department == null){
            System.out.println("この従業員には部署が有ません");
        }else{
            System.out.println("部署の授業員には"+ac2.department.departmentName);
        };
        //Question 2 :
        /*
            アカウントを2つ目チェックする
            グループがなければ、"この従業員はグループに所属していません"というテキストを出力する
            1つまたは2つのグループに所属している場合、"この従業員のグループはJava Fresher、C# Fresherです"というテキストを出力する
            3つのグループに所属している場合、"この従業員は重要な人物で、多くのグループに参加しています"というテキストを出力する
            4つ以上のグループに所属している場合、"この従業員は話好きで、すべてのグループに参加しています"というテキストを出力する
         */
        System.out.println( "------ Question 2 --------");
        if (ac2.groups == null){
            System.out.println("この従業員はグルーブに所属していません");
        }else {
            int countGroup = ac2.groups.length;
            if(countGroup == 1 || countGroup == 2){
                System.out.println("この授業員のグルーブはJava Fresher、C# Fresherです");
            }
            if (countGroup == 3) {
                System.out.println("この授業員は重要な人物で多くのグルーブに参加しています");
            }
            if (countGroup >= 4) {
                System.out.println("この従業員は話好きで、すべてのグルーブに参加しています");
            }
        }
        // Question 3 課題1のために三項演算子を使用しました
        System.out.println("----Question 3 ---------");
       String messafe = ac2.department == null ? "この従業員には部署が有ません":"部署の授業員には"+ac2.department.departmentName;
        System.out.println(messafe);
        // Question 4 :課題1のために三項演算子を使用しました
        // 三項演算子を使用して、以下の要求を満たします：
        // アカウント1のPositionをチェックします。
        // PositionがDevであれば、「これは開発者です」というテキストを出力します。
        // そうでなければ、「この人は開発者ではありません」というテキストを出力します。
        System.out.println("-----Question 4 -------");
        String messafe1 = ac1.position.positionName == "Dev" ? "これは開発者です":"この人は開発者ではありません";
        System.out.println(messafe1);


        // SWITCH CASE
        //Question 5
        /*
         グルーブ１のアカウント数を取得し、次のフォーマットで出力する
         アカウント数が１の場合、”グルーブには１人のメンバーがいます”と出力する
         アカウント数が2の場合、"グループには2人のメンバーがいます"と出力する
        アカウント数が3の場合、"グループには3人のメンバーがいます"と出力する
        それ以外の場合、"グループには多くのメンバーがいます"と出力する
        * */
        System.out.println("--------Question 5------");
        if(ga1.accounts == null){
            System.out.println("このグルーブは授業員が有ません");
        }else{
            int coutAccInGroup = ga1.accounts.length;
            switch (coutAccInGroup){
                case  1:
                    System.out.println("グループには1人のメンバーがいます");
                    break;
                case 2:
                    System.out.println("グループには2人のメンバーがいます");
                    break;
                case 3:
                    System.out.println("グループには3人のメンバーがいます");
                    break;
                default:
                    System.out.println("グループには多くのメンバーがいます");
            }
        }
        //Question 6
        //Question 2をswitch caseを使ってやり直してください
        System.out.println("-----Question 6 -----");
        if (ac2.groups == null){
            System.out.println("この従業員はグルーブに所属していません");
        }else {
            int countGroup = ac2.groups.length;
            switch (countGroup) {
                case 1:
                    System.out.println("この授業員のグルーブはJava Fresher、C# Fresherです");
                    break;
                case 2:
                    System.out.println("この授業員のグルーブはJava Fresher、C# Fresherです");
                    break;
                case 3:
                    System.out.println("この授業員は重要な人物で多くのグルーブに参加しています");
                    break;
                default:
                    System.out.println("この従業員は話好きで、すべてのグルーブに参加しています");
                    break;
            }
        }
        // Question 7 :
        //Question 4をswitch caseを使ってやり直してください
        System.out.println("-----　SWITCH  Question 7 -----");
        String positionName = ac1.position.positionName.toString();
        switch (positionName){
            case "Dev":
                System.out.println("この人は開発者です");
                break;
            default:
                System.out.println("この人は開発者ではありません");
                break;
        }

        // FOREACH

        //Question 8 :
        // アカウントの情報を出力します。含まれる情報は、メールアドレス、フルネーム、及び所属部署名です
        System.out.println("------FOREACH   Question 8------");
        Account[] accounts = {ac1,ac2};
        for (Account account:accounts){
            System.out.println("AccountID : " + account.accountId + "- Email : " + account.email + "- Name : " + account.fullName);
        }
        // Question 9 :
        // 部門の情報を出力します。含まれる情報はID と名前です
        System.out.println("---- FOREACH    Question 9 ------");
        Department[] departments = {dept1,dept2,dept3};
        for (Department department:departments){
            System.out.println("DepartmentName :" + department.departmentId + "  --- DepartmentName :" +department.departmentName);
        }


        // FOR
        // Quesion 10
        /*
        アカウントの情報を出力する。含まれる情報はEMAIL ,FullName,DepartmentNameです
            １目アカウントの情報は：
             メールアドレス　：demo@gmail.com
             フルネーム　：中山
             部署名　：DEV
        * */
        System.out.println("---- FOR Question 10 : アカウントの情報を出力 -----");
        Account[] accArray1 = {ac1,ac2};
        for (int i = 0 ; i < accArray1.length ; i++){
            System.out.println(i+1 +"目アカウントの情報は :" );
            System.out.println("メルーアドレス：" +accArray1[i].email );
            System.out.println("フルネーム："+ accArray1[i].userName);
            System.out.println("部署名：" + accArray1[i].department.departmentName);
            System.out.println("----------");
        }
        System.out.println("------ 完了　------");
        // Question 11
        // 部署情報を出力する、含まれる情報は　：
        // １目部署情報は：
        //　ID ：　１
        //  Name : sale
        System.out.println("----- FOR Question 11 : 部署情報を出力");
        Department[] depArray = {dept1,dept2,dept3};
        for (int i = 0 ; i < depArray.length ; i++){
            System.out.println(i+1+"目部署情報は：");
            System.out.println("ID: "+ depArray[i].departmentId);
            System.out.println("Name : " + depArray[i].departmentName);
        }
        // Question 12 : 最初の二つの部署の情報のみをquestion 10 のフォーマットで出力します
        System.out.println("---- FOR Question 12 : ");
        Account[] accArray2 = {ac1,ac2};
        for (int i = 0 ; i < 2 ; i++){
            System.out.println(i+1 +"目アカウントの情報は :" );
            System.out.println("メルーアドレス：" +accArray1[i].email );
            System.out.println("フルネーム："+ accArray1[i].userName);
            System.out.println("部署名：" + accArray1[i].department.departmentName);
            System.out.println("----------");
        }
        // Question 13 : ２番目のアカウントを除くすべてのアカウント情報を出力する
        System.out.println("Question 13 : ２番目のアカウントを除くすべてのアカウント情報を出力する");
        Account[] accArray3 = {ac1,ac2};
        for (int i = 0; i < accArray3.length; i++){
            if(i!= 1){
                System.out.println(i+1 +"目アカウントの情報は :" );
                System.out.println("メルーアドレス：" +accArray1[i].email );
                System.out.println("フルネーム："+ accArray1[i].userName);
                System.out.println("部署名：" + accArray1[i].department.departmentName);
                System.out.println("----------");
            }
        }
        // Question 14 : IDが１未満のすべてのアカウント情報を出力する
        System.out.println("--- Question 14 : IDが１未満のすべてのアカウント情報を出力する");
        Account[] accArray4 = {ac1,ac2};
        for(int i = 0 ; i < accArray4.length; i++){
            if (accArray4[i].accountId < 4){
                System.out.println(i+1 +"目アカウントの情報は :" );
                System.out.println("メルーアドレス：" +accArray1[i].email );
                System.out.println("フルネーム："+ accArray1[i].userName);
                System.out.println("部署名：" + accArray1[i].department.departmentName);
                System.out.println("----------");
            }
        }
        // Question 15 : "20以下の偶数を出力する"
        System.out.println("--- Question 15  : 20以下の偶数を出力");
        for(int i= 1 ; i<= 20 ; i++){
            if (i%2==0){
                System.out.println(i +" ");
            }
        }
        // WHILE
        //Question 16: FOR の部分の質問をWHILEを使って、break ,continue命令を組み合わせてやり直しください
        // Quesion 16ー10
        /*
        アカウントの情報を出力する。含まれる情報はEMAIL ,FullName,DepartmentNameです
            １目アカウントの情報は：
             メールアドレス　：demo@gmail.com
             フルネーム　：中山
             部署名　：DEV
        * */
        System.out.println("---- Question 16 - 10     ----");
        Account[] accArray16 = {ac1,ac2};
        int i = 0;
        while (i < accArray16.length){
            System.out.println(i+1 +"目アカウントの情報は :" );
            System.out.println("メルーアドレス：" +accArray1[i].email );
            System.out.println("フルネーム："+ accArray1[i].userName);
            System.out.println("部署名：" + accArray1[i].department.departmentName);
            System.out.println("----------");
            i++;
        }
        // Question 16-11
        // 部署情報を出力する、含まれる情報は　：
        // １目部署情報は：
        //　ID ：　１
        //  Name : sale
        System.out.println("----- WHILE Question 16-11 : 部署情報を出力");
        Department[] depArray1611 = {dept1,dept2,dept3};
        int j = 0;
        while (j < depArray1611.length){
            System.out.println(j+1+"目部署情報は：");
            System.out.println("ID: "+ depArray[j].departmentId);
            System.out.println("Name : " + depArray[j].departmentName);
            j++;
        }
        // Question 16-12 : 最初の二つの部署の情報のみをquestion 10 のフォーマットで出力します
        System.out.println("---- WHILE Question 16- 12 : ");
        Account[] accArray1612 = {ac1,ac2};
        int e = 0;
        while (e < 2){
            System.out.println(e+1 +"目アカウントの情報は :" );
            System.out.println("メルーアドレス：" +accArray1[e].email );
            System.out.println("フルネーム："+ accArray1[e].userName);
            System.out.println("部署名：" + accArray1[e].department.departmentName);
            System.out.println("----------");
            e++;
        }
        // Question 16-13 : ２番目のアカウントを除くすべてのアカウント情報を出力する
        System.out.println("Question 16-13 : ２番目のアカウントを除くすべてのアカウント情報を出力する");
        Account[] accArray1613 = {ac1,ac2};
        int f = 0;
        while (f < accArray1613.length){
            System.out.println(f+1 +"目アカウントの情報は :" );
            System.out.println("メルーアドレス：" +accArray1[f].email );
            System.out.println("フルネーム："+ accArray1[f].userName);
            System.out.println("部署名：" + accArray1[f].department.departmentName);
            System.out.println("----------");
            f++;
        }
    // DO-WHILE
        // Question 17:
         /*
        アカウントの情報を出力する。含まれる情報はEMAIL ,FullName,DepartmentNameです
            １目アカウントの情報は：
             メールアドレス　：demo@gmail.com
             フルネーム　：中山
             部署名　：DEV
        * */
        System.out.println("---- Question 17     ----");
        Account[] accArray17 = {ac1,ac2};
        int a = 0;
        do{
            System.out.println(a+1 +"目アカウントの情報は :" );
            System.out.println("メルーアドレス：" +accArray1[a].email );
            System.out.println("フルネーム："+ accArray1[a].userName);
            System.out.println("部署名：" + accArray1[a].department.departmentName);
            System.out.println("----------");
            a++;
        } while(a < accArray17.length );

    }
}
