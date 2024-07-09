import java.util.Scanner;

public class Exercise4 {
    public static void main(String[] args) {
        question10();
    }
    private  static void question1(){
        Scanner scanner = new Scanner(System.in);
        String s = scanner.nextLine();
        String[] parts = s.split("\\s+");
        System.out.println( parts.length);

    }
    private  static void question2(){
        Scanner scanner = new Scanner(System.in);
        System.out.println("文字列１を入力してください");
        String s1 = scanner.nextLine();
        System.out.println("文字列２を入力してください");
        String s2 = scanner.nextLine();
        System.out.println("連結下の結果："+ s1 + " " + s2);
    }
    private  static void question3(){
        //ユーザーが名前を入力し、名前の最初の文字が大文字でない場合は大文字にするプログラムを作成する
        Scanner scanner = new Scanner(System.in);
        System.out.println("なまえを入力してください");
        String s = scanner.nextLine();
        if (s != null && !s.isEmpty()){
            String leftCharater = s.substring(1);
            String rightCharater = s.substring(0,1).toUpperCase();
            s =  rightCharater + leftCharater;
        }
        System.out.println(s);


    }
    private static void question4(){
        //ユーザーが名前を入力し、その名前の各文字を出力するプログラムを作成する
        //例：
        //ユーザーが「Nam」と入力すると、システムは以下のように出力します
        //「1文字目は: N」
        //「2文字目は: A」
        //「3文字目は: M」
        Scanner scanner = new Scanner(System.in);
        System.out.println("なまえを入力してください");
        String sName = scanner.nextLine();
        if (sName != null && !sName.isEmpty()){
            for (int i = 0 ; i < sName.length(); i++){
                System.out.println(i+1+"文字目："+ sName.charAt(i));
            }
        }
    }
    private  static void question5(){
        //ユーザーが姓を入力し、その後名を入力するように促し、システムがフルネームを出力するプログラムを作成する
        Scanner scanner = new Scanner(System.in);
        System.out.println("姓を入力してください");
        String fistName = scanner.nextLine();
        System.out.println("名を入力してください");
        String lastName = scanner.nextLine();
        System.out.println("入力された名前："+ fistName + " " + lastName);

    }
    private  static  void question6(){
        //ユーザーにフルネームを入力させ、その後システムが姓、ミドルネーム、名前を分割するプログラムを作成する
        //例：
        //ユーザーが「Nguyễn Văn Nam」と入力すると、
        //システムは「姓は：Nguyễn」「ミドルネームは：Văn」「名前は：Nam」と出力します
        Scanner scanner = new Scanner(System.in);
        System.out.println("名前を入力してください");
        String name = scanner.nextLine();
        String[] nameParts = name.split("\\s+");

        if (nameParts.length == 3) {
            String lastName = nameParts[0];
            String middleName = nameParts[1];
            String firstName = nameParts[2];
            System.out.println("姓は：" + lastName);
            System.out.println("ミドルネームは：" + middleName);
            System.out.println("名前は：" + firstName);
        }else {
            System.out.println("名前が正しく入力されていません。フルネームを正確に3つの部分に分割できません。");
        }


    }
    private static void question7(){
        //ユーザーにフルネームを入力させ、その名前を以下のように正規化するプログラムを作成する：
        //a) ユーザーが入力した文字列の先頭、末尾、および間のスペースを削除する
        //例：ユーザーが「 nguyễn văn nam 」と入力した場合、「nguyễn văn nam」に正規化する
        //b) 各単語の最初の文字を大文字にする
        //例：ユーザーが「 nguyễn văn nam 」と入力した場合、「Nguyễn Văn Nam」に正規化する
        Scanner scanner = new Scanner(System.in);
        System.out.println("フルネームを入力してください");
        String name = scanner.nextLine();
        scanner.close();
        //ユーザーが入力した文字列の先頭、末尾、および間のスペースを削除する
        name = name.trim();
        name = name.replaceAll("\\s+", " ");
        //各単語の最初の文字を大文字にする
        String[] nameParts = name.split("\\s+");
        String retuln = "";
        String leftName, lastName,namePart;
        for(int i = 0 ;i< nameParts.length;i++){
            leftName = nameParts[i].substring(0,1).toUpperCase();
            lastName = nameParts[i].substring(1);
            namePart = leftName +lastName + " ";
            retuln = retuln + namePart;
        }
        System.out.println(retuln);

    }

    private  static void question8(){
        //"Java"を含むすべてのグループを出力する
       String[] groupNames = {"Java with VTI","Cách qua môn gia va", "Học Java có khó không?"};
       for (String groupName :groupNames){
           if(groupName.contains("Java")){
               System.out.println(groupName);
           }
       }


    }
    private static void question9(){
        //すべての "Java" グループを出力する
        String[] groupNames = { "Java", "C#", "C++" };
        for(String groupName:groupNames){
            if (groupName.equals("Java")){
                System.out.println(groupName);
            }
        }

    }
    private static void question10(){
        //2つの文字列が互いに逆順であるかどうかを確認します。もしそうなら「OK」、そうでなければ「KO」と出力します。
        //例：「word」と「drow」は逆順の文字列です。
        Scanner scanner = new Scanner(System.in);
        String reverseS1 = "";
        System.out.println("1文字：");
        String s1 = scanner.nextLine();
        System.out.println("2文字：");
        String s2 = scanner.nextLine();
        for (int i = s1.length() -1 ; i >=0 ; i--){
            reverseS1 += s1.substring(i,i+1);

        }
        if(s2.equals(reverseS1)){
            System.out.println("文字列が互いに逆順である");
        }else {
            System.out.println("これは逆順の文字列ではありません");
        }
        scanner.close();
    }
    private static void question11(){
        //文字列中に文字 'a' が出現する回数を数える
    }
}