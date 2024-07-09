import java.util.Scanner;

public class Exercise1 {
    public static void main(String[] args) {
        //question1();
        //question2();
        //question3();
        question4();
    }
    public static void question1(){
        // Question  1 : 2つの給与をfloat型で宣言します。
        // Account 1の給与を5240.5ドルに初期化します。
        // Account 2の給与を10970.055ドルに初期化します。
        // Account 1の給与を四捨五入するためにint型の変数を宣言し、その整数を出力します。
        // Account 2の給与を四捨五入するためにint型の変数を宣言し、その整数を出力します。
        float Salary1 ;
        float Salary2;
        Salary1 = (float) 5240.5;
        Salary2 = (float) 10970.055;
        System.out.println("Salary 1 : " +  Salary1  + " | Salary 2: " + Salary2);
        int rountSalary1 = (int) Salary1;
        int rountSalary2 = (int) Salary2;
        System.out.println("Rount Salary 1: " + rountSalary1 + " | Rount Ralary 2 : " + rountSalary2);
    }
    public  static  void  question2(){
        //Question 2 : ランダムに5桁の数を取得します（5桁未満の数の場合、先頭に0を追加して5桁にします）
        int min = 0 ;
        int max = 99999;
        String [] numberRandoms = new String[20];
        for (int i = 0 ; i < 20 ; i ++){
            int randomNumber= min + (int) (Math.random()*((max-min) + 1));
            String formatterNumber = String.format("%05d",randomNumber);
            numberRandoms[i] = formatterNumber;
        }
        for (String numberRandom : numberRandoms){
            System.out.println(numberRandom);
        }

    };
    public static void question3(){
        // Question 3 : Question 2の数の下2桁を取得して出力します。ヒント：
        //方法1：5桁の数をStringに変換し、下2桁を取得する
        //方法2：その数を100で割った余りを取得する
        int min = 0 ;
        int max = 99999;
        int randomNumber= min + (int) (Math.random()*((max-min) + 1));
        String formatterNumber = String.format("%05d",randomNumber);
        System.out.println(formatterNumber.length());
        String lastTwoDigits = formatterNumber.substring(formatterNumber.length() -2);
        System.out.println(formatterNumber);
        System.out.println(lastTwoDigits);
    }
    public  static void question4() {
        //Question 4 2つの整数aとbを入力し、それらの商を返すメソッドを書いてください
        Scanner scanner = new Scanner(System.in);
        int a,b;
        System.out.println("a 整数を入力する");
        a = scanner.nextInt();

        do {
            System.out.println("b 整数を入力する");
            b = scanner.nextInt();
            if(b == 0 ){
                System.out.println("0以外の整数を入力してください");
            }
        } while (b == 0);

        scanner.close();
        System.out.println("商　："+(float)a/(float)b);
    }

}
