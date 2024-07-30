public class Program {
    public static void main(String[] args) {
            int temp;
            int[] ints = {3,5,6,2};
            for(int i = 0 ; i < ints.length ; i++){
                for(int j = i + 1;j < ints.length;j++){
                    //System.out.println( "i = " + ints[i] + " | " + "j : " + ints[j]);
                    if(ints[i] >  ints[j]){
                        temp = ints[i];
                        ints[i] = ints[j];
                        ints[j] = temp;
                    }
                }
            }
    }
}
