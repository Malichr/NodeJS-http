const http = require('http');
const url = require('url');

// Szerver konfiguráció
const hostname = '0.0.0.0';
const port = 3000;

// HTTP szerver
const server = http.createServer((req, res) => {
  // URL feldolgozása
  const queryObject = url.parse(req.url, true).query;

  if (!queryObject.text) {
    res.statusCode = 400;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Hiba: Adj meg egy "text" paramétert az URL-ben! Példa: /?text=Hello');
    return;
  }

  const inputText = queryObject.text;
  const reversedText = inputText.split('').reverse().join('');  // A szöveg megfordítása

  // Válasz küldése
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end(`Eredeti szöveg: ${inputText}\nFordított szöveg: ${reversedText}`);
});

// Szerver indítása
server.listen(port, hostname, () => {
  console.log(`Szerver fut a következő címen: http://${hostname}:${port}/`);
  console.log('Adj meg egy "text" paramétert az URL-ben, például: http://localhost:3000/?text=Hello');
});