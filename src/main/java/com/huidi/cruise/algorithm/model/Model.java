package com.huidi.cruise.algorithm.model;

/***
 * model to sharp the traffic in one day with Normal distribution
 */
public class Model {
    private static int[] number = {184, 243, 312, 388, 467, 546, 619, 680, 723, 746, 746, 723, 680, 619, 546, 467, 388, 312, 243, 184};
    //    private static BigDecimal erf3 = new BigDecimal("0.999977909503001414558627223870417679620152292912600750342");
//
//    public static BigDecimal model(int MAXTOURISTS, int x, int mode){
//        int bias = 10;
//        //Default is to. If mode is 1, it is back.
//        if(mode == 1){
//            bias = 12;
//        }
//        BigDecimal y;
//        BigDecimal coef1 = new BigDecimal(MAXTOURISTS);
//        BigDecimal coef2 = new BigDecimal("0.3");
//        BigDecimal coef3 = new BigDecimal(Math.sqrt(Math.PI));
//        BigDecimal coef = coef1.multiply(coef2).divide(coef3, 10, ROUND_HALF_UP).divide(erf3, 10, ROUND_HALF_UP);
//
//        BigDecimal exp1 = new BigDecimal("-0.09");
//        BigDecimal exp2 = new BigDecimal((x-bias) * (x-bias));
//        double exp = Math.exp(exp1.multiply(exp2).doubleValue());
//        BigDecimal expD = new BigDecimal(exp);
//
//        y = coef.multiply(expD);
//        return y.setScale(0, RoundingMode.HALF_UP);//rounding
//    }
    public static int size() {
        return number.length;
    }
    public static int model(int MAXTOURISTS, int x) {
        //       int[] number = {812, 971, 1140, 1311, 1477, 1633, 1768, 1877, 1954, 1993, 1993, 1954, 1877, 1768, 1633, 1477, 1311, 1140, 971, 812};
//        int[] number = {732, 779, 823, 864, 900, 932, 958, 978, 992, 999, 999, 992, 978, 958, 932, 900, 864, 823, 779, 732};//18000
//        int[] number = {406, 486, 570, 655, 739, 816, 884, 939, 977, 997, 997, 977, 939, 884, 816, 739, 655, 570, 486, 406};//15000
        //10000 / 750

        double coef = (double) MAXTOURISTS / 10000;
        int result = 0;
        result = (int) (coef * number[x]);
        return result;
    }
}
