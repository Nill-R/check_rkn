```
docker run -it —rm -p 8020:8020 shurshun/check_rkn
curl -X POST -d '["34.246.38.204", "47.91.106.69"]' http://localhost:8020/check_ips
{"34.246.38.204":true,"47.91.106.69":true}
```
Alternative build and run as service with systemd-unit

```
git clone https://github.com/Nill-R/check_rkn.git
go get github.com/zmap/go-iptree/iptree
cd check_rkn
CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o check_rkn .
```
or for cross-compile for ARM
```
CGO_ENABLED=0 GOOS=linux GOARCH=ARM go build -a -installsuffix cgo -o check_rkn_arm .
```
Edit systemd-unit from repo, enable and start service
