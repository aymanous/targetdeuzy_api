<?php
	include("config.php");
	include("SQL.pdo.php");

	function getGenericRows($table,$columns,$conditions){
		$SQL="SELECT $columns FROM $table $conditions";
		return parcoursRs(SQLSelect($SQL));
    }
    
    function getGenericRow($table,$columns,$conditions){
		$SQL="SELECT $columns FROM $table $conditions";
		return parcoursRs(SQLSelect($SQL))[0];
    }

    function insertGenericRow($table,$columns,$values)
	{
		$SQL = "INSERT INTO `$table`($columns) VALUES($values)";
		return SQLInsert($SQL);	
    }

    function updateGenericRow($table,$colonne,$valeur,$conditions="")
	{
		$SQL = "UPDATE `$table` SET `$colonne`='$valeur' $conditions";
		return SQLGetChamp($SQL);
	}
    
    function callProcedureRows($procedureName, $parameters){
		$SQL="CALL $procedureName ($parameters)";
		return parcoursRs(SQLSelect($SQL));
    }
