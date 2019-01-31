import SimpleHTTPServer
import SocketServer

PORT = 8000

class Handler(SimpleHTTPServer.SimpleHTTPRequestHandler):
    pass

Handler.extensions_map['.shtml'] = 'text/html'
Handler.extensions_map['.wasm'] = 'application/wasm'
Handler.extensions_map['.json'] = 'application/json'

httpd = SocketServer.TCPServer(("", PORT), Handler)

try:
    print "http://localhost:{0}".format(PORT)
    httpd.serve_forever()
except Exception:
    httpd.shutdown()
