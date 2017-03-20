package app;

public class Application {
    public static Double[] my_array = new Double[10];
    public static void main(String[] args) {
    	

    	
        long startTime = System.currentTimeMillis();

    	
    	for (int i = 0; i<1000;i++){
			my_array[0] = new Double(i);
		}    
    	
        long stopTime = System.currentTimeMillis();
        long elapsedTime = stopTime - startTime;
        System.out.println("temps de traitement : " + elapsedTime + " ms");
        
        
		printResult();
    }
    
    public static void printResult(){}
}