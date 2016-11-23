<?php echo doctype('html5')."\n" ?>
<html>
<head>
	<?php echo meta($meta); ?>
	<title><?php echo $title_for_layout; ?></title>
	<link href="/images/favicon.ico" type="image/x-icon" rel="shortcut icon"/>	
	<?php echo $style_for_layout."\n"; ?>
	<meta content="" name="description" />
	<meta content="" name="keywords" />
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">	
  <meta name="author" content="sleeping-lion" />
	<!--[if IE]>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<![endif]-->
</head>
<body>
	<?php echo $Layout->element('header') ?>
	<?php echo $Layout->element('aside') ?>
	<div id="mom">
		<div id="main" class="container">
			<div id="s-search_form_layer">
				<?php echo $Layout->element('search') ?>
			</div>
			<div class="sub_main">
				<?php echo $Layout->element('message') ?>
				<?php echo $contents_for_layout; ?>
			</div>
		</div>
	</div>
	<?php // echo $Layout->element('footer') ?>
	<?php echo "\n".$script_for_layout."\n" ?>
	<?php echo $Layout->element('sns') ?>
	<div id="div_black">&nbsp;</div>
</body>
</html>