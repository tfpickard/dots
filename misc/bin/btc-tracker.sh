rate=$(curl -sf https://www.bitstamp.net/api/v2/ticker/btcusd | jq -r ".last")
rate=$(LANG=C printf "%.2f" "$rate")

echo "$rate $"
