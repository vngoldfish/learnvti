import java.util.Calendar;
import java.util.Date;

public class Exercise2 {
    public static void main(String[] args) {
        question1();
    }
    private static  void  question1(){
        //Question1 : 前の課題で挿入したデータを使用せずに、Accountの配列を作成し、次の構文で5つの要素を初期化します（forループを使用して初期化）：
        //
        //Email: "Email 1"
        //Username: "User name 1"
        //FullName: "Full name 1"
        //CreateDate: now
        Account[] accounts = new Account[5];
        for (int i = 0 ; i < 5 ; i++){
            Account account = new Account();
            account.id = i;
            account.userName= "User Name " + 1;
            account.fullName = "Full Name " + 1;
            account.email = "Email" +1;
            account.createDate = new Date(System.currentTimeMillis());

            accounts[i] = account;
        }
        for (Account account: accounts){
            System.out.println(account);
        }
    }

}
