<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    <title>BBDD Coches - Raúl Moreno Montiel</title>
  </head>

  <body>
		<div class="container">
			<br><br>			
      <div class="panel panel-primary">
        <div class="panel-heading text-center"><h2>Coches</h2></div>
        <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coches","root", "root");
          Statement s = conexion.createStatement();

          ResultSet listado = s.executeQuery ("SELECT * FROM Vehiculo");
        %>
        <%
    
          Connection conexionnn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coches", "root", "root");
          Statement e = conexionnn.createStatement();

          ResultSet listadooo = e.executeQuery("SELECT * FROM Tipo");
        %>
        
          <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexionn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coches", "root", "root");
          Statement q = conexionn.createStatement();

          ResultSet listadoo = q.executeQuery("SELECT * FROM Modelo");
        %>

        <table class="table table-striped">
        <tr><th>Id</th><th>Matricula</th><th>VIN</th><th>Tipo</th><th>Modelo</th></tr>
        <form method="get" action="grabaCoche.jsp" >
          <tr><td></td>
              
              <td><input type="text" name="matVeh" size="15"></td>
              <td><input type="text" name="vinVeh" size="30"></td>
              <td><select name="tipo" >
                <%
                  while (listadooo.next()){
                  out.println("<option value='" + listadooo.getString("codTipo")  + "'>" + listadooo.getString("nomTipo") + "</option>");
                  }
                  %>
                </select></td>
              <td><select name="modelo" >
                    <%
                  while (listadoo.next()) {
                  out.println("<option value='" + listadoo.getString("codMod")  + "'>" + listadoo.getString("nonMod") + "</option>");
                  }
                  %>
                  
                </select></td>
              <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Añadir</button></td><td></td></tr>           
        </form>
       
        <%
 
          while (listado.next()) {
          Class.forName("com.mysql.jdbc.Driver");
          Connection combinado = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coches", "root", "root");
          Statement c = combinado.createStatement();

          ResultSet tipo = c.executeQuery("SELECT nomTipo FROM Tipo WHERE codTipo ='" + listado.getString("cod_tipo") +"' ");
          
          String p = "0";
        
          while (tipo.next()) {
            
            p = tipo.getString("nomTipo");
          } 
          
          //Class.forName("com.mysql.jdbc.Driver");
          //Connection combinado2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coches", "root", "root");
         // Statement c2 = combinado.createStatement();

          ResultSet com2 = c.executeQuery("SELECT nonMod FROM Modelo WHERE codMod ='" + listado.getString("cod_mod") +"' ");
          
          String m = "0";
        
          while (com2.next()) {
            
            m = com2.getString("nonMod");
          } 
            
            out.println("<tr><td>");
            out.println(listado.getString("codVeh") + "</td>");
            out.println("<td>" + listado.getString("matVeh") + "</td>");
            out.println("<td>" + listado.getString("vinVeh") + "</td>");
            out.println("<td>" + p + "</td>");
            out.println("<td>" + m + "</td>");
        %>
        <td>
        <form method="get" action="modificaCoche.jsp">
					<input type="hidden" name="codVeh" value="<%=listado.getString("codVeh") %>">
          <input type="hidden" name="matVeh" value="<%=listado.getString("matVeh") %>">
          <input type="hidden" name="vinVeh" value="<%=listado.getString("vinVeh") %>">
          <input type="hidden" name="cod_tipo" value="<%=listado.getString("cod_tipo") %>">
          <input type="hidden" name="cod_mod" value="<%=listado.getString("cod_mod") %>">
					<button type="submit"  class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>
				</form>
				</td>
				<td>
        <form method="get" action="BorrarCoche.jsp">
          <input type="hidden" name="codVeh" value="<%=listado.getString("codVeh") %>"/>
          <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
        </form>
        </td></tr>
        <%
          } // while   

          conexion.close();
          conexionnn.close();
         
        %>

        </table>
      </div>
      <div class="text-center">&copy; Raúl Moreno Montiel</div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
