package org.glucosio.android.tools;
//import java.io.FileNotFoundException;
import java.lang.reflect.Method;
//import static java.sql.Types.NULL;




public class Driver5 {
    public static void main(String[] args) throws Exception {
        double input1;
        if(args.length >0 ){
        	System.out.printf("%s\n",lbToKgTest(Double.parseDouble(args[2])));
        }
    }


    public static String lbToKgTest(double lb) throws Exception {
    	
    	GlucosioConverter testObj = new GlucosioConverter();
        Class testCls = testObj.getClass();
        try {
        	@SuppressWarnings("unchecked")
            Method lbToKgMethod = testCls.getDeclaredMethod("lbToKg", double.class);
            lbToKgMethod.setAccessible(true);
            Object lbToKgTestObj = lbToKgMethod.invoke(testObj, lb);
//            System.out.printf("test results are: %s\n", lbToKgTestObj);
            String results = lbToKgTestObj.toString();
            return results;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "Test did not take place";
    }
}








