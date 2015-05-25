自身のTAS用Lua script置き場です

This is my room of Lua scripts for TAS.

## Lua Scripts ##
[Astronoka/アストロノーカ](http://code.google.com/p/forte916-tas/source/browse/#svn%2Ftrunk%2Fastronoka)

  * Lua BOT第4弾
    * ゴールデン強化種を落とすスクリプトです。
    * 以下の3ファイルで構成されています。この3ファイルを同じフォルダに置きます
      * astronoka\_drop\_golden\_game\_start.lua
      * astronoka\_input\_macro\_lib.lua
      * astronoka\_lib.lua
    * ゲーム開始して 1フレーム目で astronoka\_drop\_golden\_game\_start.lua を実行してください
    * ゴールデン強化種を取得すると止まります。状況再現が可能なため、動画と全く同じムービーが作成されます

  * Lua BOT第3弾
    * 羽を落とすスクリプトです。
    * 以下の2ファイルで構成されています。この2ファイルを同じフォルダに置きます
    * トラップバトル開始後に astronoka\_drop\_feather.lua を実行してください
      * astronoka\_drop\_feather.lua
      * astronoka\_lib.lua
    * 羽を取得すると止まります

  * Lua BOT第2弾
    * 複数属性を進化する交配が可能です。
    * 以下の3ファイルで構成されています。この3ファイルを同じフォルダに置きます
      * astronoka\_auto\_hybrid2.lua
      * astronoka\_lib.lua
      * astronoka\_target\_vegee.lua
    * 必要な種を用意した後、交配マシンの画面で astronoka\_auto\_hybrid2.lua を実行してください
    * 交配が完了したら止まります
    * このスクリプトはレシピの作成が非常に複雑で面倒です。その代わりどんな野菜も作成可能です

  * Lua BOT第1弾
    * 1属性のみ進化する交配が可能です
    * 以下の1ファイルで構成されています
      * astronoka\_auto\_hybrid1.lua
    * 必要な種を用意した後、交配マシンの画面でスクリプトを実行してください
    * 交配が完了したら止まります


  * 自分用メモ
    * 野菜のレシピはツリー構造になっています。最適化のために二分木探索も行っています
    * ただし効率が悪いので、野菜の数が多いと最適化に数百時間、数千時間かかります
    * 二分木探索のアルゴリズムは postorder でこんな感じです
    * http://codepad.org/EAe3IWUw


## Test / テスト ##
https://drive.google.com/folderview?id=0BwoJ1kKHw4paZk11RDVUS3FuRVE&usp=sharing