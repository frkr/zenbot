```shell
docker run --rm -v /mnt/c/w/mongodb:/data/db frkr/zenbot
```

```shell
docker run -it --rm -v /mnt/c/w/mongodb:/data/db --entrypoint=/bin/bash frkr/zenbot
```

```shell
#docker run --rm -v /mnt/c/w/mongodb:/data/db frkr/zenbot ./start.sh trade \
#-e ZENBOT_BINANCE_API_KEY= \
#-e ZENBOT_BINANCE_SECRET= \
#-e ZENBOT_MONGODB_HOST= \
#2048
#4096
#8192

docker run -d --rm --name mongodb \
-v /mnt/c/w/mongodb:/data/db frkr/zenbot \
./mongodb.sh


docker run --rm --name btc \
--link mongodb:mongodb \
-e ZENBOT_MONGODB_HOST=mongodb \
-e NODE_OPTIONS="--max-old-space-size=2048" \
-p 17365:17365 \
frkr/zenbot \
./zenbot.sh trade \
--paper binance.BTC-USDT \
--strategy ti_stoch_bollinger \
--use_fee_asset BNB \
--buy_pct 10 \
--profit_stop_enable_pct 10 \
--profit_stop_pct 4 \
--sell_stop_pct 4

docker run --rm --name btc -e ZENBOT_BINANCE_API_KEY=api -e ZENBOT_BINANCE_SECRET=secret -e NODE_OPTIONS="--max-old-space-size=2048" -p 17365:17365 frkr/zenbot ./zenbot.sh trade --paper binance.BTC-USDT --strategy ti_stoch_bollinger --use_fee_asset BNB --buy_pct 10 --profit_stop_enable_pct 10 --profit_stop_pct 4 --sell_stop_pct 4



```

# Opcoes --
- buy_pct 10
- period=15m
- period=1h
- profit_stop_enable_pct 10 
- profit_stop_pct 10
- overbought_rsi 15

# Anotacoes

trend_ema_rate
zenbot sim --days 90 --profit_stop_enable_pct=10 --profit_stop_pct=1 --sell_rate=-0.006 --trend_ema=36 --period=1h

profit_stop_pct=4
