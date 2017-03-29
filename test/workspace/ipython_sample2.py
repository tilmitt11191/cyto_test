

# cyREST サーバーのIPアドレス（Cytoscapeを実行しているマシンのアドレス）。必ず設定が必要です！
IP = '10.0.1.6'

# cyRESTサーバーの情報。デフォルトのポートは1234
PORT_NUMBER = 1234

# 定数としてベースとなるURLを保存
BASE = 'http://' + IP + ':' + str(PORT_NUMBER) + '/v1/'



# 生成されるネットワークに含まれるノード数
NUM_NODES = 100

# 小規模なスケールフリーネットワークを作成
scale_free_graph = nx.scale_free_graph(NUM_NODES)

# ネットワークのアトリビュートとして名前をつける
scale_free_graph.graph['name'] = 'スケールフリーネットワーク (ノード数: ' + str(NUM_NODES) + ')'

# ユーティリティーを使ってそれをCytoscape.js 形式のJSONに変換可能なディクショナリオブジェクトを得る
cy_netwiork1 = cy.from_networkx(scale_free_graph)

# CytoscapeにネットワークをPOSTする (Create)
res = requests.post(BASE + 'networks', data=json.dumps(cy_netwiork1), headers=HEADERS)

# 生成されたネットワークのSUID (Session-Unique ID)を得る
suid = res.json()['networkSUID']

# そのSUIDを利用して、自動レイアウトアルゴリズム（ここではばねモデル）を走らせる
requests.get(BASE + 'apply/layouts/force-directed/' + str(suid))

# プリセットのVisual Style (後述)を適用する
requests.get(BASE + 'apply/styles/Directed/' + str(suid))

# 画像APIを利用して、可視化結果をこのノートに埋め込む
Image(url=BASE+'networks/' + str(suid) + '/views/first.png', embed=True)
