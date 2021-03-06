<div id="rows">
	<div class="row-fluid">
		<div class="span2" id="apiList"></div>
		<div class="span7">
			<div id="description">
			Welcome to the API Explorer. Here you can test live calls to the API-server.
			</div>
			<div id="apiSpecifics" style="display:none">
			
				<br/>
				
				<form>
				<div id="inputs"></div>
				
				<br/>
				
				<div id="response">			  
					<label class="radio checked">
						<span class="icons"><span class="first-icon fui-radio-unchecked"></span><span class="second-icon fui-radio-checked"></span></span><input type="radio" name="outputFormat" id="optionsRadios1" value="json" data-toggle="radio" checked>
						JSON
					</label>
					<label class="radio">
						<span class="icons"><span class="first-icon fui-radio-unchecked"></span><span class="second-icon fui-radio-checked"></span></span><input type="radio" name="outputFormat" id="optionsRadios2" value="xml" data-toggle="radio">
						XML
					</label>
					<br/>
					<input type="submit" class="btn btn-large btn-primary" name="post" value="Post" id="post" />
					<input type="submit" class="btn btn-large btn-primary" name="get" value="Get" id="get" />
				</div>
				</form>
				
				<br/>
				
				
				<div class="palette palette-peter-river" style="overflow: auto; overflow-y: hidden;">
					<code id="output" style="display:block; white-space:pre; color: #000; background-color: #f7f7f9; border-width: 0">Output
					</code>
				</div>
			</div>
		</div>
		<div class="span3" id="itemList">
		<h4>Clients</h4>
		399371 - newname
		</div>
	</div>

