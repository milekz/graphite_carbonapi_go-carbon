# graphite_carbonapi_go-carbon

Based on 
https://github.com/lomik/go-carbon

https://github.com/go-graphite/carbonapi

port 8081 used for Grafana<->graphite connect

example (grafana 6.6.0 + (go-carbon + carbonapi))
 
   * docker run -d --name graphite --restart always -p 2003-2004:2003-2004 -p 2023:2023/udp -p 8081:8081 milekz/go-graphite:latest 
   * docker run -d --name grafanaxxl --restart always -p 3000:3000 milekz/grafanaxxl:latest
