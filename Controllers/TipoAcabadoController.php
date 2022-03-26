
<?php
    require_once($_SERVER['DOCUMENT_ROOT'] .'/casa_soniada/Models/TipoAcabado.php');
    

    class TipoAcabadoController{

        function __construct()
        {
            $this->modelObject = new TipoAcabado();
        }

        function index(){
            $result = $this->modelObject->list();
            return $result;
        }

        function edit($request){
            $idObject = $request['id'];
            $result = $this->modelObject->findById($idObject);
            return $result;
        }

        function create($request){            
            return $this->modelObject->create($this->createVarObject($request));
        }

        function update($request){
            return $this->modelObject->update($this->createVarObject($request));
        }

        function delete($id){
            return $this->modelObject->delete($id);
        }

        function show(){
        }

        function searchByText($request){
            return $this->modelObject->findByText($request);
        }

        function createVarObject($data){
            $varObject = new TipoAcabado();
            isset($data['id'])?$varObject->set("id",$data['id']):'';
            $varObject->set("nombre",$data['nombre']);
            $varObject->set("descripcion",$data['descripcion']);
            return $varObject;
        }
    }

?>