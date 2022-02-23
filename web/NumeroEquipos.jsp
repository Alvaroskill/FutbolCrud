<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="favicon/faviconbola.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script language="javascript" type="text/javascript">

        function enviar(pagina){
        document.nombreDelFormulario.action = pagina;
        document.nombreDelFormulario.submit();
}
</script>
  </head>
  <body id="equipos">
   <form name="inicio" action="" method="post">
        <input class="btn btn-sm btn-dark" type="button" value="Inicio" onclick="enviar('principal.jsp')">
   </form>
   <form name="nombreDelFormulario" action="" method="post">
        <input class="btn btn-sm btn-dark" type="button" value="Dar de alta" onclick="enviar('equipos.jsp')">
   </form>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/futbol","root", "");
      Statement s = conexion.createStatement();
      ResultSet listado = s.executeQuery ("SELECT * FROM equipos");
    %>
    <table>
      <tr><th>Código</th><th>Nombre</th><th>Liga</th><th>Localidad</th>
    <%
      while (listado.next()) {
          out.println("<tr><td>");
          out.println(listado.getString("codEquipo") + "</td>");
          out.println("<td>" + listado.getString("nombre") + "</td>");
          out.println("<td>" + listado.getString("liga") + "</td>");
          out.println("<td>" + listado.getString("localidad") + "</td>");
    %>
      <td>
        
      <form method="get" action="deleteEquipos.jsp">
        <input type="hidden" name="codigo" value="<%=listado.getString("codEquipo") %>"/>
        <input class="btn btn-sm btn-dark" type="submit" value="Eliminar">
      </form>
        
       <form method="get" action="formularioUpdateEquipos.jsp">
        <input type="hidden" name="codigo" value="<%=listado.getString("codEquipo") %>"/>
        <input class="btn btn-sm btn-dark" type="submit" value="Modificar">
      </form>
    </tr>
    <%
      } // while   
      conexion.close();
     %>
    </table>
  </body>
</html>