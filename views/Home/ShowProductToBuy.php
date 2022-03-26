<?php
include("../Templates/header.php");
require_once("../../Controllers/ProductoController.php");
?>

<?php

$object = new ProductoController();

if (isset($_GET) && !isset($_GET['action'])) {
    $varObject = $object->findByIdWhitManufacturer($_GET['id']);
} else {
    $varObject = $object->findByIdWhitManufacturer($_GET['id_producto']);
}

?>
<main class="container ">
    <div class="row mb-2 mt-4 ">
        <div class="col-md-12">
            <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                <div class="col-md-7 d-none d-lg-block">
                    <div class="border-bottom border-secondary">
                        <?php echo '<div class="card-img-top" style="height: 30rem; background-image: url(\'' . $urlServer . $varObject['dir_imagen'] . '\'); background-size:cover; background-position: center;"></div>'; ?>
                    </div>
                </div>
                <div class="col p-4 d-flex flex-column position-static">
                    <h3 class="mb-0"><?php echo $varObject['nombre'] ?></h3>
                    <h5 class="mb-1 text-muted">Por: <?php echo $varObject['nombre_fabric_orig'] ?> </h5>
                    <p class="fs-5 card-text mb-auto mt-3"><?php echo $varObject['descripcion'] ?></p>
                    <div class="row">
                        <div class="col">

                            <p class="card-text fs-4"><span class="bi-house-fill"></span> Cuartos:
                                <?php echo  $varObject['cant_habitaciones'] ?> </p>
                            <p class="card-text fs-4"><span class="bi-house-fill"></span> Superficie:
                                <?php echo  $varObject['superficie'] ?> mts2 </p>
                        </div>
                        <div class="col">
                            <p class="card-text fs-4">$ <span id="precio-producto"><?php echo  $varObject['precio'] ?></span> </p>
                            <p class="card-text fs-4"><span class="bi-star-fill" style="color: #fcbe03;"></span>
                                <?php echo  $varObject['calificacion'] ?>/5 </p>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
    <div class="row mb-2 mt-4 ">
        <div class="col-md-7">
            <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">

                <div class="col p-4 d-flex flex-column position-static">
                    <h3 class="mb-0">¿Desea acabados?</h3>
                    <table class="table table-hover mt-2">
                        <thead>
                            <tr class="">
                                <th>Id</th>
                                <th>Tipo Acabado</th>
                                <th>Acabado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            

                        </tbody>
                    </table>
                </div>

            </div>
        </div>
        <div class="col-md-5">
            <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">

                <div class="col p-4 d-flex flex-column position-static">
                    <h3 class="mb-0">Resumen: </h3>
                    <form action="CarritoCompra.php" method="post">

                        <p class="fs-4 mt-3"><span class="fs-4">Precio Casa:</span> $<?php echo  $varObject['precio'] ?><span id="sub-casa"></span> </p>
                        <p class="fs-4 mt-3"><span class="fs-4">Precio Acabados:</span> $<span id="sub-acabados"></span> </p>
                        <div class="">
                            <script>
                                document.write('<a class="btn btn-secondary" href="' + document.referrer +
                                    '">Cancelar</a>');
                            </script>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</main>

<script src="../../Assets/js/ShowProductoToByJs.js"></script>

<?php include("../Templates/footer.php") ?>