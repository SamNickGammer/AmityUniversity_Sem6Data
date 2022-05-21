<?php
if($_POST["password"]) {
mail("john@johndoe.com", "Here is the sample subject line",
$_POST["Insert Your Message"]. "From: jane@janedoe.com");
}
?>