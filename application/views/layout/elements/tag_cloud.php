<div id="sl_tag_cloud">
	<div id="myCanvasContainer">
		<canvas  height="350" id="myCanvas">
			<p>Anything in here will be replaced on browsers that support the canvas element</p>
		</canvas>
	</div>
	<div id="tags">
		<ul>
			<?php foreach($data['tags'] as $index=>$value): ?>
			<li><?php echo anchor('/communities?tag='.$value['name'],$value['name'],array('class'=>'css_class')) ?></li>
			<?php endforeach ?>
		</ul>
	</div>
</div>