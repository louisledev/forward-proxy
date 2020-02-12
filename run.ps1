$loc = Get-Location
$nginxConfPath = (Join-Path -Path $loc.Path -ChildPath "nginx.conf").ToString()
$proxyConfPath = (Join-Path -Path $loc.Path -ChildPath "proxy.conf").ToString()
write-host Starting nginx with configuration $nginxConfPath and $proxyConfPath

docker run -p 8080:80 --rm --name my-nginx `
    -v ${nginxConfPath}:/etc/nginx/nginx.conf:ro `
    -v ${proxyConfPath}:/etc/nginx/conf.d/default.conf:ro `
    nginx:1.17