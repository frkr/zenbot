#!/bin/bash

function mongo_start() {
    mongod --fork --logpath /var/log/mongod.log
}

function mongo_exit() {
  mongo --eval "db.getSiblingDB('admin').shutdownServer()"
}
function back() {
  ./zenbot.sh backfill binance.$1-USDT --days 40
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
  ./zenbot.sh sim \
  binance.$2-USDT \
  --days 40 \
  --strategy $3 \
  --use_fee_asset BNB \
  --buy_pct $1 \
  --profit_stop_enable_pct 10 \
  --profit_stop_pct 4 \
  --sell_stop_pct 4 \
  --currency_capital 2000 \
  --filename /data/db/n3-$2-$1-$3.html --non_interactive

}
function sim31() {
  ./zenbot.sh sim \
  binance.$2-USDT \
  --days 40 \
  --strategy $3 \
  --use_fee_asset BNB \
  --currency_capital 100 \
  --profit_stop_enable_pct 10 \
  --profit_stop_pct 4 \
  --sell_stop_pct 4 \
  --filename /data/db/n3-100-$2-$1-$3.html --non_interactive

}
function simTypes() {
    sim3 10 BTT $1
    sim3 10 BTC $1
    sim31 99 BTT $1
    sim31 99 BTC $1
}
function all() {
  simTypes bollinger
  simTypes cci_srsi
  simTypes crossover_vwap
  simTypes dema
  simTypes ehlers_ft
  simTypes ehlers_mama
  simTypes ehlers_trend
  simTypes ichimoku
  simTypes ichimoku_score
  simTypes kc
  simTypes macd
  simTypes momentum
  simTypes multi
  simTypes neural
  simTypes noop
  simTypes pivot
  simTypes renko
  simTypes rsi
  simTypes sar
  simTypes speed
  simTypes srsi_macd
# simTypes stddev // travou
  simTypes ta_ema
  simTypes ta_macd
  simTypes ta_macd_ext
  simTypes ta_ppo
  simTypes ta_srsi_bollinger
  simTypes ta_stoch_bollinger
  simTypes ta_trix
  simTypes ta_ultosc
  simTypes ti_bollinger
  simTypes ti_hma
  simTypes ti_stoch
  simTypes ti_stoch_bollinger
  simTypes trend_bollinger
  simTypes trend_ema
  simTypes trendline
  simTypes trust_distrust
  simTypes vpt
  simTypes wavetrend
}
function main() {
  mongo_start

  back BTT
  back BTC
  all

  mongo_exit
}

main
