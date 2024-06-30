import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class Exercise2 {

    public static void main(String[] args) {
        // Question 1 : 整数を一つ宣言して５にし、、System.out.printf命令を使ってその整数を出力します
        System.out.println("Question 1 : 整数を一つ宣言して５にし、、System.out.printf命令を使ってその整数を出力します");
        int i = 5;
        System.out.printf("%d%n",i);
        // Question 2 : 整数を1つ宣言して100,000,000にし、System.out.printf命令を使ってその整数を次のようなフォーマットで出力します: 100,000,000
        System.out.println("Question 2 : 整数を1つ宣言して100000000にし、System.out.printf命令を使ってその整数を次のようなフォーマットで出力します: 100,000,000");
        i = 100000000;
        System.out.printf(Locale.US,"%,d%n",i);
        // Question 3 : 実数を1つ宣言して5.567098にし、System.out.printf命令を使ってその実数を小数点以下4桁まで出力します
        float c = 5.5670098f;
        System.out.printf("%5.4f%n",c);
        // Question 4 : 一人の学生の氏名を宣言、その氏名を次のフォーマットで出力します
        //氏名が "Nguyễn Văn A" であれば、コンソールには次のように出力されます:
        //私の名前は "Nguyễn Văn A" で、私は独身です。」　
        System.out.println("------Question 4-------");
        String s = "Nguyen Van A";
        System.out.printf("Ten toi la \""+s+"\" va toi dang doc than");
        // Question 5 : 現在の時間を取得し、次のフォーマットで出力します：１１h１６p:２０s
        System.out.println("----Question 5 : 現在の時間を取得し、次のフォーマットで出力します：１１h１６p:２０s ----");
        String pattern = "dd/MM/yyyy HH:mm:ss";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        String date = simpleDateFormat.format(new Date());
        System.out.println(date);



    }
}
