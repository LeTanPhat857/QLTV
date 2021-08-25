package model.utils;

public class Encryption {
    // methods
    public int encrypt(String origin) {
        int result = 0;
        try {
            for (Character character : origin.toCharArray()) {
                result += (int) (character * character + 5 * character - 1);
            }
            return result;
        } catch (Exception exception){
            return -1;
        }
    }
}
