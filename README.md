* sendyou

    sendで送信先のキャラクター名を省略するWindowerアドオンです。

    (2アカウントなどで予め送信先が決まっている場合にキャラクター名を省略できます。)

    * 使い方

        * 初期設定

            送信先キャラクター名の設定

              //sy set キャラクター名

        * 実行

              //sy /ma ストーン <bt>

            以下のsendコマンドと同等

              //send 送信先キャラクター名 /ma ストーン <bt>

* setting.xml

    * you

        src_name: 送信元キャラクター名, dst_name: 送信先キャラクター名

          <src_name>dst_name</src_name>
