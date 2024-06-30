import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Locale;
import java.util.Random;

public class Exercise4 {
    public static void main(String[] args) {
        // RANDOM NUMBER
        //Question 1 : ランダムな整数を出力する
        System.out.println("Question 1 : ランダムな整数を出力する");
        Random random = new Random();
        int n = random.nextInt(9);
        System.out.println("ランダムな整数　："+ n);
        // Question 2 :ランダムな実数を出力する
        System.out.println("  Question 2 :ランダムな実数を出力する");
        float f = random.nextFloat();
        System.out.println("ランダムな室数："+f);
        // Question 3 : クラスメートの名前を含む配列を宣言し、その中からランダムに一人の名前を出力します
        System.out.println("---- Question 3 : クラスメートの名前を含む配列を宣言し、その中からランダムに一人の名前を出力します");
        String[] classmate = {"Lan","Hoa","Tuan","Diep","Ha","Huong"};
        int randomInt = random.nextInt(classmate.length);
        System.out.println("クラスの中のランダムな一人の名前　："+ classmate[randomInt]);
        // Question 4 : 1995年7月24日から1995年12月20日の間のランダムな日を取得する
        // 方法１：
        System.out.println("Question 4 : （方法１）1995年7月24日から1995年12月20日の間のランダムな日を取得する");
       int minDay = (int) LocalDate.of(1995,07,24).toEpochDay();
       int maxDay = (int) LocalDate.of(1995,12,20).toEpochDay();
        System.out.println("minDay : " + minDay);
        System.out.println("maxDay : " + maxDay);
        long randomInt1 = minDay + random.nextInt(maxDay - minDay+1);
        LocalDate randomDay = LocalDate.ofEpochDay(randomInt1);
        System.out.println(randomDay);
        System.out.println("Question 4 ： （方法２）　1995年7月24日から1995年12月20日の間のランダムな日を取得する");
        Calendar maxDay1 = Calendar.getInstance();
        maxDay1.set(1995,Calendar.DECEMBER,24);
        Calendar minDay1 = Calendar.getInstance();
        minDay1.set(1995,Calendar.JULY,20);
        long startMillis = minDay1.getTimeInMillis();
        long endMillis = maxDay1.getTimeInMillis();
        Random random1 = new Random();
        long randomMillisDay = startMillis + (long) (random1.nextDouble() * (endMillis - startMillis));
        Calendar randomDay1 = Calendar.getInstance();
        randomDay1.setTimeInMillis(randomMillisDay);
        //System.out.println("ランダムな日："+randomDay1.getTime());
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        String formatteDate = dateFormat.format(randomDay1.getTime());
        System.out.println("ランダムな日："+formatteDate);
        // Question 5 : 過去一年間の間でランダムに1日を取得する
        System.out.println("方法１ Question 5 : 過去一年間の間でランダムに1日を取得する");
        Calendar now = Calendar.getInstance();
        Calendar oneYearAgo = Calendar.getInstance();
        oneYearAgo.add(Calendar.YEAR,-1);
        long nowMillis = now.getTimeInMillis();
        long oneYeartAgoMillis = oneYearAgo.getTimeInMillis();
        Random randomDay2 = new Random();
        long randomMillisDay1 = oneYeartAgoMillis + (long) (randomDay2.nextDouble() * (nowMillis-oneYeartAgoMillis));
        Calendar randomDay3 = Calendar.getInstance();
        randomDay3.setTimeInMillis(randomMillisDay1);
        formatteDate = dateFormat.format(randomDay3.getTime());
        System.out.println(now.getTime());
        System.out.println("過去一年間の間でランダムに1日:"+formatteDate);
        //Question 6 : 過去の日付をランダムに取得します
        System.out.println("Question 6 : 過去の日付をランダムに取得します");
        //現在の時間を取得する
        Calendar q6Now = Calendar.getInstance();
        long q6NowMillis = q6Now.getTimeInMillis();
        //ランダムオブジェクトを作成する
        Random randomq6 = new Random();
        //現在のミリ秒数までの範囲でランダムなミリ秒を生成する
        long q6RandomDayMillis =(long)(randomq6.nextDouble() * q6NowMillis);

        Calendar q6RandomDay = Calendar.getInstance();
        q6RandomDay.setTimeInMillis(q6RandomDayMillis);

        SimpleDateFormat dateFormat1 = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        String formatteDate1 = dateFormat1.format(q6RandomDay.getTime());
        System.out.println(formatteDate1);
        //Question 7 : ランダムに３桁の数を取得する
        System.out.println("Question 7 : ランダムに３桁の数を取得する");
        int z = random.nextInt(999-100+1) +100;
        System.out.println("ランダムに３桁の数:"+z);

















    }
}
