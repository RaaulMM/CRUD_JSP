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

    <title>Modifica - Raul Moreno</title>
  </head>
  <body>
     <%
          Class.forName("com.mysql.jdbc.Driver");
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
    <% request.setCharacterEncoding("UTF-8"); %>
    <div class="container">
      <br><br>
      <div class="panel panel-info">
        <div class="panel-heading text-center">Modificación de coche</div>
          <form method="get" action="grabaCocheModificado.jsp">
            <div class="form-group"> 
              <label>&nbsp;&nbsp;Codigo Coche:&nbsp;</label><input type="text" size="5" name="codVeh" value="<%= request.getParameter("codVeh") %>" readonly>
            </div>
            <div class="form-group">
            <label>&nbsp;&nbsp;Matricula:&nbsp;</label><input type="text" size="20" name="matVeh" value="<%= request.getParameter("matVeh") %>">
            </div>
            <div class="form-group">
             <label>&nbsp;&nbsp;VIN:&nbsp;</label><input type="text" size="35" name="vinVeh" value="<%= request.getParameter("vinVeh") %>">
             <label>&nbsp;&nbsp;Tipo:&nbsp;</label><select name="cod_tipo" >
               
                <%
                  //int tipoOld = Integer.valueOf(request.getParameter("tipo"));
                  
                  while (listadooo.next()){
                    //if (tipoOld == Integer.parseInt(listadooo.getString("codTipo"))){
                  //out.println("<option default value='" + listadooo.getString("codTipo")  + "'>" + listadooo.getString("nomTipo") + "</option>");
                 // }else { 
                      out.println("<option value='" + listadooo.getString("codTipo")  + "'>" + listadooo.getString("nomTipo") + "</option>");
                    }
                  %>
                </select>
            </div>
            <div class="form-group">
             <label>&nbsp;&nbsp;Modelo:&nbsp;</label><select name="cod_mod" >
                    <%
                  while (listadoo.next()) {
                  out.println("<option value='" + listadoo.getString("codMod")  + "'>" + listadoo.getString("nonMod") + "</option>");
                  }
                  %>
                  
                </select>
            </div>
            <hr>
            &nbsp;&nbsp;<a href="index.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Cancelar</a>
            <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span>Aceptar</button><br><br>
          </form>

      </div>
      <div class="text-center">&copy; Luis José Sánchez González</div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