<!-- Placed at the end of the document so the pages load faster -->
<script src="static/js/jquery-1.8.3.min.js"></script>
<script src="static/js/jquery-ui-1.8.23.custom.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/bootstrap-switch.js"></script>
<script src="static/js/flatui-radio.js"></script>
<script src="static/js/helpers.js"></script>
<script>
	data =
	[
		{
			title : 'Clients',
			items : [
				{
					title: 'clients/list',
					description: 'Returns a list of all clients associated with the current user.'
				}
			]
		},
		{
			title : 'Client',
			items : [
				{
					title: 'client/info',
					description: 'Returns information about a specific client.',
					inputs: [
						{ title: 'id', description: 'The id of the client', type: 'text' },
						{ title: 'uuid',
						  description: '(optional) An optional uuid for a client. By specifying the uuid, info about a non registered client can be fetched', type: 'text' },
						{ title: 'code',
						  description: '(optional) Not used. Included for backwards compatibility with TellStick Net only', type: 'text' },
						{ title: 'extras',
						  description: '(optional) A comma-delimited list of extra information to fetch for each returned client. Currently supported fields are: coordinate, suntime, timezone and tzoffset', type: 'text' }
					]
				}
			]
		},
		{
			title : 'Devices',
			items : [
				{
					title: 'devices/list',
					description: 'Returns a list of all devices associated with the current user.',
					inputs: [
						{ title: 'supportedMethods', description: 'The methods supported by the calling application', type: 'text' },
						{ title: 'extras', description: '(optional) A comma-delimited list of extra information to fetch for each returned device. Currently supported fields are: coordinate, timezone and tzoffset.', type: 'text' }
					]
				}
			]
		},
		{
			title : 'Device',
			items : [
				{
					title: 'device/toggle',
					description: 'Toggles a device on or off',
					inputs: [
						{ title: 'id', description: 'The device id', type: 'text' }
					]
				},
				{
					title: 'device/add',
					description: 'Adds a device',
					inputs: [
						{  }
					]
				},
				{
					title: 'device/info',
					description: 'Retrieve information about a given device',
					inputs: [
						{ title: 'id', description: 'The device id', type: 'text' }
					]
				},
				{
					title: 'device/command',
					description: 'Requests a command on a given device',
					inputs: [
						{ title: 'id', description: 'The device id', type: 'text' },
						{ title: 'method', description: '', type: 'text' },
						{ title: 'value', description: '', type: 'text' }
					]
				},
				{
					title: 'device/bell',
					description: '',
					inputs: [
						{ title: 'id', description: 'The device id', type: 'text' }
					]
				},
				{
					title: 'device/dim',
					description: '',
					inputs: [
						{ title: 'id', description: 'The device id', type: 'text' }
					]
				},
				{
					title: 'device/down',
					description: '',
					inputs: [
						{ title: 'id', description: 'The device id', type: 'text' }
					]
				},
				{
					title: 'device/learn',
					description: '',
					inputs: [
						{ title: 'id', description: 'The device id', type: 'text' }
					]
				},
				{
					title: 'device/remove',
					description: '',
					inputs: [
						{ title: 'id', description: 'The device id', type: 'text' }
					]
				},
				{
					title: 'device/stop',
					description: '',
					inputs: [
						{ title: 'id', description: 'The device id', type: 'text' }
					]
				},
				{
					title: 'device/turnon',
					description: '',
					inputs: [
						{ title: 'id', description: 'The device id', type: 'text' }
					]
				},
				{
					title: 'device/turnoff',
					description: '',
					inputs: [
						{ title: 'id', description: 'The device id', type: 'text' }
					]
				},
				{
					title: 'device/up',
					description: '',
					inputs: [
						{ title: 'id', description: 'The device id', type: 'text' }
					]
				},
				{
					title: 'device/setParameter',
					description: '',
					inputs: [
						{ title: 'id', description: 'The device id', type: 'text' }
					]
				},
				{
					title: 'device/setName',
					description: '',
					inputs: [
						{ title: 'id', description: 'The device id', type: 'text' }
					]
				},
				{
					title: 'device/setModel',
					description: '',
					inputs: [
						{ title: 'id', description: 'The device id', type: 'text' }
					]
				},
				{
					title: 'device/setProtocol',
					description: '',
					inputs: [
						{ title: 'id', description: 'The device id', type: 'text' }
					]
				}
			]
		},
		{
			title: 'Config',
			items : [
				{
					title: 'config/set',
					inputs: [
						{ title: 'item', type: 'text' },
						{ title: 'value', type: 'text' }
					]
				},
				{
					title: 'config/get',
					inputs: [
						{ title: 'item', type: 'text' }
					]
				},
				{
					title: 'config/getall'
				},
			]
		}
	]
	
	var apiMap = {};
	var selectedMethod;
	
	var apiList = $('#apiList');
	var description = $('#description');
	var inputs = $('#inputs');
	var output = $('#output');
	var getWindow;
		
	$(document).ready(function() {
		for(var i in data) {
			var header = data[i];
			apiList.append(h(4).text(header.title))
			var items = header.items
			for (var j in items) {
				var method = items[j]
				var methodTitle = method.title;//.substring(header.title.length + 1)
				apiList.append(a()
					.text(methodTitle)
					.attr({href: '#' + methodTitle})
					.addClass('method')
					.click(function(e) {
						showPage(e.target.text)
					}))
				.append(br());
					
				apiMap[methodTitle] = method;
			}
		}
		
		if (document.URL.indexOf('#') > 0) {
			var hash = document.URL.substr(document.URL.indexOf('#') + 1)
			showPage(hash)
		}
	});
	
	$("form input[type=submit]").click(function() {
		$("input[type=submit]", $(this).parents("form")).removeAttr("clicked");
		$(this).attr("clicked", "true");
	});
	
	$('form').submit(function(a) {
		var inputData = authData();
		$.each($(this).serializeArray(), function(i, elem) {
			if (elem.name != 'outputFormat')
				inputData[elem.name] = elem.value
			else
				outputFormat = elem.value
		});
		
		var url = outputFormat + '/' + selectedMethod;
		var buttonPressed = $("input[type=submit][clicked=true]").val();
		if (buttonPressed == 'Post') {
			$.post(url, inputData, function(data) {
				if (outputFormat == 'json') {
					data = JSON.stringify(data, null, '\t')
				} else {
					data = (new window.XMLSerializer()).serializeToString(data);
				}
				output.text(data)
			});
		} else {
			url += '?' + $.param(inputData);
			getWindow = window.open(url, '_blank');
			getWindow.focus();
		}
	    return false;
	});
	
	function showPage(methodTitle) {
		if (selectedMethod != methodTitle) {
			if (methodTitle in apiMap) {
				var method = apiMap[methodTitle]
				description.text(method.description || '[Description needed]')
				
				// Clear out, ready to start again
				inputs.empty();
				if ('inputs' in method) {
					var inputArray = method.inputs
					for (var i in inputArray) {
						var input = inputArray[i];
						switch (input.type) {
							case 'text':
								inputs.append(createInputField(input.title, input.description));
								break;
							default:
								console.log('todo')
								break;
						}
					}
				}
				
				output.text('')
				$('#apiSpecifics').show()
				selectedMethod = methodTitle;
			}
		}
	}
	
	function createInputField(title, description) {
		return div().addClass('palette palette-peter-river')
			.append(input().attr({name: title, placeholder: title, 'class': 'span6'}))
			.append(span().text(description))
	}
</script>
%rebase layout title='API', name='api', **locals()