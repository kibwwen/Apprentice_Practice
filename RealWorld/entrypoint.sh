#!/bin/bash
# set -e は「エラーが発生するとスクリプトを終了する」オプション
set -e

# rm ではrailsのpidを削除
# Rails に対応したファイル server.pid が存在しているかもしれないので削除する。
rm -f /app/tmp/pids/server.pid

# exec "$@"でCMDで渡されたコマンドを実行しています。(→rails s)
# コンテナのプロセスを実行する。（Dockerfile 内の CMD に設定されているもの。）
exec "$@"