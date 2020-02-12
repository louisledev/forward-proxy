$loc = Get-Location
$proxyConfPath = (Join-Path -Path $loc.Path -ChildPath "proxy.conf").ToString()

write-host Starting nginx with configuration $proxyConfPath

docker run --name my-proxy --rm -p 8888:8888 -v ${proxyConfPath}:/usr/local/nginx/conf/nginx.conf forward-proxy:0.1