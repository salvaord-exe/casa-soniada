<?php
require_once($_SERVER['DOCUMENT_ROOT'] .'/casa_soniada/Database/dbConnection.php');

    class TipoAcabado{
        private $id;
        private $nombre;
        private $descripcion;
        private $estado;
        private $fecha_creacion;
        private $fecha_modificacion;
        private $user_modificacion;
        private $bd_connection;
        private $table_name;

        public function get($attr){
            return $this->$attr;
        }

        public function set($attr, $value){
            $this->$attr = $value;
        }

        public function __construct(){
            $this->bd_connection = new DBConnection();
            $this->table_name = "neg_tipo_acabado";
        }

        public function list(){
            $query = "select * from {$this->table_name};";
            $result = $this->get("bd_connection")->consultaRetorno($query);

            return $result;

        }

        public function findById($id){
            $query = "select * from {$this->table_name} where id like '{$id}';";
            $result = $this->get("bd_connection")->consultaRetorno($query);
            $objectReturn = $result[0];
            return $objectReturn;
            
        }

        public function create($request){
    
            $query = "insert into {$this->table_name} 
            (nombre,descripcion,fecha_creacion,fecha_modificacion,estado)
            values
            (
                '{$request->nombre}',
                '{$request->descripcion}',
                '{$this->getCurrentTimestamp()}',
                '{$this->getCurrentTimestamp()}',
                'A'
            )
            ;";
            $result = $this->get("bd_connection")->consultaRetorno($query);

            return $query;
        }

        public function collectCountries(){
            $varCatCab = new CatalogoCab();
            $oCatCab = $varCatCab->findByColumnValue("nombre_cabecera","Paises");
            $varCatPaises = new CatalogoDet();
            return $varCatPaises->collectByCabId($oCatCab[0]['id']);
        }

        public function update($request){
            $query = "
            update {$this->table_name} 
            set
            
            id = '{$request->id}',
            nombre = '{$request->nombre}',
            descripcion = '{$request->descripcion}',
            estado = 'A',
            fecha_modificacion = '{$this->getCurrentTimestamp()}'
            "
            ;
            $result = $this->get("bd_connection")->consultaRetorno($query);

            return $result;
        }

        public function delete($id){
            $query = "update {$this->table_name} set estado = 'I' where id like '{$id}'";
            return $this->get("bd_connection")->consultaRetorno($query);
        }

        public function findByText($request){
            if($request==""){
                $texToFind="recibio vacio";
            }else{
                $texToFind = "%".str_replace(" ","%",$request)."%";
            }

            $query = "
                select * from {$this->table_name} where 
                nombre_completo like '{$texToFind}' or
                direccion like '{$texToFind}' or
                email like '{$texToFind}' or
                sueldo like '{$texToFind}' or
                cargo like '{$texToFind}'
            ";

            $result = $this->get("bd_connection")->consultaRetorno($query);

            return $result;
        }

        public function getCurrentTimestamp(){
            $now = date('Y-m-d H:i:s', time());
            return $now;
        }
}



