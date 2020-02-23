#!/bin/bash
fp="/tmp/$(basename $0)"

dflt_iface=$(ip route show default | \
    grep -oE "dev [[:alnum:]]*" | \
    cut -d' ' -f2 || echo "unknown")

dflt_ipaddr_mask=$(ip addr show $dflt_iface | \
    grep inet | \
    grep -oE "[0-9]*\.[0-9]*.*\/[0-9]*" || echo "unknown")

dflt_ipaddr=$(echo $dflt_ipaddr_mask | cut -d'/' -f1)
dflt_mask=$(echo $dflt_ipaddr_mask | cut -d'/' -f2)



case $1 in
    "wifi")
        ap=$(iwconfig 2>/dev/null | \
            grep -oE "ESSID:\".*\"" | \
            tr -d \" | cut -d: -f2)
        wlan=$(iwconfig 2>/dev/null | grep $ap | awk '{print $1}')
        br=$(iwlist $wlan rate | grep -oE "[0-9]*\.[0-9]* .*")
        [[ 0 -eq $? ]] || br="idle"
        freq=$(iwlist wlp2s0 frequency | grep Current | cut -d':' -f2 )
        power=$(iwlist wlp2s0 txpower | grep -oE "[0-9]* dBm" | tr -d ' ')
        echo "$wlan: $ap | $br @ $freq | $power"
        ;;
    *)
        echo $dflt_ipaddr"/"$dflt_mask
        echo $dflt_iface
        ;;
esac

rc=$?
exit $rc
