<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" type="text/css" href="estilos.css" />
  </head>
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coches","root", "root");
      Statement s = conexion.createStatement();

      ResultSet listado = s.executeQuery ("SELECT * FROM Vehiculo");
    %>
    <table>
      <tr><th>Código</th><th>Matricula</th><th>VIN</th><th>Modelod</th><th>Tipo</th></tr>
    <%
      while (listado.next()) {
          out.println("<tr><td>");
          out.println(listado.getString("codVeh") + "</td>");
          out.println("<td>" + listado.getString("matVeh") + "</td>");
          out.println("<td>" + listado.getString("vinVeh") + "</td>");
          out.println("<td>" + listado.getString("cod_mod") + "</td>");
          out.println("<td>" + listado.getString("cod_tipo") + "</td>");
    %>
      <td>
      <form method="get" action="BorrarCoche.jsp">
        <input type="hidden" name="codigo" value="<%=listado.getString("codVeh") %>"/>
        <input type="submit" value="borrar">
      </form>
      </td></tr>
    <%
      } // while   
      conexion.close();
     %>
    </table>
  </body>
</html>