@author: Carlos Morell Roldan

#AppRTC

[AppRTC](https://apprtc.appspot.com/) is a demo of WebRTC. This repo help to developers to develop AppRTC server running locally (ubuntu trusty64).

In order to run AppRTC locally user requires:

- [AppRTC code](https://github.com/webrtc/apprtc)
- [Google App Engine SDK for Python](https://cloud.google.com/appengine/downloads#Google_App_Engine_SDK_for_Python)
- npm, as a part of nodejs
- [Go](https://golang.org/)
- [Grunt](http://gruntjs.com/getting-started)
- [Collider](https://github.com/webrtc/apprtc/tree/master/src/collider)
- [Coturn](https://github.com/coturn/coturn)
- Tunneling


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

##Config locally

In order to generate out folder user needs to execute the following commands inside apprtc folder

```
npm install
grunt build
```

The first one is to install dependencies and the second one is to generate out source, the ones that will be execute.

If developer will not change any configuration inside apprtc code, Server use Google Collider and Turn instances.
To change it, user needs to change [constants.py](https://github.com/webrtc/apprtc/blob/master/src/app_engine/constants.py#L15) file.

Also need to create certificate in order to set in collider. Developer need to change the path to this certificate in [collider.go](https://github.com/webrtc/apprtc/blob/master/src/collider/collider/collider.go#L67) file.

WebRTC only works under https. To do this user needs to install tunneling and redirect localhost traffic using this tunnel


#TODO

- How to install&config coturn
- How to install&config tunneling 



