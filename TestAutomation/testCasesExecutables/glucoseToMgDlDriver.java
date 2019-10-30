package org.glucosio.android.tools;
//import java.io.FileNotFoundException;
import java.lang.reflect.Method;
//import static java.sql.Types.NULL;




public class glucoseToMgDlDriver {
    public static void main(String[] args) throws Exception {
        double input1;
        if(args.length >0 ){
        	System.out.printf("%s\n",glucoseToMgDlTest(Double.parseDouble(args[2])));
        }
    }


    public static String glucoseToMgDlTest(double lb) throws Exception {
    	
    	GlucosioConverter testObj = new GlucosioConverter();
        Class testCls = testObj.getClass();
        try {
        	@SuppressWarnings("unchecked")
            Method glucoseToMgDlMethod = testCls.getDeclaredMethod("glucoseToMgDl", double.class);
            glucoseToMgDlMethod.setAccessible(true);
            Object glucoseToMgDlTestObj = glucoseToMgDlMethod.invoke(testObj, lb);
//            System.out.printf("test results are: %s\n", glucoseToMgDlTestObj);
            String results = glucoseToMgDlTestObj.toString();
            return results;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "Test did not take place";
    }
}








