package com.java;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
public class Mailer
{
	static String sub="Library alert";
	static String from='';// mention the mail id of sender
	static String password=''; // mention the password of the sender
	static public String to;
	static public String book;
	
	public void setMail(String usermail)
	{
		to= usermail;
		System.out.println("Mail id is set");
	}
	public void setBookName(String bookname)
	{
		book=bookname;
		System.out.println("Book name is "+book);
	}
	public  void sendEnddate(String msg)
	{  
       
        Properties props = new Properties();    
        props.put("mail.smtp.host", "smtp.gmail.com");    
        props.put("mail.smtp.socketFactory.port", "465");    
        props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");    
        props.put("mail.smtp.auth", "true");    
        props.put("mail.smtp.port", "465");    
        //get Session   
        Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator() {    
         protected PasswordAuthentication getPasswordAuthentication() {    
         return new PasswordAuthentication(from,password);  
         }    
        });    

        try {    
         MimeMessage message = new MimeMessage(session);    
         message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
         message.setSubject(sub);    
         message.setText("Your requested book will be available on "+msg);    
         //send message  
         Transport.send(message);    
         System.out.println("message sent successfully");    
        }
        catch (MessagingException e)
        {
            throw new RuntimeException(e);
          }    
           
  }
	
	public  void sendPassword(String to,String msg)
	{  
        //Get properties object    
        Properties props = new Properties();    
        props.put("mail.smtp.host", "smtp.gmail.com");    
        props.put("mail.smtp.socketFactory.port", "465");    
        props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");    
        props.put("mail.smtp.auth", "true");    
        props.put("mail.smtp.port", "465");    
        //get Session   
        Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator() {    
         protected PasswordAuthentication getPasswordAuthentication() {    
         return new PasswordAuthentication(from,password);  
         }    
        });    
        //compose message   
       
        try {    
         MimeMessage message = new MimeMessage(session);    
         message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
         message.setSubject(sub);    
         message.setText("Your Password is  "+msg);    
         //send message  
         Transport.send(message);    
         System.out.println("message sent successfully");    
        }
        catch (MessagingException e)
        {
            throw new RuntimeException(e);
          }    
           
  } 
	public  void bookingConfirmed(String msg)
	{  
        //Get properties object    
        Properties props = new Properties();    
        props.put("mail.smtp.host", "smtp.gmail.com");    
        props.put("mail.smtp.socketFactory.port", "465");    
        props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");    
        props.put("mail.smtp.auth", "true");    
        props.put("mail.smtp.port", "465");    
        //get Session   
        Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator() {    
         protected PasswordAuthentication getPasswordAuthentication() {    
         return new PasswordAuthentication(from,password);  
         }    
        });    
        //compose message   
       
        try {    
         MimeMessage message = new MimeMessage(session);    
         message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
         message.setSubject(sub);    
         message.setText("You have taken a book which you have to return on "+msg);    
         //send message  
         Transport.send(message);    
         System.out.println("message sent successfully");    
        }
        catch (MessagingException e)
        {
            throw new RuntimeException(e);
          }    
           
  } 
	
	}
