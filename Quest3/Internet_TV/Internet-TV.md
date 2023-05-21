# Internet_TV Documentation
<details>
  <summary> ステップ１：テーブル設計 </summary>

  テーブル：users
  | カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
  | :---: | :---: | :---: | :---: | :---: | :---: |
  | id | BIGINT(20) | | PRIMARY | | YES |
  | user_name | VARCHAR(100) | | | | |
  | user_email | VARCHAR(100) | | INDEX | |
  | user_password| CHAR(64) | | | | |

  <br>

  テーブル：channels
  | カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
  | :---: | :---: | :---: | :---: | :---: | :---: |
  | id | BIGINT(20) | | PRIMARY | | YES|
  | channel_name | VARCHAR(100) | | | | |
  
  <br>

  テーブル：time_slots
  | カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
  | :---: | :---: | :---: | :---: | :---: | :---: |
  | id | BIGINT(20) | | PRIMARY | | YES |
  | channel_id | BIGINT(20) | | INDEX | | |
  | start_time | TIME | | | | |
  | end_time | TIME | | | | |

  ＊ 外部キー制約：channel_id に対して、channels テーブルの id カラムから設定

  <br>

  テーブル：genres
  | カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
  | :---: | :---: | :---: | :---: | :---: | :---: |
  | id | BIGINT(20) | | PRIMARY | | YES |
  | genre_name | VARCHAR(100) | | | | |

  <br>

  テーブル：programs
  | カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
  | :---: | :---: | :---: | :---: | :---: | :---: |
  | id | BIGINT(20) | | PRIMARY | | YES |
  | title | VARCHAR(100) | | | | |
  | description | TEXT | | | | |
  | genre_id | BIGINT(20) | | INDEX | | |

  <br>

  テーブル：seasons
  | カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
  | :---: | :---: | :---: | :---: | :---: | :---: |
  | id | BIGINT(20) | | PRIMARY | | YES |
  | program_id | BIGINT(20) | | INDEX | | |
  | season_number| INT(11) | | | | |

  ＊ 外部キー制約：program_id に対して、programs テーブルの id カラムから設定

  <br>

  テーブル：episodes
  | カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
  | :---: | :---: | :---: | :---: | :---: | :---: |
  | id | BIGINT(20) | | PRIMARY | | YES |
  | season_id | BIGINT(20) | | INDEX | | |
  | episode_number | INT(11) | | | | |
  | episode_title | VARCHAR(100) | | | | |
  | episode_description | TEXT | | | | |
  | video_duration | INT(11) | | | | |
  | release_date | DATE | | | | |

  ＊ 外部キー制約：season_id に対して、seasons テーブルの id カラムから設定
  
  <br>

  テーブル：program_genres
  | カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
  | :---: | :---: | :---: | :---: | :---: | :---: |
  | id | BIGINT(20) | | PRIMARY | | YES |
  | program_id | BIGINT(20) | | INDEX | | |
  | genre_id | BIGINT(20) | | INDEX | | |

  ＊ 外部キー制約：program_id に対して、programs テーブルの id カラムから設定

  ＊ 外部キー制約：genre_id に対して、genres テーブルの id カラムから設定

  <br>

  テーブル：view_counts
  | カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
  | :---: | :---: | :---: | :---: | :---: | :---: |
  | id | BIGINT(20) | | PRIMARY | | YES |
  | episode_id | BIGINT(20) | | INDEX | | |
  | channel_id | BIGINT(20) | | INDEX | | |
  | time_slot_id | BIGINT(20) | | INDEX | | |
  | view_count | INT(11) | | | | |

  ＊ 外部キー制約：episode_id に対して、episodes テーブルの id カラムから設定

  ＊ 外部キー制約：channel_id に対して、channels テーブルの id カラムから設定

  ＊ 外部キー制約：time_slot_id に対して、time_slots テーブルの id カラムから設定
