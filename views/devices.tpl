<div id="rows"></div>
<div id="loading"></div>

<!-- Placed at the end of the document so the pages load faster -->
<script src="static/js/jquery-1.8.0.min.js"></script>
<script src="static/js/jquery-ui-1.8.23.custom.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/helpers.js"></script>
<script>
// URLs
var URL_BASE = 'http://localhost:8084/json/';
var DEVICES_URL = URL_BASE + 'devices/list';
var DEVICE_DIM_URL = URL_BASE + 'device/dim';
var DEVICE_ON_URL = URL_BASE + 'device/turnOn';
var DEVICE_OFF_URL = URL_BASE + 'device/turnOff';

// Constants
var SLIDER_ID_PREFIX = 'slider-';
var TOGGLE1_PREFIX = 'toggleOption1-';
var TOGGLE2_PREFIX = 'toggleOption2-';
var ON_OFF = 3;
var DIM = 16;

var data = {"device": [{"statevalue": "0", "methods": 19, "editable": 1, "state": 2, "client": 1, "online": 1, "type": "device", "id": 2, "clientName": "TellProx", "name": "Spare Room"}, {"statevalue": "0", "methods": 19, "editable": 1, "state": 2, "client": 1, "online": 1, "type": "device", "id": 3, "clientName": "TellProx", "name": "Bedroom"}, {"statevalue": "1", "methods": 3, "editable": 1, "state": 2, "client": 1, "online": 1, "type": "device", "id": 4, "clientName": "TellProx", "name": "Bedroom Speakers"}, {"statevalue": "0", "methods": 3, "editable": 1, "state": 2, "client": 1, "online": 1, "type": "device", "id": 5, "clientName": "TellProx", "name": "Bedroom TV Lights"}, {"statevalue": "0", "methods": 3, "editable": 1, "state": 2, "client": 1, "online": 1, "type": "device", "id": 7, "clientName": "TellProx", "name": "Lounge Cabinet Spotlights"}, {"statevalue": "0", "methods": 3, "editable": 1, "state": 2, "client": 1, "online": 1, "type": "device", "id": 8, "clientName": "TellProx", "name": "Lounge Sofa Spotlights"}, {"statevalue": "0", "methods": 19, "editable": 1, "state": 2, "client": 1, "online": 1, "type": "device", "id": 9, "clientName": "TellProx", "name": "Lounge main light"}, {"statevalue": "0", "methods": 19, "editable": 1, "state": 2, "client": 1, "online": 1, "type": "device", "id": 10, "clientName": "TellProx", "name": "Hallway main light"}, {"statevalue": "", "methods": 19, "editable": 1, "state": 2, "client": 1, "online": 1, "type": "group", "id": 18, "clientName": "TellProx", "name": "TestGroup"}, {"statevalue": "", "methods": 3, "editable": 1, "state": 2, "client": 1, "online": 1, "type": "device", "id": 19, "clientName": "TellProx", "name": "dummy"}, {"statevalue": "", "methods": 0, "editable": 1, "state": 2, "client": 1, "online": 1, "type": "device", "id": 22, "clientName": "TellProx", "name": "test8"}]}

$(document).ready(function() {
	
	//loadItems(data);
	$.ajax({
		url: DEVICES_URL,
		data: { 'supportedMethods': 19 },
		dataType: "jsonp",
		crossDomain: true,
		success: function(data) {
			loadItems(data);
		}
	});
});

function div()   { return $(document.createElement('div'));   }
function h2()    { return $(document.createElement('h2'));    }
function label() { return $(document.createElement('label')); }
function radio() { return $(document.createElement('input')).attr({type: 'radio' }); }

function createItemCell(name) {
	// Create elements
	var item = {
		cell: div().addClass('span4'),
		header: div().addClass('palette palette-info').
			append(h2().text(name)),
		body: div().addClass('palette palette-info-dark')
	};

	item.header.appendTo(item.cell);
	item.body.appendTo(item.cell);
	
	return item;
}

function createSlider(parent, itemId, startValue) {
	var sliderId = SLIDER_ID_PREFIX + itemId;
	var slider = div().attr({id: sliderId}).addClass('ui-slider');
	parent.append(slider);
	slider.slider({
		min: 0,
		max: 255,
		value: startValue,
		orientation: "horizontal",
		range: "min",
		change: function(event, ui) {
			sliderId = $(this).attr('id').substr(SLIDER_ID_PREFIX.length)
			$.post(DEVICE_DIM_URL, {id: sliderId, level: ui.value})
		}
	});
}

function createToggle(parent, id, state) {
	var t1Name = TOGGLE1_PREFIX + id;
	var t2Name = TOGGLE2_PREFIX + id;
	var isOn = state == "1"
	
	var turnOn = function(item) {
		var itemId = item.attr('id').substr(TOGGLE1_PREFIX.length)
		$.post(DEVICE_ON_URL, {id: itemId});
	}
	
	var turnOff = function(item) {
		var itemId = item.attr('id').substr(TOGGLE2_PREFIX.length)
		$.post(DEVICE_OFF_URL, {id: itemId});
	}
	
	var toggle = div().addClass('toggle' + (!isOn ? ' toggle-off' : ''))
		.append(label().text("ON").attr({'class': 'toggle-radio','for': t2Name}))
		.append(radio()
			.attr({
				id: t1Name,
				name: 'toggleOptions',
				checked: isOn
			})
			.click(function() { turnOn($(this)); toggle.toggleClass("toggle-off"); })
		)
		.append(label().text("OFF").attr({'class': 'toggle-radio','for': t1Name}))
		.append(radio()
			.attr({
				id: t2Name,
				name: 'toggleOptions',
				checked: !isOn
			})
			.click(function() { turnOff($(this)); toggle.toggleClass("toggle-off"); })
		)
	
	parent.append(toggle);
}

function loadItems(data) {
	var devices = data['device']
	var itemCount = 0;
	var rowContainer = $('#rows');
	//rowContainer.hide();
	devices.sort(sort_by('name', true, function(a){return a.toUpperCase()}));
	
	// Loop through all items
	$.each(devices, function(i, v) {
		if (itemCount % 3 == 0) {
			// Add row
			currentRow = div().addClass('row-fluid');
			currentRow.appendTo(rowContainer);
		}
		
		// See if it supports dimming
		var dimmable = ((v.methods & DIM) == DIM);
		
		var item = createItemCell(v.name);
		currentRow.append(item.cell);
		
		if (dimmable)
			createSlider(item.body, v.id, v.statevalue)
		else
			createToggle(item.body, v.id, v.state)
		
		itemCount++;
	});
	
	$('#loading').hide()
	rowContainer.show();
}
</script>
%rebase layout title='Devices'