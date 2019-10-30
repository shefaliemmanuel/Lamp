package org.glucosio.android.tools;
//import java.io.FileNotFoundException;
import java.lang.reflect.Method;
//import static java.sql.Types.NULL;




public class glucoseToMmolLDriver {
    public static void main(String[] args) throws Exception {
        double input1;
        if(args.length >0 ){
        	System.out.printf("%s\n",glucoseToMmolLTest(Double.parseDouble(args[2])));
        }
    }


    public static String glucoseToMmolLTest(double lb) throws Exception {
    	
    	GlucosioConverter testObj = new GlucosioConverter();
        Class testCls = testObj.getClass();
        try {
        	@SuppressWarnings("unchecked")
            Method glucoseToMmolLMethod = testCls.getDeclaredMethod("glucoseToMmolL", double.class);
            glucoseToMmolLMethod.setAccessible(true);
            Object glucoseToMmolLTestObj = glucoseToMmolLMethod.invoke(testObj, lb);
//            System.out.printf("test results are: %s\n", glucoseToMmolLTestObj);
            String results = glucoseToMmolLTestObj.toString();
            return results;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "Test did not take place";
    }
}








