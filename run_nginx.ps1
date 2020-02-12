$loc = Get-Location
$proxyConfPath = (Join-Path -Path $loc.Path -ChildPath "proxy_nginx.conf").ToString()
write-host Starting nginx with configuration $proxyConfPath
docker run --name forward-proxy-nginx --rm -p 8888:8888 -d `
    -v ${proxyConfPath}:/usr/local/nginx/conf/nginx.conf `
    reiz/nginx_proxy:latest

docker exec forward-proxy-nginx tail -f /var/log/nginx_access.log 