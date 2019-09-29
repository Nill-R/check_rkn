[Link](https://github.com/Nill-R/check_rkn/blob/master/README.old.md "Link") to original README

# Instalation guide 

Debian-based distros(Debian, Ubuntu, Armbian etc…)
```
sudo apt install git golang-go jq
git clone https://github.com/Nill-R/check_rkn.git
go get github.com/zmap/go-iptree/iptree
cd check_rkn
CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o check_rkn .
sudo cp check_rkn /usr/local/bin/
```
For manually check
```
check_rkn 127.0.0.1:9999 ./
```
In other shell
```
curl -s -X POST -d '["104.31.93.48", "104.31.92.48"]' http://localhost:9999/check_ips
```
And look something like
```
{"104.31.92.48":true,"104.31.93.48":true}
```
It is work!
Ok. Install service
```
sudo mkdir -p /srv/db/csv; sudo chown nobody /srv/db/csv; sudo mkdir -p /var/log/check_rkn; sudo chown nobody /var/log/check_rkn
sudo cp check_rkn.service /etc/systemd/system/
systemctl enable check_rkn
systemctl start check_rkn
```
Waiting for db downloaded and check
```
curl -s -X POST -d '["104.31.93.48", "104.31.92.48"]' http://localhost:9999/check_ips
```
Look 
```
{"104.31.92.48":true,"104.31.93.48":true}
```
Well done! check_rkn work as service!
