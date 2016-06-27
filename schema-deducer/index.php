<?php
// generate schema from document instance 
define('BASE_PATH', 'http://localhost/ditax.ml/');
define('APP_PATH', 'http://localhost/ditax.ml/lwd/');

$themesDir = 'Themes';
$themeName = 'Basic';
$contentDir = 'Content';
$groupName= 'lwd';
$offset = '../';

require_once('../common/setup.php');

//register applicable hooks

$xmlfile = 'test.xml';
$xslfile = 'test2ddl.xsl';
$srcfile = 'home.html';

ob_start();
	// play back the intro documentation
	echo file_get_contents(contentPath().$srcfile);

if (!isset($_POST['hsubmit'])) {
	$xml= file_get_contents(contentPath().$xmlfile);
	$xsl = file_get_contents(contentPath().$xslfile);
	show_input($xml,$xsl);
} else {
	$xml = $_POST['editor'];
	$xsl = $_POST['transform'];
	show_input($xml,$xsl);
	show_output($xml, $xsl);
}

function show_input($xml,$xsl) {
	echo '<h2>Test source and Transform code:</h2>';
	input_form($xml,$xsl);
}

function show_output($xml,$xsl) {
	require_once(appPath().'light_XML.php');
	$topic = xform_stream2('<body>'.$xml.'</body>', $xsl);
	echo '<h2>Parsed stream</h2>';
	echo '<div class="well">';
	echo $topic;
	echo '</div>';
}

$post = ob_get_contents();
ob_end_clean();

require_once(themePath().'defs/template.php');


function input_form($xml,$xsl) {
global $htopic,$htask;
?>
<form name="hditaform" method="post" action="">
	<b>Paste XDITA template source here:</b><br/>
	<textarea name="editor" width="100%" rows="20" cols="80" onkeydown="insertTab(this, event);"><?php echo $xml;?></textarea>
	<br/>
	<b>Paste XSL here:</b><br/>
	<textarea name="transform" width="100%" rows="20" cols="80" onkeydown="insertTab(this, event);"><?php echo $xsl;?></textarea>
	<br/>
	<input type="submit" value="Process updates" name="hsubmit"/>
</form>
<?php
}

