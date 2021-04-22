```shell
docker run --rm -v /mnt/c/w/mongodb:/data/db frkr/zenbot

docker run -it --rm -v /mnt/c/w/mongodb:/data/db --entrypoint=/bin/bash frkr/zenbot
```

# Opcoes --
- buy_pct 10
- period=15m
- period=1h
- profit_stop_enable_pct 10 
- profit_stop_pct 10
- overbought_rsi 15


./zenbot.sh sim binance.BTT-USDT --days 30 --strategy ta_macd --use_fee_asset BNB --buy_pct 10 --period=15m --filename /data/db/btt-ta_macd-15m.html --non_interactive
./zenbot.sh sim binance.BTT-USDT --days 30 --strategy ta_macd --use_fee_asset BNB --buy_pct 10 --period=4h --filename /data/db/btt-ta_macd-4h.html --non_interactive
