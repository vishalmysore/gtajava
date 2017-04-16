<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css"> 
	@import "dojo/resources/dojo.css";
	@import "dijit/tests/css/dijitTests.css";
</style>
<script type="text/javascript" src="dojo/dojo.js"></script>
<script type="text/javascript"> 
 
dojo.require("dojox.gfx");
dojo.require("dojox.gfx.move");
 
var container = null,
	surface = null,
	surface_size = null;
 
function makeCircles(){
	
	var x1 = 150, y1 = 150, x2 = 400, y2 = 400, r = 20, x3=50,y3=75,x4=50,y4=75;
		
	var line = surface.createLine({x1: x1, y1: y1, x2: x2, y2: y2}).setStroke("red"),
	     line2 = surface.createLine({x1: x1, y1: y1, x2: x3, y2: y3}).setStroke("red"),
	     line3 = surface.createLine({x1: x1, y1: y1, x2: x4, y2: y4}).setStroke("red"),
		circle1 = surface.createCircle({cx: x1, cy: y1, r: r}).setStroke("red").setFill("white"),
		circle2 = surface.createCircle({cx: x2, cy: y2, r: r}).setStroke("green").setFill("white"),
		circle3 = surface.createCircle({cx: x3, cy: y3, r: r}).setStroke("green").setFill("white");
		
	
	// circle movers
	var m1 = new dojox.gfx.Moveable(circle1),
		m2 = new dojox.gfx.Moveable(circle2),
		m3 = new dojox.gfx.Moveable(circle3);
		
	// custom event processing
	dojo.connect(m1, "onMoved", function(mover, shift){
		var o = line.getShape();
		line.setShape({x1: o.x1 + shift.dx, y1: o.y1 + shift.dy, x2: o.x2, y2: o.y2});
		var o2 = line2.getShape();
		line2.setShape({x1: o2.x1 + shift.dx, y1: o2.y1 + shift.dy, x2: o2.x2, y2: o2.y2});
	});
	dojo.connect(m2, "onMoved", function(mover, shift){
		var o = line.getShape();
		line.setShape({x1: o.x1, y1: o.y1, x2: o.x2 + shift.dx, y2: o.y2 + shift.dy});
	});
	dojo.connect(m3, "onMoved", function(mover, shift){
		var o = line2.getShape();	
		line2.setShape({x1: o.x1, y1: o.y1, x2: o.x2 + shift.dx, y2: o.y2 + shift.dy});

	});
}
 
function initGfx(){
	container = dojo.byId("gfx_holder");
	surface = dojox.gfx.createSurface(container, 900, 900);
	surface_size = {width: 900, height: 900};
 
	makeCircles();
 
	// cancel text selection and text dragging
	dojo.connect(container, "ondragstart",   dojo, "stopEvent");
	dojo.connect(container, "onselectstart", dojo, "stopEvent");
}
 
dojo.addOnLoad(initGfx);
 
</script>
 
<style type="text/css"> 
.movable { cursor: pointer; }
</style>
 
</head>
<body>
<h1>Consultants </h1>
<p>Red = Not Available ; Green = Available</p>
<div id="gfx_holder" style="width: 900px; height: 900px;"></div>
</body>
</html>
