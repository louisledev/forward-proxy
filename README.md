Forward-Proxy
=============
This is my journey into setting a forward proxy on a Windows Box.
After a very short thinking, decided to use a docker to
get something running without the hassle of installation.

After some research, found out that nginx is not meant to be a forward proxy
but rather a web server and/or a reverse proxy.
By trying myself, I realized that the issue appears when trying to prxy https traffic.

However, I found that there is a module fixing the issue, as discussed 
in https://github.com/reiz/nginx_proxy

After some more research, I found that there is another popular forward proxy, 
[squid](http://www.squid-cache.org/Doc/).
Squid is pretty sophisticated when it comes to configuration.
In my case, I just wanted to allow access to all eternal sites.
So, I modify the default configuration to achieve that.