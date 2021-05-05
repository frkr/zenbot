#!/bin/bash

./mongodb.sh

./zenbot.sh $@

./stop.sh
