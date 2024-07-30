public class Exercise5 {
    public static void main(String[] args) {
        //第1の部門の情報を出力する（toString()を使用して）
        //5つの部門を作成し、それらの部門を5要素の配列に入れる
        Department[] departments = new Department[5];
        Department department1 = new Department(); department1.id = 1;
        department1.name = "Sale";
        Department department2 = new Department(); department2.id = 2;
        department2.name = "Marketing";
        Department department3 = new Department(); department3.id = 3;
        department3.name = "Boss of director";
        Department department4 = new Department(); department4.id = 4;
        department4.name = "Waiting room";
        Department department5 = new Department(); department5.id = 5;
        department5.name = "Accounting";
        departments[0] = department1;
        departments[1] = department2;
        departments[2] = department3;
        departments[3] = department4;
        departments[4] = department5;
        // question1(department1);
        //question2(departments);
        //question4(department3,"Accounting");
        //question6(departments);
    }
    private static void question1(Department department){
        //第1の部門の情報を出力する（toString()を使用して）
        System.out.println(department.toString());
    }
    private static void question2(Department[] departments){
        //すべての部門の情報を出力する（toString()を使用して）
        for(Department department : departments){
            System.out.println(department);
        }
    }
    private static void question3(Department department){
        //第1の部門の住所を出力する
        System.out.println(department.hashCode());
    }
    private static void question4(Department department, String s ){
        //第1の部門が「Phòng A」という名前であるかを確認する
        if(department.name.equals(s)){
            System.out.println("True");
        }else{
            System.out.println("False");
        }
    }
    private static void question5(Department department1,Department department2){
        //第1の部門と第2の部門を比較して、同じかどうかを確認する（2つの部門の名前が同じ場合は同じと見なす
        if(department1.equals(department2)){
            System.out.println("同じ");
        }else {
            System.out.println("同じくない");
        }
    }
    private static void question6(Department[] departments){
        //5つの部門からなる配列を初期化し、その後、名前のアルファベット順（ABCD順）に並べ替えて部門のリストを出力する
        //例:
        //Accounting
        //Boss of director Marketing
        //Sale
        //Waiting room
        for(int i = 0 ; i < departments.length ; i++){
            for (int j = i+1 ; j < departments.length ; j++){
                if(departments[i].name.compareToIgnoreCase(departments[j].name) > 0 ){
                    Department temp = departments[i];
                    departments[i] = departments[j];
                    departments[j] = temp;
                }
            }
        }
        for (Department department : departments){
            System.out.println(department);
        }
    }
   
}
