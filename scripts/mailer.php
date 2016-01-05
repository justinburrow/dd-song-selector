<?php

$_POST = json_decode(file_get_contents('php://input'), true);

$to = "justinburrow@gmail.com";
$client = $_POST['client'];
$from = $client['email'];
$name = $client['name'];
$songs = $_POST['songs'];

$subject = "D+D Song List for " . $name;

$songList = '';

foreach($songs as $song) {
  $songList .=$song['title'] . ' - ' . $song['artist'] . "\n";
}

$message = 'Client:' . "\n" . $name . "\n" . $from . "\n\n" . 'Song List:' . "\n" . $songList;

$headers = "From:" . $from;
mail($to,$subject,$message,$headers);

?>