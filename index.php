<!DOCTYPE html>
<html>
<head>
    <title>Búsqueda de Amigos</title>
    <!-- Agrega los enlaces a Bootstrap y jQuery -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <div class="container">
        <!--esta es la interfaz de nombre -->
        <h3>Búsqueda por Nombre:</h3>
        <input type="text" class="form-control" id="nombre" placeholder="Nombre del amigo">
        <br>
        <button class="btn btn-primary" onclick="buscarPorNombre()">Buscar</button>
        <br><br>
        <!-- esto es para mostrar la tabla de resultados por nombre -->
        <div id="resultadosNombre"></div>

        <!-- esta es la interfaz para buscar amigos segun tipo de la mascota -->
        <h3>Búsqueda por Mascota:</h3>
        <input type="text" class="form-control" id="mascota" placeholder="Tipo de mascota, ejem: 'chiguagua'">
        <br>
        <button class="btn btn-primary" onclick="buscarPorMascota()">Buscar</button>
        <br><br>
        <!-- esto es para mostrar los resultados de los amigos que coicidan en mascotas -->
        <div id="resultadosMascota"></div>

        <!-- esta es la interfaz segun el lugar -->
        <h3>Búsqueda por Lugar:</h3>
        <input type="text" class="form-control" id="lugar" placeholder="Lugar de residencia">
        <br>
        <button class="btn btn-primary" onclick="buscarPorLugar()">Buscar</button>
        <br><br>
        <!-- se muestran los resultados -->
        <div id="resultadosLugar"></div>
    </div>

    <script>
        function buscarPorNombre() {
            var nombre = document.getElementById("nombre").value;
            $.ajax({
                type: 'POST',
                url: 'buscar.php',
                data: { tipo: 'nombre', valor: nombre },
                success: function(data) {
                    $('#resultadosNombre').html(data);
                }
            });
        }

        function buscarPorMascota() {
            var mascota = document.getElementById("mascota").value;
            $.ajax({
                type: 'POST',
                url: 'buscar.php',
                data: { tipo: 'mascota', valor: mascota },
                success: function(data) {
                    $('#resultadosMascota').html(data);
                }
            });
        }

        function buscarPorLugar() {
            var lugar = document.getElementById("lugar").value;
            $.ajax({
                type: 'POST',
                url: 'buscar.php',
                data: { tipo: 'lugar', valor: lugar },
                success: function(data) {
                    $('#resultadosLugar').html(data);
                }
            });
        }
    </script>
</body>
</html>
