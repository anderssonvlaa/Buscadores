<?php
$tipo = $_POST['tipo'];
$valor = $_POST['valor'];

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_agenda";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    //consultas
    if ($tipo === 'nombre') {
        $stmt = $conn->prepare("SELECT * FROM amigos WHERE primer_nombre = :valor OR segundo_nombre = :valor");
    } elseif ($tipo === 'mascota') {
        $stmt = $conn->prepare("SELECT amigos.primer_nombre, amigos.primer_apellido, amigos.pais, mascotas.tipo, mascotas.nombre FROM amigos JOIN mascotas ON amigos.identificion = mascotas.identificacion WHERE mascotas.tipo = :valor");
    } elseif ($tipo === 'lugar') {
        $stmt = $conn->prepare("SELECT * FROM amigos WHERE pais = :valor OR canton = :valor OR distrito = :valor");
    }

    $stmt->bindParam(':valor', $valor);
    $stmt->execute();
    $result = $stmt->fetchAll();

    //tablas que se muestran segun la busqueda
    if (count($result) > 0) {
        if ($tipo === 'mascota') {
            echo "<div class='table-responsive'>";
            echo "<table class='table table-striped table-bordered'>";
            echo "<tr><th>Primer Nombre</th><th>Primer Apellido</th><th>País</th><th>Tipo de Mascota</th><th>Nombre de Mascota</th></tr>";
            foreach ($result as $row) {
                echo "<tr>";
                echo "<td>" . $row['primer_nombre'] . "</td>";
                echo "<td>" . $row['primer_apellido'] . "</td>";
                echo "<td>" . $row['pais'] . "</td>";
                echo "<td>" . $row['tipo'] . "</td>";
                echo "<td>" . $row['nombre'] . "</td>";
                echo "</tr>";
            }
            echo "</table>";
            echo "</div>";
        } else {
        echo "<div class='table-responsive'>";
        echo "<table class='table table-striped table-bordered'>";
        echo "<tr><th>Identificación</th><th>Primer Nombre</th><th>Segundo Nombre</th><th>Primer Apellido</th><th>Segundo Apellido</th><th>Correo</th><th>Nacimiento</th><th>Edad</th><th>País</th><th>Cantón</th><th>Distrito</th></tr>";
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>" . $row['identificion'] . "</td>";
            echo "<td>" . $row['primer_nombre'] . "</td>";
            echo "<td>" . $row['segundo_nombre'] . "</td>";
            echo "<td>" . $row['primer_apellido'] . "</td>";
            echo "<td>" . $row['segundo_apellido'] . "</td>";
            echo "<td>" . $row['correo'] . "</td>";
            echo "<td>" . $row['nacimiento'] . "</td>";
            echo "<td>" . $row['edad'] . "</td>";
            echo "<td>" . $row['pais'] . "</td>";
            echo "<td>" . $row['canton'] . "</td>";
            echo "<td>" . $row['distrito'] . "</td>";
            echo "</tr>";
        }
        echo "</table>";
        echo "</div>";
    }
    } else {
        echo "No se encontraron resultados.";
    }


} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn = null;
?>
