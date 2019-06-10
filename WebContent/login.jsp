<%@ page contentType="text/html; charset=EUC-KR" %>
<HTML>
<head><title>수강신청 시스템 로그인</title>
<style>
ul{text-align: center; color:#ffffff;}
ul li {display:inline-block; margin-right: 60px; color:#ffffff;}
ul li:LAST-CHILD{ margin-right: 0;}
nav{
margin-top:100px;
padding:1px 0;
background-color:#0d0d5b;
border-top: 1px solid #0d0d5b;
border-bottom: 1px solid #0d0d5b;

color:#ffffff;

}
a:hover {
 color:#ffffff;
 border-bottom:1px solid black;
}

input[type=text] {
    width: 50%;
    padding: 12px 20px;
    margin-top: 200px;
    margin-left:47px;
    border-style: solid;
    border-color: #0d0d5b;

    
}
input[type=password] {
    width: 50%;
    padding: 12px 20px;
    margin: 10px 0;
    margin-left:31px;
    border-style: solid;
    box-sizing: border-box;
    border-color: #0d0d5b;
}
input[type=submit] {
    width: 23%;
    background-color: #0d0d5b;
    color: white;
    font-size:25px;
    margin-top:30px;
    
    border-radius: 3px;
    cursor: pointer;
}
input[type=reset] {
    width: 23%;
      font-size:25px;
    background-color: #0d0d5b;
    color: white;
    margin-top:15px;
   
     border-radius: 3px;
     cursor: pointer;
}
</style>
</head>
<BODY>

<%@ include file="top.jsp" %>
&nbsp;
<table width="75%" align="center" >
<FORM method="post" action="login_verify.jsp" >
<tr>

<td><div align="center" >아이디<input type="text" name="userID"></div></td>
</tr>
<tr>

<td><div align="center">패스워드<input type="password" name="userPassword">
</div></td>
</tr>

</table>

<div align="center">
<INPUT TYPE="SUBMIT" NAME="Submit" VALUE="로그인" >
<INPUT TYPE="RESET" VALUE="취소" >
</div>

</form>
</BODY> </HTML>