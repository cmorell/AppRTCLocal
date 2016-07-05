@author: Carlos Morell Roldan

#AppRTC  

##Instructions

```
vagant up --provision
```
In this case, VM use public network configuration. For that reason, vagrant ask us which interfaces should the network bridge to:

```
==> default: Available bridged network interfaces:
1) en0: Wi-Fi (AirPort)
2) en1: Thunderbolt 1
3) en2: Thunderbolt 2
4) p2p0
5) awdl0
6) bridge0
==> default: When choosing an interface, it is usually the one that is
==> default: being used to connect to the internet.
    default: Which interface should the network bridge to? 
```

Now, enjoy:

```
vagrant ssh
```

Inside VM

```
$GOPATH/bin/collidermain -port=8089 -tls=true
$HOME/google_appengine/dev_appserver.py $HOME/apprtc/out/app_engine --host 0.0.0.0
```


