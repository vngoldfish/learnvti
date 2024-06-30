import java.time.LocalDate;
import java.util.Scanner;

public class Exercise5 {
    public static void main(String[] args) {
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
//        /question6();
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
}
