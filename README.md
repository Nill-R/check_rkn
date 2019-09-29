[Link](https://github.com/Nill-R/check_rkn/blob/master/README.old.md "Link") to original README

###Instalation guide
```
git clone https://github.com/Nill-R/check_rkn.git
go get github.com/zmap/go-iptree/iptree
cd check_rkn
CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o check_rkn .
```
or cross-compile for ARM
```
CGO_ENABLED=0 GOOS=linux GOARCH=ARM go build -a -installsuffix cgo -o check_rkn_arm .
```
Edit systemd-unit from repo, enable and start service
