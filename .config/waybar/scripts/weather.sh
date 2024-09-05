#!/usr/bin/env bash

weather=$(curl -sS "https://wttr.in/?format=%c%f")

echo "$weather"
