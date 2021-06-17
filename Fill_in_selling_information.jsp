<%@ page language="java"%> 
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.sql.*"%> 
<%@ page import="java.text.*"%> 
<%@ page import="java.io.*"%> 
<% 
Class.forName("com.mysql.cj.jdbc.Driver");
//String driver="com.mysql.cj.jdbc.Driver";//com.microsoft.jdbc.sqlserver.SQLserveDriver
String url ="jdbc:mysql://localhost:3306/niit?characterEncoding=8859_1";
//myDB为数据库名 
Connection conn = DriverManager.getConnection(url,"root","xst666..");

//插入数据库 
String sql="insert into It_In(It_Na,It_Ne,It_Pr,It_De,It_Pi,It_Tr,It_Dr) values (?,?,?,?,?,?,?)"; 
//获取传值ID 
String It_Na = request.getParameter("It_Na");
String It_Ne = request.getParameter("It_Ne");
String It_Pr = request.getParameter("It_Pr");
String It_De = request.getParameter("It_De");
String It = request.getParameter("It_Pi");
String It_Tr = request.getParameter("It_Tr");
String It_Dr = request.getParameter("It_Dr");

File file=new File(It); 

//以流的格式赋值 
InputStream inputStream = new FileInputStream(file);  
PreparedStatement ps =conn.prepareStatement(sql); 



ps.setString(1,It_Na); 
ps.setString(2,It_Ne); 
ps.setString(3,It_Pr); 
ps.setString(4,It_De); 
byte[] buf=new byte[inputStream.available()]; 
inputStream.read(buf);
ps.setBytes(5,buf);
ps.setString(6,It_Tr); 
ps.setString(7,It_Dr); 
ps.executeUpdate(); 
ps.close(); 
%> 
<jsp:forward page="Fill_in_selling_information_successful.jsp"/>