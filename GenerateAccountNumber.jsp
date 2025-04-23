<%@ page import="java.sql.*,java.util.Random,java.security.KeyPairGenerator,javax.crypto.Cipher,java.security.Key,java.security.KeyPair     "%>
<%@ include file="connect.jsp" %>
<html><style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
-->
</style>
<body>
<center>&nbsp;</center>
<br><br><br>
  <%
  		   int id = Integer.parseInt(request.getParameter("id"));
		   String typebank=request.getParameter("typebank");
		   String username=request.getParameter("username");
		  
try
{
	String num="null";
		if(typebank.equalsIgnoreCase("SBI Bank"))
		{
		
				Random rr=new Random();
				
				 num=64+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10));
				
		}
		
		else if(typebank.equalsIgnoreCase("Bank of Maharashtra"))
		{
				Random rr=new Random();
				
				 num=48+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10));
				
		}
		
		
		else if(typebank.equalsIgnoreCase("Canara Bank"))
		{
				Random rr=new Random();
				
				 num=32+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10));
			
		}
		
		
		else if(typebank.equalsIgnoreCase("Corporation Bank"))
		{
				Random rr=new Random();
				
				 num=35+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10));
		}
		
		
		else if(typebank.equalsIgnoreCase("Karnataka Bank"))
		{
				Random rr=new Random();
				
				 num=53+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10));
		}
		
		
		else
		{
				Random rr=new Random();
				
				 num=String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10))+String.valueOf(rr.nextInt(10));
		}
		
		String val="Yes";
		
		
		
		Statement st1 = connection.createStatement();
		String query1 ="update accountrequest set account_no='"+num+"' ,status='"+val+"' where id="+id+" ";
		int k=st1.executeUpdate (query1);
		
		
		
		
		
		if(k>0)
		{
				response.sendRedirect("A_GenerateACCNum.jsp");
		
		}
		else
		{
		
		%><br/><br/>Account Number Not Generated..Please Try Agian..</p><br/><br/>
		<a href="V_GenerateACCNum.jsp">Back</a><%
		
		}
		
		connection.close();
}

catch(Exception e)
{
		out.println(e);

}


	

		  
		  
%>



</body></html>