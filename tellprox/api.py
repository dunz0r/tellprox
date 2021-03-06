import bottle_helpers as bh
from bottle import request

class API(object):
	def __init__(self, app, config):
		self.app = app
		self.config = config
		app.route('/<out_format:re:(?i)(xml|json)>/<ftype:path>/<func:path>',
			method = ['GET', 'POST'],
			callback = self.route_all)
		self.callbacks = {}
		self.add_route('api', self.output)
		
	def add_route(self, key, callback):
		self.callbacks[key] = callback
		
	def route_all(self, out_format, ftype, func):
		print request
		if ftype in self.callbacks:
			if (self.check_apikey()):
				func = func.strip().lower()
				resp = self.callbacks[ftype](func)
			else:
				resp = { 'error': 'key not valid' }
			return bh.format_response(resp, out_format, ftype, self.config['pretty_print'])
				
		bh.raise404()
		
	def output(self, ftype):
		return [{'key': k} for k, v in self.callbacks.iteritems()]
		
	def check_apikey(self):
		if not self.config['apikey']:
			return True
		key = bh.get_string('key')
		return key == self.config['apikey']