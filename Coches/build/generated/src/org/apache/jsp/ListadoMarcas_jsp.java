package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Connection;

public final class ListadoMarcas_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>Formualrio</title>\n");
      out.write("  </head>\n");
      out.write("  <body>\n");
      out.write("    <h1>Listado de Marcas</h1>\n");
      out.write("    ");

      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coches", "root", "root");
      Statement s = conexion.createStatement();

      ResultSet listado = s.executeQuery("SELECT * FROM Marca");
    
      out.write("\n");
      out.write("    <form action=\"/action_page.php\" id=\"formulairo\">\n");
      out.write("      Matricula:<input type=\"text\" name=\"mat\"><br>\n");
      out.write("      Nº Chasis:<input type=\"text\" name=\"vin\"><br>\n");
      out.write("      \n");
      out.write("      <select name=\"carlist\" form=\"formulario\">\n");
      out.write("        ");

        while (listado.next()) {
        out.println("<option value='" + listado.getString("codMarc")  + "'>" + listado.getString("NomMarca") + "</option>");
        }
        
      out.write("\n");
      out.write("      \n");
      out.write("      </select>\n");
      out.write("                <br>\n");
      out.write("       \n");
      out.write("                \n");
      out.write("                \n");
      out.write("    ");

    
      Connection conexionn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coches", "root", "root");
      Statement q = conexion.createStatement();

      ResultSet listadoo = q.executeQuery("SELECT * FROM Modelo");
      
      out.write("\n");
      out.write("\n");
      out.write("      <select name=\"carlist\" form=\"formulario\">\n");
      out.write("        ");

        while (listadoo.next()) {
        out.println("<option value='" + listadoo.getString("codMod")  + "'>" + listadoo.getString("nonMod") + "</option>");
        }
        
      out.write("\n");
      out.write("      </select>\n");
      out.write("       ");
 conexion.close(); 
      out.write("\n");
      out.write("       ");
 conexionn.close(); 
      out.write("\n");
      out.write("      <br>\n");
      out.write("      <input type=\"submit\">\n");
      out.write("    </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
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
