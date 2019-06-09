#!/bin/bash

act_bytes='bb39dd06'

ffmpeg -activation_bytes $act_bytes -i "$@" -vn -c:a copy "${@/aax/mp4}"

echo File Created: "${@/aax/mp4}"
