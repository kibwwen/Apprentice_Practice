INSERT INTO users (user_name, user_email, user_password) VALUES
  ('John Doe', 'johndoe@example.com', 'password123'),
  ('Jane Smith', 'janesmith@example.com', 'pass456'),
  ('Mike Johnson', 'mikejohnson@example.com', 'secretword');

INSERT INTO channels (channel_name) VALUES
  ('ドラマ1'),
  ('ドラマ2'),
  ('アニメ1'),
  ('アニメ2'),
  ('スポーツ'),
  ('ペット');

INSERT INTO time_slots (start_time, end_time) VALUES
  ('09:00:00', '10:00:00'),
  ('10:00:00', '11:00:00'),
  ('11:00:00', '12:00:00');

INSERT INTO genres (genre_name) VALUES
  ('ドラマ'),
  ('アクション'),
  ('コメディ'),
  ('アニメ'),
  ('スポーツ');

INSERT INTO programs (title) VALUES
('プログラム1'),
('プログラム2'),
('プログラム3'),
('プログラム4'),
('プログラム5');

INSERT INTO seasons (program_id, season_number) VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 1);

INSERT INTO episodes (season_id, episode_number, episode_title, episode_description, video_duration, release_date) VALUES
  (1, 1, 'Episode 1', 'This is episode 1', 30, '2023-01-01'),
  (1, 2, 'Episode 2', 'This is episode 2', 25, '2023-01-08'),
  (2, 1, 'Episode 1', 'This is episode 1', 30, '2023-01-01'),
  (2, 2, 'Episode 2', 'This is episode 2', 25, '2023-01-08'),
  (3, 1, 'Episode 1', 'This is episode 1', 30, '2023-01-01'),
  (3, 2, 'Episode 2', 'This is episode 2', 25, '2023-01-08'),
  (4, 1, 'Episode 1', 'This is episode 1', 30, '2023-01-01'),
  (4, 2, 'Episode 2', 'This is episode 2', 25, '2023-01-08');

INSERT INTO program_genres (program_id, genre_id) VALUES
  (1, 1),
  (1, 3),
  (2, 1),
  (2, 2),
  (3, 4),
  (4, 4);

INSERT INTO view_counts (episode_id, channel_id, time_slot_id, view_count) VALUES
  (1, 1, 1, 100),
  (2, 1, 1, 150),
  (3, 2, 2, 200),
  (4, 2, 2, 120),
  (5, 3, 3, 80),
  (6, 3, 3, 60),
  (7, 4, 1, 180),
  (8, 4, 1, 90);
