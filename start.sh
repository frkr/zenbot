#!/bin/bash

function mongo_start() {
    mongod --fork --logpath /var/log/mongod.log
}

function mongo_exit() {
  mongo --eval "db.getSiblingDB('admin').shutdownServer()"
}
function back() {
  ./zenbot.sh backfill binance.$1-USDT --days 30
}
function sim() {
  ./zenbot.sh sim \
  binance.$2-USDT \
  --days 30 \
  --strategy $3 \
  --use_fee_asset BNB \
  --buy_pct $1 \
  --profit_stop_enable_pct $4 \
  --profit_stop_pct $5  \
  --sell_stop_pct $5 \
  --currency_capital 2000 \
  --filename /data/db/$2-$1-$3-$4-$5.html --non_interactive

}
function sim2() {
  ./zenbot.sh sim \
  binance.$2-USDT \
  --days 30 \
  --strategy $3 \
  --use_fee_asset BNB \
  --buy_pct $1 \
  --currency_capital 2000 \
  --filename /data/db/$2-$1-$3.html --non_interactive

}
function sim21() {
  ./zenbot.sh sim \
  binance.$2-USDT \
  --days 30 \
  --strategy $3 \
  --use_fee_asset BNB \
  --currency_capital 100 \
  --filename /data/db/100-$2-$1-$3.html --non_interactive

}
function sim3() {
    sim2 10 BTT $1
    sim2 10 BTC $1
    sim21 99 BTT $1
    sim21 99 BTC $1
}
function all() {
  sim3 bollinger
  sim3 cci_srsi
  sim3 crossover_vwap
  sim3 dema
  sim3 ehlers_ft
  sim3 ehlers_mama
  sim3 ehlers_trend
  sim3 ichimoku
  sim3 ichimoku_score
  sim3 kc
  sim3 macd
  sim3 momentum
  sim3 multi
  sim3 neural
  sim3 noop
  sim3 pivot
  sim3 renko
  sim3 rsi
  sim3 sar
  sim3 speed
  sim3 srsi_macd
  sim3 stddev
  sim3 ta_ema
  sim3 ta_macd
  sim3 ta_macd_ext
  sim3 ta_ppo
  sim3 ta_srsi_bollinger
  sim3 ta_stoch_bollinger
  sim3 ta_trix
  sim3 ta_ultosc
  sim3 ti_bollinger
  sim3 ti_hma
  sim3 ti_stoch
  sim3 ti_stoch_bollinger
  sim3 trend_bollinger
  sim3 trend_ema
  sim3 trendline
  sim3 trust_distrust
  sim3 vpt
  sim3 wavetrend
}
function main() {
  mongo_start

  back BTT
  back BTC
  all

  mongo_exit
}

main
