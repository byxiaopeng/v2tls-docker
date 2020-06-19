#!/bin/sh
#显示时间
date
cat << EOF > /usr/local/etc/v2ray/config.json
{
  "inbounds": [
  {
    "port": 8080,
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "ad806487-2d26-4636-98b6-ab85cc8521f7",
          "alterId": 64       
        }
      ]
    },
    "streamSettings": {
      "network": "ws",
      "wsSettings": {
      "path": "/ws"
      }     
    }
  }
  ],
  "outbounds": [
  {
    "protocol": "freedom",
    "settings": {}
  }
  ]
}
EOF
# start nginx
nginx
# Run V2Ray
REBOOTDATE=$(date)
sed -i "s/REBOOTDATE/$REBOOTDATE/g" /var/lib/nginx/html/index.html
/usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.json

