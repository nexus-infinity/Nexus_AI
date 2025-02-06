import http from 'http';
const server = http.createServer((req, res) => res.end('Nexus Backend Active'));
server.listen(3000);
