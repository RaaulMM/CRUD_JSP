<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Formualrio</title>
  </head>
  <body>
    <h1>Listado de Marcas</h1>

      <form action="grabaCoche.jsp" id="formulario">
      Matricula:<input type="text" name="mat"><br>
      Nº Chasis:<input type="text" name="vin"><br>
      
      <%
    
      Connection conexionnn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coches", "root", "root");
      Statement e = conexionnn.createStatement();

      ResultSet listadooo = e.executeQuery("SELECT * FROM Tipo");
      %>

      <select name="tipo" form="formulario">
        <%
        while (listadooo.next()) {
        out.println("<option value='" + listadooo.getString("codTipo")  + "'>" + listadooo.getString("nomTipo") + "</option>");
        }
        %>
      </select>
      <br>
      <select name="modelo" form="formulario">
        <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexionn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coches", "root", "root");
      Statement q = conexionn.createStatement();

      ResultSet listadoo = q.executeQuery("SELECT * FROM Modelo");
      %>
        <%
        while (listadoo.next()) {
        out.println("<option value='" + listadoo.getString("codMod")  + "'>" + listadoo.getString("nonMod") + "</option>");
        }
        %>
      </select>
      <br>
      
      
       <% conexionnn.close(); %>
       <% conexionn.close(); %>
      <br>
      <input type="submit">
    </form>


    
    
    
  </body>
</html>
