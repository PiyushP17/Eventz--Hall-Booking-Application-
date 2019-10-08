package backend;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
public class HashPass {
    public static String md5(String pass) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5"); 
        byte[] messageDigest = md.digest(pass.getBytes()); 
        BigInteger no = new BigInteger(1, messageDigest); 
        String hashedPass = no.toString(16); 
        System.out.println("Length is : "+hashedPass.length());
        while (hashedPass.length() < 32) { 
            hashedPass = "0" + hashedPass; 
            
        }
        return hashedPass;
    }
}
