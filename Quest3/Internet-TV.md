# Internet_TV Documentation
<details>
  <summary> ステップ１：テーブル設計 </summary>

  テーブル：users
  | カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
  | :---: | :---: | :---: | :---: | :---: | :---: |
  | id | BIGINT(20) | | PRIMARY | | YES |
  | user_name | VARCHAR(100) | | | | |
  | user_email | VARCHAR(100) | | INDEX | |
  | user_password| TINTINT(64) | | | | |

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
  | start_time | DATETIME | | | | |
  | end_time | DATETIME | | | | |

  ＊ 外部キー制約：channel_id に対して、channels テーブルの id カラムから設定

  <br>

  テーブル：programs
  | カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
  | :---: | :---: | :---: | :---: | :---: | :---: |
  | id | BIGINT(20) | | PRIMARY | | YES |
  | program_title | VARCHAR(100) | | | | |
  | program_description | TEXT | | | | |
  | genre_id | VARCHAR(100) | | INDEX | | |

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
  | episode_duration | TEXT | | | | |
  | video_duration | INT(11) | | | | |
  | release_date | DATE | | | | |

  ＊ 外部キー制約：season_id に対して、seasons テーブルの id カラムから設定
  
  <br>

  テーブル：genres
  | カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
  | :---: | :---: | :---: | :---: | :---: | :---: |
  | id | BIGINT(20) | | PRIMARY | | YES |
  | name | VARCHAR(100) | | | | |

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
  <summary> ステップ２：データベースの構築＆データの挿入 </summary>

</details>