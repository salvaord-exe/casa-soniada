<?php

require_once("../../Controllers/TipoAcabadoController.php");
$object = new TipoAcabadoController();

if (isset($_GET['action']) && $_GET['action'] == "create") {
    $result = $object->create($_REQUEST);
    header("Location: ListTipoAcabado.php?action=list");
    die();
}

if (isset($_GET['action']) && $_GET['action'] == "show") {
    $result = $object->show();
}

if (isset($_GET['action']) && $_GET['action'] == "edit") {
    $result = $object->show();
    $varObject = $object->edit($_REQUEST);
    $formAction = 'action="?action=update&id=' . $varObject['id'] . '"';
} else {
    $formAction = 'action="?action=create"';
}

if (isset($_GET['action']) && $_GET['action'] == "update") {
    $result = $object->update($_REQUEST);
    //var_dump($result);
    header("Location: ListTipoAcabado.php?action=list");
    die();
}



include("../Templates/header.php");
?>

<main class="container">
    <form <?php echo $formAction ?> enctype="multipart/form-data" method="post">
        <div class="card mt-2">
            <div class="card-header d-flex justify-content-between bg-dark">
                <h3 class="text-white">Tipo Acabado</h3>
                <div class="d-flex justify-content-between">
                    <input class="btn btn-success" type="submit" value="Guardar Tipo Acabado" name="guardar_TipoAcabado">
                    <a class="btn btn-danger" href="ListTipoAcabado.php?action=list">Cancelar</a>
                </div>
            </div>
            <div class="card-body">

                <div class="row">
                    <div class="col-md-6 mt-1">
                        <div class="form-group col mt-1">
                            <label for="nombre">Nombre de Casa:</label>
                            <input type="text" class="form-control mt-1" id="nombre" name="nombre" <?php echo (isset($varObject)) ? 'value="' . $varObject['nombre'] . '"' : ''; ?> required>
                        </div>
                        <div class="form-group col mt-1">
                            <label for="fecha_creacion">Fecha de Creación:</label>
                            <input type="datetime" class="form-control mt-1" id="fecha_creacion" name="fecha_creacion" <?php echo (isset($varObject)) ? 'value="' . $varObject['fecha_creacion'] . '"' : ''; ?> required disabled>
                        </div>
                        <div class="form-group col mt-1">
                            <label for="fecha_modificacion">Ult Fecha Modificación:</label>
                            <input type="datetime" class="form-control mt-1" id="fecha_modificacion" name="fecha_modificacion" <?php echo (isset($varObject)) ? 'value="' . $varObject['fecha_modificacion'] . '"' : ''; ?> required disabled>
                        </div>
                    </div>


                    <div class="form-group col-md-6 mt-1">
                        <label for="descripcion">Descripcion:</label>
                        <textarea class="form-control mt-1" id="descripcion" name="descripcion" rows="7" required><?php echo (isset($varObject)) ? $varObject['descripcion'] : ''; ?></textarea>
                    </div>








                </div>
            </div>
        </div>
    </form>
</main>


<?php
include("../Templates/footer.php")
?>