#!/jffs/bin/bash

export PATH=/jffs/bin:/jffs/sbin:${PATH}
export LD_LIBRARY_PATH=/jffs/lib:/jffs/usr/lib:/jffs/usr/local/lib

ca_cert="/jffs/etc/ssl/GeoTrustGlobalCA"
curl_path="/jffs/usr/bin/curl"
ip="$(nvram get wan_ipaddr)"

refresh_ip() {
  ${curl_path} --cacert ${ca_cert} "https://dynamicdns.park-your-domain.com/update?host=&domain=${1}&password=${2}&ip=${ip}" >/dev/null 2>&1
}

domains=$1

while IFS='=' read -r domain password
do
  refresh_ip $domain $password
done < $domains