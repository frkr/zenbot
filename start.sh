#!/bin/bash

function mongo_start() {
    mongod --fork --logpath /var/log/mongod.log
}

function mongo_exit() {
  mongo --eval "db.getSiblingDB('admin').shutdownServer()"
}
function back() {
  ./zenbot.sh backfill binance.$1-USDT --days 90
}
function sim() {
  ./zenbot.sh sim \
  binance.$2-USDT \
  --days 90 \
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
  --days 90 \
  --strategy $3 \
  --use_fee_asset BNB \
  --buy_pct $1 \
  --currency_capital 2000 \
  --filename /data/db/$2-$1-$3.html --non_interactive

}
function main() {
  mongo_start

  back BTT
  back BTC
  sim 10 BTT ta_macd 1.5 2.5
  sim 10 BTC ta_macd 1.5 2.5
  sim 25 BTT ta_macd 1.5 2.5
  sim 25 BTC ta_macd 1.5 2.5

  sim2 10 BTT ta_macd
  sim2 10 BTC ta_macd
  sim2 25 BTT ta_macd
  sim2 25 BTC ta_macd

  mongo_exit
}

main