</details>
<details>
  <summary>ステップ２：データベースの構築＆データの挿入</summary>

  ### Docker-composeによるmysqlを構築
    1.docker-compose.ymlが入ったディレクトリーに移動します。
    2.docker-compose up -dを実行します。
    3.docker-compose exec db /bin/bashを入力し、コンテナに接続します。
    4.mysql -pを入力し、mysqlに接続します。
    5.パスワードを入力し、mysqlに接続します。

  ### internet_tvデータベースを作成
    1.source /Internet_TV/setup_sql/create_database.sql

  ### テーブルを作成
    1.source /Internet_TV/setup_sql/create_table.sql

  ### サンプルデータの挿入
    1.source /Internet_TV/setup_sql/insert_data.sql
</details>

<details>
  <summary>ステップ３：データを抽出する</summary>

  ### エピソード視聴数トップ3のエピソードタイトルと視聴数を取得するクエリ
    SELECT episode_title, view_count
    From episodes
    JOIN view_counts ON episodes.id = view_counts.episode_id
    ORDER BY view_count DESC
    LIMIT 3;
  
  ### エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得するクエリ
    SELECT programs.title, seasons.season_number, episodes.episode_number, episodes.episode_title, view_counts.view_count
    FROM episodes 
    JOIN seasons ON episodes.season_id = seasons.id
    JOIN programs ON seasons.program_id = programs.id 
    JOIN view_counts ON episodes.id = view_counts.episode_id 
    ORDER BY view_counts.view_count DESC
    LIMIT 3;

  ### 本日の番組表を表示するために、本日放送される全ての番組のチャンネル名、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得するクエリ
    SELECT channels.channel_name, CONCAT(CURRENT_DATE, ' ', time_slots.start_time) AS start_time, CONCAT(CURRENT_DATE, ' ', time_slots.end_time) AS end_time, seasons.season_number, episodes.episode_number, episodes.episode_title, episodes.episode_description 
    FROM view_counts
    JOIN episodes ON view_counts.episode_id = episodes.id
    JOIN seasons ON episodes.season_id = seasons.id
    JOIN programs ON seasons.program_id = programs.id
    JOIN time_slots ON view_counts.time_slot_id = time_slots.id
    JOIN channels ON view_counts.channel_id = channels.id
    WHERE episodes.release_date = CURRENT_DATE
    ORDER BY time_slots.start_time;

  ### ドラマチャンネルの本日から一週間分の番組表の放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得するクエリ
    SELECT time_slots.start_time, time_slots.end_time, seasons.season_number, episodes.episode_number, episodes.episode_title, episodes.episode_description
    FROM view_counts
    JOIN episodes ON view_counts.episode_id = episodes.id
    JOIN seasons ON episodes.season_id = seasons.id
    JOIN programs ON seasons.program_id = programs.id
    JOIN time_slots ON view_counts.time_slot_id = time_slots.id
    JOIN channels ON view_counts.channel_id = channels.id
    WHERE channels.channel_name = 'ドラマ'
    AND episodes.release_date BETWEEN CURRENT_DATE AND DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY)
    ORDER BY episodes.release_date, time_slots.start_time;

  ### 直近一週間で最も見られた番組の番組タイトルと視聴数を取得するクエリ
    SELECT programs.title, SUM(view_counts.view_count) AS total_view_count
    FROM view_counts
    JOIN episodes ON view_counts.episode_id = episodes.id
    JOIN seasons ON episodes.season_id = seasons.id
    JOIN programs ON seasons.program_id = programs.id
    WHERE episodes.release_date BETWEEN DATE_SUB(CURRENT_DATE, INTERVAL 7 DAY) AND CURRENT_DATE
    GROUP BY programs.title
    ORDER BY total_view_count DESC
    LIMIT 2;

  ### ジャンルごとの番組の視聴数ランキングを取得するクエリ
    SELECT genres.genre_name, programs.title, AVG(view_counts.view_count) AS average_view_count
    FROM view_counts
    JOIN episodes ON view_counts.episode_id = episodes.id
    JOIN seasons ON episodes.season_id = seasons.id
    JOIN programs ON seasons.program_id = programs.id
    JOIN program_genres ON programs.id = program_genres.program_id
    JOIN genres ON program_genres.genre_id = genres.id
    GROUP BY genres.genre_name, programs.title
    ORDER BY average_view_count DESC;
</details>