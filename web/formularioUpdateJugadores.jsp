<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <link rel="shortcut icon" href="favicon/faviconbola.ico" type="image/x-icon">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script language="javascript" type="text/javascript">
            
            function enviar(pagina) {
                document.equipos.action = pagina;
                document.equipos.submit();
            }
        </script>
    </head>
    <body id="jugadores"> 
        <div id="stylized" class="myform">
            <h1>Datos del equipo</h1>
            <p>Datos personales:</p>
            <form name="form" method="get" action="updateJugadores.jsp" onsubmit="return validar()">
                <label>Codigo<input type="text" name="numeroID"/></label><br/><br/>
                <label>Nombre<input type="text" name="nombre"/></label><br/><br/>
                <label>Equipo <select id="equipo" name ="codEquipo" onchange="quitarError(`equipo`, `errorEquipo`)">
                    <option value="0">--Elige nombre</option>
                    <option value="1111">Real Madrid</option>
                    <option value="1112">Barcelona</option>
                    <option value="1113">Atlético de Madrid</option>
                    <option value="1114">Valéncia</option>
                    <option value="1115">Athletic Club</option>
                    <option value="1116">Sevilla</option>
                    <option value="1117">Espanyol</option>
                    <option value="1118">Real Sociedad</option>
                    <option value="1119">Real Zaragoza</option>
                    <option value="1120">Betis</option>
                    <option value="1121">Deportivo de la Coruña</option>
                    <option value="1122">Celta de Vigo</option>
                    <option value="1123">Valladoid</option>
                    <option value="1124">Racing de Santander</option>
                    <option value="1125">Sporting de Gijón</option>
                    <option value="1126">Osasuna</option>
                    <option value="1127">Real Oviedo</option>
                    <option value="1128">Mallorca</option>
                    <option value="1129">Las Palmas</option>
                    <option value="1131">Málaga</option>
                   </select></label><br/>
                <input type="submit" value="Aceptar">
            </form>
            <form name="equipos" action="" method="post">
                <input class="btn btn-sm btn-dark" type="button" value="Volver a equipos" onclick="enviar('NumeroJugadores.jsp')">
                <div class="spacer"></div>
            </form>

        </div>
    </body>
</html>
