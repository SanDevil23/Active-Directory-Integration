package com.anand.common;

import java.io.File;
import java.net.URLDecoder;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.stereotype.Repository;

@Repository
public class MailService {

	/*Creates a thread pool that reuses fixed number of threads(as specified by noOfThreads in this case).*/
	private ScheduledExecutorService mailThreadService = Executors.newScheduledThreadPool(20);

	private static String emailUserName = "hr@anandgroupindia.net.in";

	private static String emailPassword = "qcdgadxrxvkfkubc";

	public void sendToCcBccMail(String subject, String bodyContent, List<String> mailTo, List<String> ccTo, List<String> bccTo) {
		mailThreadService.submit(new Runnable() {
			@Override
			public void run() {
				try {
					Properties props = new Properties();
		            props.put("mail.smtp.host", "smtp.gmail.com");   
		            props.put("mail.smtp.socketFactory.port", "465");   
		            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
		            props.put("mail.smtp.auth", "true");   
		            props.put("mail.smtp.port", "465");
		            props.put("mail.smtp.socketFactory.fallback", "true");
		            
		            Session session = Session.getInstance(props, new javax.mail.Authenticator() {
		            	protected PasswordAuthentication getPasswordAuthentication() {
		            		return new PasswordAuthentication(emailUserName, emailPassword);
		            	}
		            });
		            Message msg = new MimeMessage(session);
		            msg.setFrom(new InternetAddress(emailUserName, false));
		            for(String toEmail : mailTo) {
		            	msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
		            }
		            if(ccTo !=  null && ccTo.size() != 0) {
		            	for(String toCc : ccTo) {
			            	msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(toCc));
			            }
		            }
		            if(bccTo !=  null && bccTo.size() != 0) {
		            	for(String toBccEmail : bccTo) {
			            	msg.setRecipients(Message.RecipientType.BCC, InternetAddress.parse(toBccEmail));
			            }
		            }

		            msg.setSubject(subject);
		            
		            Multipart multipart = new MimeMultipart();
		            
		            BodyPart content = new MimeBodyPart();
		            content.setContent(bodyContent, "text/html");
		            multipart.addBodyPart(content);
		            content = null;

		            String path = this.getClass().getClassLoader().getResource("").getPath().replace("/classes/","/classes/static/usedStaticFiles/images/mail_images");
		            String fullPath = URLDecoder.decode(path, "UTF-8");
		            path = null;
		            
		            BodyPart logo = new MimeBodyPart();
		            DataSource logoFile = new FileDataSource(fullPath+File.separator+"mail_header.jpg");
		            logo.setDataHandler(new DataHandler(logoFile));
		            logo.setHeader("Content-ID", "<logoImage>");
		            multipart.addBodyPart(logo);
		            logoFile = null; logo = null;
		           
		            BodyPart footer = new MimeBodyPart();
		            DataSource footerFile = new FileDataSource(fullPath+File.separator+"mail_footer.png");
		            footer.setDataHandler(new DataHandler(footerFile));
		            footer.setHeader("Content-ID", "<footerImage>");
		            multipart.addBodyPart(footer);
		            fullPath = null; footerFile = null; footer = null;
		            
		            msg.setContent(multipart);
		            
		            msg.saveChanges();
		            Transport.send(msg);
		            
		            System.out.println("test");

		            multipart = null; msg = null;
		            session = null; props = null;
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
}
