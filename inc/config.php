<?php
session_start();
//unset($_SESSION);
// Constante pour définir la configuration de la DB
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASSWORD', 'salihin');
define('DB_DATABASE', 'webforce3');

try {
		$pdo = new PDO('mysql:host='.DB_HOST.';dbname='.DB_DATABASE.';charset=utf8', DB_USER, DB_PASSWORD);
	}
	catch (Exception $e){
		echo $e->getMessage();
	}

?>