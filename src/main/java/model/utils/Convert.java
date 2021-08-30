package model.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Convert {

	public static Integer convertStringToInt(String numberString) {
		try {
			if (numberString != "") {
				return Integer.parseInt(numberString);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String convertDateToString(Timestamp date) {
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			String string = formatter.format(date);
			return string;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String convertTimeToString(Timestamp date) {
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
			String string = formatter.format(date);
			return string;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String convertIntToMoney(int num) {
		try {
			String result = "";
			while (num / 1000 > 0) {
				int remain = num % 1000;
				if (remain < 10) {
					result += ",00" + remain;
				} else if (remain < 100) {
					result += ",0" + remain;
				} else {
					result += "," + remain;
				}
				num = num / 1000;
			}
			return result = num + result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
//		System.out.println(convertDateToString(new Date(System.currentTimeMillis())));
		System.out.println(convertIntToMoney(129000110));
	}
}
