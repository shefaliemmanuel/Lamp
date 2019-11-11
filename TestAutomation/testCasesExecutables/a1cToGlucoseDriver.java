package org.glucosio.android.tools;
//import java.io.FileNotFoundException;
import java.lang.reflect.Method;
//import static java.sql.Types.NULL;




public class a1cToGlucoseDriver {
    public static void main(String[] args) throws Exception {
        double input1;
        if(args.length >0 ){
        	System.out.printf("%.1f\n",Double.parseDouble(a1cToGlucoseTest(Double.parseDouble(args[2]))));
        }
    }


    public static String a1cToGlucoseTest(double mgDl) throws Exception {
    	
    	GlucosioConverter testObj = new GlucosioConverter();
        Class testCls = testObj.getClass();
        try {
        	@SuppressWarnings("unchecked")
            Method a1cToGlucoseMethod = testCls.getDeclaredMethod("a1cToGlucose", double.class);
            a1cToGlucoseMethod.setAccessible(true);
            Object a1cToGlucoseTestObj = a1cToGlucoseMethod.invoke(testObj, mgDl);
//            System.out.printf("test results are: %s\n", lbToKgTestObj);
            String results = a1cToGlucoseTestObj.toString();
            return results;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "Test did not take place";
    }
}








