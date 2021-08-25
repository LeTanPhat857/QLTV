package model.utils;

public class Random {
    public String createRandomString(int length) {
        String result = "";
        java.util.Random random = new java.util.Random();

        int counter = 0;
        while (counter < length) {
            int randomNumber = 48 + random.nextInt(74);
            if (48 <= randomNumber && randomNumber <= 57) {
                result += randomNumber;
                counter += 1;
            }
            if (65 <= randomNumber && randomNumber <= 90) {
                result += (char) randomNumber;
                counter += 1;
            }
            if (97 <= randomNumber && randomNumber <= 122) {
                result += (char) randomNumber;
                counter += 1;
            }
        }
        return result;
    }
}
