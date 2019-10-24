package org.glucosio.android.tools;
//import java.io.FileNotFoundException;
import java.lang.reflect.Method;
//import static java.sql.Types.NULL;




public class Driver2 {
    public static void main(String[] args) throws Exception {
        double input1;
        if(args.length >0 ){
            System.out.printf("%s\n",kgToLbTest(Double.parseDouble(args[2])));
        }
    }


    public static String kgToLbTest(double lb) throws Exception {
        GlucosioConverter testObj = new GlucosioConverter();
        Class testCls = testObj.getClass();
        try {
            Method kgToLbMethod = testCls.getDeclaredMethod("kgToLb", double.class);
            kgToLbMethod.setAccessible(true);
            Object kgToLbTestObj = kgToLbMethod.invoke(testObj, lb);
//            System.out.printf("test results are: %s\n", lbToKgTestObj);
            String results = kgToLbTestObj.toString();
            return results;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "Test did not take place";
    }
}








