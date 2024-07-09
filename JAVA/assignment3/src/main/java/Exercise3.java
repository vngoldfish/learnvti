public class Exercise3 {
    public static void main(String[] args) {
        question3();
    }
    public  static  void  question1(){
        Integer salary = 5000;
        Float convert = (float) salary;
        System.out.println(convert);
    }
    public static void  question2(){
        String s = "12334567";
        int convertNumbertInt = Integer.parseInt(s);
        System.out.println(convertNumbertInt+2);
    }
    private  static void  question3(){
        Integer i = 1234567;
        int j = i.intValue();
        System.out.println(j);


    }
}
