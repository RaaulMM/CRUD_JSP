package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Connection;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("  <head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    \n");
      out.write("    <!-- Bootstrap -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\" integrity=\"sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7\" crossorigin=\"anonymous\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css\" integrity=\"sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r\" crossorigin=\"anonymous\">\n");
      out.write("    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js\" integrity=\"sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS\" crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("    <title>BBDD Coches - Raúl Moreno Montiel</title>\n");
      out.write("  </head>\n");
      out.write("\n");
      out.write("  <body>\n");
      out.write("\t\t<div class=\"container\">\n");
      out.write("\t\t\t<br><br>\t\t\t\n");
      out.write("      <div class=\"panel panel-primary\">\n");
      out.write("        <div class=\"panel-heading text-center\"><h2>Coches</h2></div>\n");
      out.write("        ");

          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coches","root", "root");
          Statement s = conexion.createStatement();

          ResultSet listado = s.executeQuery ("SELECT * FROM Vehiculo");
        
      out.write("\n");
      out.write("        ");

    
          Connection conexionnn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coches", "root", "root");
          Statement e = conexionnn.createStatement();

          ResultSet listadooo = e.executeQuery("SELECT * FROM Tipo");
        
      out.write("\n");
      out.write("        \n");
      out.write("          ");

          Class.forName("com.mysql.jdbc.Driver");
          Connection conexionn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coches", "root", "root");
          Statement q = conexionn.createStatement();

          ResultSet listadoo = q.executeQuery("SELECT * FROM Modelo");
        
      out.write("\n");
      out.write("\n");
      out.write("        <table class=\"table table-striped\">\n");
      out.write("        <tr><th>Id</th><th>Matricula</th><th>VIN</th><th>Tipo</th><th>Modelo</th></tr>\n");
      out.write("        <form method=\"get\" action=\"grabaCoche.jsp\" >\n");
      out.write("          <tr><td></td>\n");
      out.write("              \n");
      out.write("              <td><input type=\"text\" name=\"matVeh\" size=\"15\"></td>\n");
      out.write("              <td><input type=\"text\" name=\"vinVeh\" size=\"30\"></td>\n");
      out.write("              <td><select name=\"tipo\" >\n");
      out.write("                ");

                  while (listadooo.next()){
                  out.println("<option value='" + listadooo.getString("codTipo")  + "'>" + listadooo.getString("nomTipo") + "</option>");
                  }
                  
      out.write("\n");
      out.write("                </select></td>\n");
      out.write("              <td><select name=\"modelo\" >\n");
      out.write("                    ");

                  while (listadoo.next()) {
                  out.println("<option value='" + listadoo.getString("codMod")  + "'>" + listadoo.getString("nonMod") + "</option>");
                  }
                  
      out.write("\n");
      out.write("                  \n");
      out.write("                </select></td>\n");
      out.write("              <td><button type=\"submit\" value=\"Añadir\" class=\"btn btn-primary\"><span class=\"glyphicon glyphicon-plus\"></span> Añadir</button></td><td></td></tr>           \n");
      out.write("        </form>\n");
      out.write("       \n");
      out.write("        ");

 
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
        
      out.write("\n");
      out.write("        <td>\n");
      out.write("        <form method=\"get\" action=\"modificaCoche.jsp\">\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" name=\"codVeh\" value=\"");
      out.print(listado.getString("codVeh") );
      out.write("\">\n");
      out.write("          <input type=\"hidden\" name=\"matVeh\" value=\"");
      out.print(listado.getString("matVeh") );
      out.write("\">\n");
      out.write("          <input type=\"hidden\" name=\"vinVeh\" value=\"");
      out.print(listado.getString("vinVeh") );
      out.write("\">\n");
      out.write("          <input type=\"hidden\" name=\"cod_tipo\" value=\"");
      out.print(listado.getString("cod_tipo") );
      out.write("\">\n");
      out.write("          <input type=\"hidden\" name=\"cod_mod\" value=\"");
      out.print(listado.getString("cod_mod") );
      out.write("\">\n");
      out.write("\t\t\t\t\t<button type=\"submit\"  class=\"btn btn-info\"><span class=\"glyphicon glyphicon-pencil\"></span> Modificar</button>\n");
      out.write("\t\t\t\t</form>\n");
      out.write("\t\t\t\t</td>\n");
      out.write("\t\t\t\t<td>\n");
      out.write("        <form method=\"get\" action=\"BorrarCoche.jsp\">\n");
      out.write("          <input type=\"hidden\" name=\"codVeh\" value=\"");
      out.print(listado.getString("codVeh") );
      out.write("\"/>\n");
      out.write("          <button type=\"submit\" class=\"btn btn-danger\"><span class=\"glyphicon glyphicon-remove\"></span> Eliminar</button>\n");
      out.write("        </form>\n");
      out.write("        </td></tr>\n");
      out.write("        ");

          } // while   

          conexion.close();
          conexionnn.close();
         
        
      out.write("\n");
      out.write("\n");
      out.write("        </table>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"text-center\">&copy; Raúl Moreno Montiel</div>\n");
      out.write("    </div>\n");
      out.write("    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->\n");
      out.write("    <script src=\"js/jquery.min.js\"></script>\n");
      out.write("    <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("  </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
