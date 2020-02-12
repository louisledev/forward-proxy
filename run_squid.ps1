# see https://hub.docker.com/r/sameersbn/squid/

$loc = Get-Location
$proxyConfPath = (Join-Path -Path $loc.Path -ChildPath "proxy_squid.conf").ToString()

# write-host Starting nginx with configuration $proxyConfPath

docker run --name squid -d --rm `
  --publish 8888:3128 `
  --volume ${proxyConfPath}:/etc/squid/squid.conf `
  sameersbn/squid:3.5.27-2

docker exec -it squid tail -f /var/log/squid/access.log