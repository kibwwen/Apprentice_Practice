USE internet_tv;

CREATE TABLE users (
  id BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
  user_name VARCHAR(100),
  user_email VARCHAR(100),
  user_password CHAR(64),
  UNIQUE(user_email)
);

CREATE TABLE channels (
  id BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
  channel_name VARCHAR(100)
);

CREATE TABLE time_slots (
  id BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
  channel_id BIGINT(20),
  start_time TIME,
  end_time TIME,
  FOREIGN KEY (channel_id) REFERENCES channels(id)
);

CREATE TABLE genres (
  id BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
  genre_name VARCHAR(100)
);

CREATE TABLE programs (
  id BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100),
  description TEXT,
  genre_id BIGINT(20),
  FOREIGN KEY (genre_id) REFERENCES genres(id)
);

CREATE TABLE seasons (
  id BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
  program_id BIGINT(20),
  season_number INT(11),
  FOREIGN KEY (program_id) REFERENCES programs(id)
);

CREATE TABLE episodes (
  id BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
  season_id BIGINT(20),
  episode_number INT(11),
  episode_title VARCHAR(100),
  episode_description TEXT,
  video_duration INT(11),
  release_date DATE,
  FOREIGN KEY (season_id) REFERENCES seasons(id)
);

CREATE TABLE program_genres (
  id BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
  program_id BIGINT(20),
  genre_id BIGINT(20),
  FOREIGN KEY (program_id) REFERENCES programs(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id)
);

CREATE TABLE view_counts (
  id BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
  episode_id BIGINT(20),
  channel_id BIGINT(20),
  time_slot_id BIGINT(20),
  view_count INT(11),
  FOREIGN KEY (episode_id) REFERENCES episodes(id),
  FOREIGN KEY (channel_id) REFERENCES channels(id),
  FOREIGN KEY (time_slot_id) REFERENCES view_counts(id)
);