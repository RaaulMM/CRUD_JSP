<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

  </head>
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coches","root", "root");
      Statement s = conexion.createStatement();
      request.setCharacterEncoding("UTF-8");
      String Cod = request.getParameter("'NULL'");
      String mat = request.getParameter("matVeh");
      String vin = request.getParameter("vinVeh");
      String modelo = request.getParameter("modelo");
      String tipo = request.getParameter("tipo");
      String insercion = "INSERT INTO Vehiculo (codVeh, matVeh, vinVeh, cod_mod, cod_tipo)   VALUES (" + Cod
                         
                         + ", '" + mat
                         + "','" + vin
                         + "','" + Integer.valueOf(modelo)
                         + "','" + Integer.valueOf(tipo) + "')";

      s.execute(insercion);          
      conexion.close();
    %>
    
    <%
      /* 
      out.println(Cod);
      out.println(mat);
      out.println(vin);
      out.println(modelo);
      out.println(tipo);
      */
    %>
    <br>
    
    Coche dado de alta
    <br>
    <a href="index.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Página principal</button>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
