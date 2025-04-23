<%@ include file="connect.jsp" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.*,java.lang.*,java.text.SimpleDateFormat,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec"%>
<%@ page import="org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.util.Random,java.io.PrintStream, java.io.FileOutputStream, java.io.FileInputStream, java.security.DigestInputStream, java.math.BigInteger, java.security.MessageDigest, java.io.BufferedInputStream" %>


<% 



    try{
	  		String acno1=null;
			String name=request.getParameter("uname");
			String bank=request.getParameter("bank");
			String acno=request.getParameter("acno");
			String amount=request.getParameter("amount");				
			String status="Yes";
			String status1="No";
			String fwhom="User";
			
			
			
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
				SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
				Date now = new Date();
							
				String strDate = sdfDate.format(now);
				String strTime = sdfTime.format(now);
				String dt= strDate + "   " + strTime;
			
			String sql2="SELECT * FROM accountrequest where user='"+name+"' and bank='"+bank+"' and status='"+status+"' " ;
										Statement stmt2 = connection.createStatement();
										ResultSet rs2 =stmt2.executeQuery(sql2);
										if(rs2.next()==true)
										{
										acno1=rs2.getString(5);
										
										
											String sql21="SELECT * FROM bank_deposit where uname='"+name+"' and Bank_Name='"+bank+"' and acno='"+acno1+"' " ;
										Statement stmt21 = connection.createStatement();
										ResultSet rs21 =stmt21.executeQuery(sql21);
										if(rs21.next()==true)
										{
										int amount1=rs21.getInt(4);
										
										 int ta=amount1+Integer.parseInt(amount);
										
										Statement st3 = connection.createStatement();
										String query3 ="update bank_deposit set amount="+ta+" where  uname='"+name+"' and Bank_Name='"+bank+"' and acno='"+acno1+"' ";
											int k=st3.executeUpdate(query3);
											if(k>0)
											{
											
											Statement st31 = connection.createStatement();
										String query31 ="update auditor_deposit  set status='"+status+"' where  uname='"+name+"' and Bank_Name='"+bank+"' and acno='"+acno1+"' ";
											st31.executeUpdate(query31);
											
											%>
										
										<h2> Amount Deposited Successfully!!!</h2>
										
										 <a href="AuditorMain.jsp">Back</a>
										
									    	<%}											
											
										}
										else if(rs21.next()!=true)
										{
										
										
										
										Statement st33 = connection.createStatement();
										String query33 ="insert into  bank_deposit values('"+name+"','"+bank+"','"+acno+"',"+amount+") ";
											int k1=st33.executeUpdate(query33);
										
										if(k1>0)
											{
											
											Statement st31 = connection.createStatement();
										String query31 ="update auditor_deposit  set status='"+status+"' where  uname='"+name+"' and Bank_Name='"+bank+"' and acno='"+acno+"' ";
											st31.executeUpdate(query31);
											
											%>
										
										<h2> Amount Deposited Successfully!!!</h2>
										
										 <a href="AuditorMain.jsp">Back</a>
										
									    	<%}
										
										
										
										}
										
									
										}
										
										else if(rs2.next()!=true)
										{%>
										
										<h2> Your Account is not Generated Yet!!! Pls Wait for Some Time</h2>
										<%}
			
	}
	catch(Exception e)
	{
		out.print(e);
	}
	
%>
                 </div>
