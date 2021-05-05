```shell
docker run --rm -v /mnt/c/w/mongodb:/data/db frkr/zenbot
```

```shell
docker run -it --rm -v /mnt/c/w/mongodb:/data/db --entrypoint=/bin/bash frkr/zenbot
```

```shell
docker run --rm -v /mnt/c/w/mongodb:/data/db frkr/zenbot ls
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
