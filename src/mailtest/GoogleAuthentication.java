package mailtest;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
    
    public GoogleAuthentication(){
        passAuth = new PasswordAuthentication("kyky7896@gmail.com", "toccjjrvwcpgdpwr");
    }
 
    public PasswordAuthentication getPasswordAuthentication() {
        return passAuth;
    }
}
