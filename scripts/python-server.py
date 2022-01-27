import SimpleHTTPServer
import SocketServer
import sys

try:
    PORT = int(sys.argv[1])
except Exception:
    PORT = 8000

class Handler(SimpleHTTPServer.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_my_headers()
        SimpleHTTPServer.SimpleHTTPRequestHandler.end_headers(self)

    def send_my_headers(self):
        self.send_header("Access-Control-Allow-Origin", "*")


Handler.extensions_map['.shtml'] = 'text/html'
Handler.extensions_map['.wasm'] = 'application/wasm'
Handler.extensions_map['.json'] = 'application/json'
Handler.extensions_map['.css'] = 'text/css'
Handler.extensions_map['.js'] = 'text/javascript'

httpd = SocketServer.TCPServer(("", PORT), Handler)

try:
    print "http://localhost:{0}".format(PORT)
    httpd.serve_forever()
except KeyboardInterrupt as e:
    pass
except Exception:
    httpd.shutdown()
