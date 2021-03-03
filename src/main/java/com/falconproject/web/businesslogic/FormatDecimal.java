package com.falconproject.web.businesslogic;

import java.text.DecimalFormat;

public class FormatDecimal {

    public static String decimalFormatter(Double dd) {
        String s = Double.toString(dd);
        int i = s.indexOf('.');
        String num = s.substring(i + 1);

        DecimalFormat df = null;
        if (num.length() == 1) {
            df = new DecimalFormat("#.#");
        }
        if (num.length() == 2) {
            df = new DecimalFormat("#.##");
        }
        if (num.length() == 3) {
            df = new DecimalFormat("#.###");
        }
        if (num.length() == 4) {
            df = new DecimalFormat("#.####");
        }
        if (num.length() == 5) {
            df = new DecimalFormat("#.#####");
        }

        return df.format(dd);
    }

    public static String decimalStringFormatter(String value) {
        int i = value.indexOf('.');
        String afterDecimal = value.substring(i + 1);

        String newString = "";
        if (afterDecimal.equalsIgnoreCase("0")) {
            newString = value.substring(0, i);
        } else {
            newString = value;
        }
        return newString;
    }


    public static String decimalTwoPlaces(String value) {
        if (!value.contains(".")) {
            return value + ".00";
        } else {
            int i = value.indexOf('.');
            String afterDecimal = value.substring(i + 1);
            if (afterDecimal.length() == 1) {
                return value + "0";
            } else {
                return value;
            }
        }
    }

    public static String decimal2Places(String value) {
        if (null != value) {
            if (!value.contains(".")) {
                return value + ".00";
            } else {
                int i = value.indexOf('.');
                return value.substring(0, i) + ".00";
            }
        } else {
            return null;
        }
    }
}
