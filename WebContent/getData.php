<?php
//echo '[{ "text":"abcedede" ,color:"white",size:1,position:0,time:12},{ "text":"1234" ,color:"green",size:1,position:0,time:23}]';
//[{ "text":"�ҵ�����������","color":"#ffffff","size":"1","position":"0","time":3}{ "text":"�Ĵ�جججج����","color":"#ffffff","size":"1","position":"0","time":56}{ "text":"�ҵ� ","color":"#ffffff","size":"1","position":"0","time":143}{ "text":"������","color":"#ffffff","size":"1","position":"0","time":155}]
include_once('connect.php');

$json = '[';
$query = mysql_query("select * from danmu");
while($row=mysql_fetch_array($query)){
	$json .= $row['content'].',';
}
$json = substr($json,0,-1);
$json .= ']';
echo $json;
?>