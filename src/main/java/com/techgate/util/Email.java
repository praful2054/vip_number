package com.techgate.util;

import java.io.File;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
public class Email implements Runnable{
	
	private static  String strEmail=null;
	private static  String strBody=null;
	private static  String  strSubject=null;
	private static  String  strUserID=null;
	private static  String  strPass=null;
	
	public Email(String strEmail,String strBody,String strSubject, String strUserID, String strPass){
		Email.strEmail=strEmail;
		Email.strBody=strBody;
		Email.strSubject=strSubject; 
		Email.strUserID=strUserID;
		Email.strPass=strPass; 
	}
	
	public static long mailsend(String email, String sub, String body, String ccd) {
		
	long count=0;
	try
	{	
	Properties props=new Properties();
	props.put("mail.smtp.host","mail.vipnumberstore.in");
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.port", "587");
	//props.put("mail.smtp.starttls.enable", "true");
	Session session = Session.getDefaultInstance(props);
	//s.setDebug(false);
	Message message=new MimeMessage(session);
	InternetAddress from=new InternetAddress("cs@vipnumberstore.in", "VIP NUMBER STORE");
	message.setFrom(from);
	//System.out.println("emailHost"+email+ "userName"+sub+ "password"+body);
	InternetAddress to=new InternetAddress(email);
	message.addRecipient(Message.RecipientType.TO, to);
	
	
	
/*	
	if(cc!=null && cc.length()>5) {
		//cc = cc+","+"mamta@numberwale.com";
		String [] ccEmail = cc.split(",");
		
		for(int i=0; i < ccEmail.length;i++) {
			InternetAddress ccEmailID=new InternetAddress(ccEmail[i]);
			message.addRecipient(Message.RecipientType.CC, ccEmailID);
			System.out.println(ccEmailID);
			//message.addRecipient(Message.RecipientType.CC, InternetAddress.parse("abc@abc.com"));
		}
		
		
		
	}else {
	*/
		InternetAddress ccEmailID=new InternetAddress("pankajsetia007@gmail.com");
		message.addRecipient(Message.RecipientType.CC, ccEmailID);
	
	
	
	message.setReplyTo(InternetAddress.parse("info@vipnumberstore.in"));
	message.setSubject(sub);
	message.setText(body);
	message.setContent(body, "text/html");
	
		count++;
		Transport transport=session.getTransport("smtp");
		transport.connect("mail.vipnumberstore.in", "cs@vipnumberstore.in", "Mumbai@567");
		
		transport.sendMessage(message, message.getAllRecipients());
		transport.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
		System.out.println("Exception:j "+e);
	}
		return count;
	}
	
	public static long mailsendAtach(String sub, String body, String email,String filepath, String pdfFilename) {
		
		long count=0;
		try
		{	
		Properties props=new Properties();
		props.put("mail.smtp.host","mail.vipnumberstore.in");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "587");
		//props.put("mail.smtp.starttls.enable", "true");
		Session session = Session.getDefaultInstance(props);
		//s.setDebug(false);
		MimeMessage mailMessage = new MimeMessage(session);
		
		InternetAddress from=new InternetAddress("noreply@vipnumberstore.in", "VIP NUMBER STORE");

            mailMessage.setSubject(sub);
           
            Multipart mailMessageMultiPart = new MimeMultipart();

            BodyPart mailingMessageBody = new MimeBodyPart();

            mailingMessageBody.setText(body);
            mailingMessageBody.setContent(body, "text/html");
            mailMessageMultiPart.addBodyPart(mailingMessageBody);

            mailingMessageBody = new MimeBodyPart();

            FileDataSource fileDataSource = new FileDataSource(filepath);

            mailingMessageBody.setDataHandler(new DataHandler(fileDataSource));

            mailingMessageBody.setFileName(pdfFilename);

            mailMessageMultiPart.addBodyPart(mailingMessageBody);

            mailMessage.setContent(mailMessageMultiPart);

            mailMessage.addRecipients(Message.RecipientType.TO, email);	
            
            mailMessage.setReplyTo(InternetAddress.parse(email));
		            
			Transport transport=session.getTransport("smtp");
			transport.connect("mail.vipnumberstore.in", "noreply@vipnumberstore.in", "Mumbai@567");
			
			//transport.send(mailMessage);
			transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
			transport.close();
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception:j "+e);
		}
			return count;
		}
	
	public static void main(String[] args) {
		String sub ="Thank you for Payment!";
		String body="<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'> \r\n" + 
				"			<html xmlns='http://www.w3.org/1999/xhtml'> \r\n" + 
				"			<head> " + 
				"			<meta http-equiv='Content-Type' content='text/html; charset=utf-8' /> " + 
				"			<title>VIP Number Store</title> " + 
				"			</head> " + 
				"			<body style='margin: 0px;'> " + 
				"			<table align='center' style='width: 650px; font-size: 10.5pt; color: #000000; border-width: 1px; border-style: solid; border-color: #e5e5e5; font-family: arial' cellpadding='10' cellspacing='0'> " + 
				"			  <tr> " + 
				"			    <td style='border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: #e5e5e5;'><table width='100%' border='0' cellspacing='0' cellpadding='0'> " + 
				"			        <tbody> " + 
				"			          <tr> " + 
				"			            <td colspan='3'><p style='font-size: 13pt;'><b>Dear Mukesh Agarwal,</b></p> " + 
				"			            <p>Greetings from VIP NUMBER STORE.</p>" + 
				"						 <p>We are delighted to have you as our valued customer and wish you good health and prosperity.</p> " + 
						"				 <p>Your invoice  can be viewed, printed or downloaded as PDF from the link below.</p> " + 
				"			<a href='https://vipnumberstore.in/myInvoice?orderId=2905&custId=4171' target='_blank'>View Invoice</a>" + 
				"			</p> " + 
				"			<p>Thank you for choosing us  We value your association and look forward to serving you with our products and services for many more years to come.</p> " + 
				"			<br> " + 
				"			<p> " + 
				"			Warm Regards,<br> " + 
				"			<b>VIP NUMBER STORE</b><br/></p></td> " + 
				"			          </tr> " + 
				"			        </tbody> " + 
				"			      </table></td> " + 
				"			  </tr> " + 
				"			</table> " + 
				"			</body> " + 
				"			</html>";
	mailsend("mukesh1216@gmail.com", sub, body,"mukesh1216@gmail.com");
		//mailsend("ghg", "gjhghg", "mukesh1216@gmail.com", "info@karmaalbums.com", "Krishna_2015","","");
		
	}

	@Override
	public void run() {
		mailsend("mukesh1216@gmail.com", "Test", "Test","");
	}
}



