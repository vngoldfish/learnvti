import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Scanner;

public class Exercise5 {
    public static void main(String[] args) throws ParseException {
        //Scanner
        Scanner scanner = new Scanner(System.in);

        //Question 1 : ユーザーがプログラムに３つの整数を入力できるようにする命令を書く
        /*
        System.out.println("Question 1 : ユーザーがプログラムに３つの整数を入力できるようにする命令を書く");
        System.out.println("一番目の整数を入力する");
        int fistNumber = scanner.nextInt();
        System.out.println("二番目の整数を入力する");
        int secondNumber = scanner.nextInt();
        System.out.println("三番目の整数を入力する");
        int thirdNumber = scanner.nextInt();
        scanner.close();
        System.out.println("1番目の整数："+fistNumber);
        System.out.println("2番目の整数："+secondNumber);
        System.out.println("3番目の整数："+thirdNumber);
         */
        // Question 2: ユーザーがプログラムに２つの実数を入力できるようにする命令書く
        /*
        System.out.println("Question 2: ユーザーがプログラムに２つの実数を入力できるようにする命令書く");
        System.out.println("二つの実数を入力してください");
        System.out.println("1番目の実数を入力してください");
        float f1 = scanner.nextFloat();
        System.out.println("2番目の実数を入力してください");
        float f2 = scanner.nextFloat();
        System.out.println("二つの実数を入力したは："+f1+ "và"+f2);
         */
        // Question 3 : ユーザーが名前を入力できるように命令を書く
        /*
        System.out.println("Question 3 : ユーザーが名前を入力できるように命令を書く");
        System.out.println("性を入力して：");
        String s1 = scanner.nextLine();
        System.out.println("名を入力して：");
        String s2 = scanner.nextLine();
        System.out.println("入力した名前は："+ s1+s2);

         */
        //Question 4: ユーザーが誕生日を入力できるように命令を書く
        /*
        System.out.println("Question 4: ユーザーが誕生日を入力できるように命令を書く");
        System.out.println("年を入力して下さい：");
        int year = scanner.nextInt();
        System.out.println("月を入力して下さい：");
        int month = scanner.nextInt();
        System.out.println("日を入力して下さい：");
        int day = scanner.nextInt();
        LocalDate databirth = LocalDate.of(year,month,day);
        System.out.println("あなたの誕生日は"+databirth);

         */

        //question5();
        //question6();
        //question7();
        //question8();
        question9();

    }
    private  static  void question5(){
        //Question 5 : ユーザーがアカウントを作成できるようにする命令を書く（メソッドとして記述）。プロパティPositionについては、ユーザーが1、2、3、4を入力し、それをプログラム内でPosition.Dev、Position.Test、Position.ScrumMaster、Position.PMに変換します。
        Scanner scanner = new Scanner(System.in);
        System.out.println("Question 5 : ユーザーがアカウントを作成できるようにする命令を書く（メソッドとして記述）。プロパティPositionについては、ユーザーが1、2、3、4を入力し、それをプログラム内でPosition.Dev、Position.Test、Position.ScrumMaster、Position.PMに変換します。");
        Account ac1 = new Account();
        System.out.println("ユーザーの情報を入力してください：");
        System.out.println("IDを入力してください：");
        ac1.accountId = scanner.nextInt();
        scanner.nextLine();
        System.out.println("USERNAMEを入力してください：");
        ac1.userName = scanner.nextLine();
        System.out.println("FullNameを入力してください");
        ac1.fullName = scanner.nextLine();
        System.out.println("ポジションを入力してください（1から4までの数字を入力してください：1.Dev、2.Test、3.Scrum_Master、4.PM");
        int posNum = scanner.nextInt();
        Position p1 = new Position();
        switch (posNum){
            case 1:
                p1.positionName = "Dev";
                break;
            case 3 :
                p1.positionName = "Scrum_Master";
                break;
            case 4 :
                p1.positionName = "PM";
                break;
            default:
                System.out.println("不正な入力です");
                return;
        }
        ac1.position  =p1;
        System.out.println("ユーザーの情報を入力した：ID:" + ac1.accountId + "UserName : " + ac1.userName + "FullName : "+ ac1.fullName + "Position  : " + ac1.position.positionName);

    }
    private static void question6(){
        //Question 6 : ユーザーが部門を作成できるようにする命令を書く（メソッドとして記述
        Scanner scanner = new Scanner(System.in);
        System.out.println("Question 6 : ユーザーが部門を作成できるようにする命令を書く（メソッドとして記述");
        System.out.println("部署の情報を入力する：");
        Department de1 = new Department();
        System.out.println("ID を入力する");
        de1.departmentId = scanner.nextInt();
        scanner.nextLine();
        System.out.println("Department Name: ");
        de1.departmentName = scanner.nextLine();
        System.out.println("入力した部署情報：ID ："+ de1.departmentId + " DepartmentName : "+de1.departmentName);
    }
    private static void question7(){
        //Question 7  :コンソールから偶数を入力してください
        Scanner scanner = new Scanner(System.in);
        while (true){
            System.out.println("偶数を入力てください");
            int a = scanner.nextInt();
            if(a % 2 == 0){
                System.out.println("偶数を入力した番号：" + a);
                return;
            }else {
                System.out.println("入力が間違っています。これは偶数ではありません");
            }

        }
    }
    private static void question8(){
        //Question 8 : 以下のフローに従ってプログラムを作成します：
        //ステップ1：
        //プログラムは「使用したい機能を入力してください」というテキストを出力します。
        //ステップ2：
        //ユーザーが1を入力した場合、アカウント作成機能を実行します。
        //ユーザーが2を入力した場合、部門作成機能を実行します。
        //ユーザーがそれ以外の数字を入力した場合、「もう一度入力してください」というテキストを出力し、ステップ1に戻ります。
        Scanner scanner = new Scanner(System.in);
        int choose;
        while (true){
            System.out.println("機能を選択してください：１：アカウント作成　２：部署作成");
            choose = scanner.nextInt();
            if(choose ==1 || choose == 2){
                switch (choose){
                    case 1 :
                        question5();
                        break;
                    case 2:
                        question6();
                        break;
                }
                return;
            }else{
                System.out.println("再入力してください");
            }
        }
    }
    private static void question9() throws ParseException {
        //Question 9: 以下のフローに従って、ユーザーがアカウントにグループを追加できるメソッドを書いてください：
        //
        //ステップ1：
        //ユーザーに確認してもらうために、すべてのユーザーのユーザー名を出力します。
        //ステップ2：
        //アカウントのユーザー名を入力するようにユーザーに促します。
        //ステップ3：
        //ユーザーに確認してもらうために、すべてのグループ名を出力します。
        //ステップ4：
        //グループ名を入力するようにユーザーに促します。
        //ステップ5：
        //ユーザーが選択したユーザー名とグループ名に基づいて、アカウントをそのグループに追加します
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
        Account[] accounts = {ac1,ac2};
        Group[] groups = {gr1,gr1};


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
        Scanner scanner = new Scanner(System.in);
        System.out.println("システム上に存在するユーザーのリスト");
        for (Account account : accounts){
            System.out.println(account);
        }
        System.out.println("アカウントのユーザー名を入力してください");
        String userName = scanner.nextLine();
        System.out.println("システム上に存在するグループのリスト");
        for(Group group : groups){
            System.out.println(group);
        }
        System.out.println("グルーブ名を入力してください");
        String groupName = scanner.nextLine();
        int indexAccount = -1;
        for (int i = 0 ; i < accounts.length ; i++){
            if(accounts[i].userName.equals(userName)){
                indexAccount = i;
            };

        }
        int indexGroup = -1;
        for (int i = 0 ; i < groups.length ; i++){
            if(groups[i].groupName.equals(groupName)){
                indexGroup = i;
            }
        }
        if(indexAccount < 0 || indexGroup < 0 ){
            System.out.println("入力した情報を確認してください。システムにアカウントまたはグループの情報がありません");
        }else{
            for (int i = 0 ; i < accounts.length ; i ++){
                if(accounts[i].userName.equals(userName)){
                    Group[] groups3 = {groups[indexGroup]};
                    accounts[i].groups = groups3;

                }
            }
        }






    }


}
