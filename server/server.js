const http = require("http");
const fs = require("fs");

const server = http.createServer((req, res) => {
  console.log(req.method);
  if (req.method === "GET" && req.url === "/meal") {
    const file = fs.readFileSync("./meal.json");
    res.setHeader("content-type", "application/json");
    res.end(file);
  } else {
    res.writeHead(404, "404");
    res.end("404");
  }
});

server.listen(8000, () => {
  console.log("8000端口已启动");
});
