<?php
	/**
	 * @param string $nom
	 * @param string $type
	 * @return string|boolean
	 */
	function qp($nom,$type="REQUEST") 
	{	
		switch($type)
		{
			case "REQUEST": 
			if(isset($_REQUEST[$nom]) && !($_REQUEST[$nom] == "")) 	
				return protect($_REQUEST[$nom]); 	
			break;
			case "GET": 	
			if(isset($_GET[$nom]) && !($_GET[$nom] == "")) 			
				return protect($_GET[$nom]); 
			break;
			case "POST": 	
			if(isset($_POST[$nom]) && !($_POST[$nom] == "")) 	
				return protect($_POST[$nom]); 		
			break;
			case "COOKIE": 	
			if(isset($_COOKIE[$nom]) && !($_COOKIE[$nom] == ""))
				return protect($_COOKIE[$nom]);	
			break;
			case "SESSION": 
			if(isset($_SESSION[$nom]) && !($_SESSION[$nom] == "")) 	
				return $_SESSION[$nom]; 		
			break;
			case "SERVER": 
			if(isset($_SERVER[$nom]) && !($_SERVER[$nom] == "")) 	
				return $_SERVER[$nom]; 		
			break;
		}
		return false; 
	}

	/**
	* @param string $str
	*/
	function protect($str)
	{
		if (is_array($str))
		{
			$nextTab = array();
			foreach($str as $cle => $val)
			{
				$nextTab[$cle] = addslashes($val);
			}
			return $nextTab;
		}
		else 	
			return addslashes ($str);
	}

	function redirect($url,$tabQS="")
	{
		header("Location:".$url);
		die("");
	}

	function dateFormat($date)
	{
		$dt = new DateTime($date);

		$parts = explode(" ", $date);
		if(strlen($date) > 10 && $parts[1] != "00:00:00") {
			return $dt->format('D d M Y - h:i A');
		}
		return $dt->format('D d M Y');
	}

	function dateFormatCompact($date)
	{
		$dt = new DateTime($date);
		return $dt->format('d/m/Y');
	}

	function hash_url($url){
		$url = str_replace("?","*:i:*",$url);
		$url = str_replace("&","*:a:*",$url);
		return $url;
	}

	function unhash_url($url){
		$url = str_replace("*:i:*","?",$url);
		$url = str_replace("*:a:*","&",$url);
		return $url;
	}

	function truncate($str, $width) {
		if (strlen($str) > $width)
   			$str = substr($str, 0, $width) . '...';
		return $str;
	}
