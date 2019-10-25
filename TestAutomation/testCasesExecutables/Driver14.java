package org.glucosio.android.tools;
//import java.io.FileNotFoundException;
import java.lang.reflect.Method;
//import static java.sql.Types.NULL;




public class Driver14 {
    public static void main(String[] args) throws Exception {
        double input1;
        if(args.length >0 ){
        	System.out.printf("%s\n",glucoseToA1CTest(Double.parseDouble(args[2])));
        }
    }


    public static String glucoseToA1CTest(double mgDl) throws Exception {
    	
    	GlucosioConverter testObj = new GlucosioConverter();
        Class testCls = testObj.getClass();
        try {
        	@SuppressWarnings("unchecked")
            Method glucoseToA1CMethod = testCls.getDeclaredMethod("glucoseToA1C", double.class);
            glucoseToA1CMethod.setAccessible(true);
            Object glucoseToA1CTestObj = glucoseToA1CMethod.invoke(testObj, mgDl);
//            System.out.printf("test results are: %s\n", lbToKgTestObj);
            String results = glucoseToA1CTestObj.toString();
            return results;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "Test did not take place";
    }
}








