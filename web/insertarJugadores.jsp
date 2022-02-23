<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="styles.css"/>
    <link rel="shortcut icon" href="favicon/faviconbola.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <script language="javascript" type="text/javascript">
        function enviar(pagina){
        document.jugador.action = pagina;
        document.jugador.submit();
        }
</script>
    <title>Jugadores</title>
  </head>
  <body id="jugadores">
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/futbol","root", "");
      Statement s = conexion.createStatement();
      request.setCharacterEncoding("UTF-8");
      
      String consultaNumEquipo = "SELECT * FROM jugadores WHERE numeroID="
                                + Integer.valueOf(request.getParameter("numeroID"));      
      
      ResultSet numeroDeEquipos = s.executeQuery(consultaNumEquipo);
      numeroDeEquipos.last();
      
      if (numeroDeEquipos.getRow() != 0) {
        out.println("Lo siento, no se ha podido dar de alta, ya existe un jugador con el número "
                    + Integer.valueOf(request.getParameter("numeroID") + "."));
      } else {
        String insercion = "INSERT INTO jugadores VALUES (" + Integer.valueOf(request.getParameter("numeroID"))
                           + ", '" + request.getParameter("nombre")
                           + "', " + request.getParameter("equipo")
                           + ")";
        s.execute(insercion);
        out.println("Jugador dado de alta correctamente");
      }
      conexion.close();
    %>
<form name="jugador" action="" method="post">
    <input class="btn btn-sm btn-dark" type="button" value="Dar de alta otro jugador" onclick="enviar('jugadores.jsp')">
</form>
  </body>
</html>