package aspects;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class FieldAccessLogger {
    @Pointcut("get(* app.Application.*)")
    public void fieldAccess() {}

    
    private static final long MEGABYTE = 1024L * 1024L;

    public static long bytesToMegabytes(long bytes) {
            return bytes / MEGABYTE;
    }

    
    
    int counter = 0;
    @AfterReturning(pointcut = "fieldAccess()", returning = "field")
    public void afterFieldAccess(Object field, JoinPoint thisJoinPoint) {
//        System.out.println(thisJoinPoint.toLongString());
//        System.out.println("  " + thisJoinPoint.getSignature().getName());
//        System.out.println("  " + field);
    	counter++;
    }
    
    @After("call(void app.Application.printResult())")
    public void printResult() {
    	System.out.println("Nombre d'accès au tableau " + counter);
    	
    	Runtime runtime = Runtime.getRuntime();
        // Run the garbage collector
        runtime.gc();
        // Calculate the used memory
        long memory = runtime.totalMemory() - runtime.freeMemory();
        System.out.println("Used memory is bytes: " + memory);
        System.out.println("Used memory is megabytes: "
                        + bytesToMegabytes(memory));
      }

}