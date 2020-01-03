<?php

include('../../banco.php');


if(isset($_POST['search'])){
 $search = $_POST['search'];

 $query = "SELECT * FROM produto WHERE nome like'%".$search."%'";
 $result = mysqli_query($con,$query);

 $response = array();
 while($row = mysqli_fetch_array($result) ){
   $response[] = array("value"=>$row['id'],"label"=>$row['nome']);
 }

 echo json_encode($response);
}

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

