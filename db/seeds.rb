# admin = User.create!(
#   name:"GoRo公式アカウント",
#   email:"admin@gmail.com",
#   password:"111111",
#   admin: true,
#   confirmed_at: Time.now
# )q

user1 = User.create!(
  name: "Yusei",
  email: "7575you@gmail.com",
  password: "111111",
  confirmed_at: Time.now
)
user2 = User.create!(
  name: "Yumi",
  email: "test1@gmail.com",
  password: "111111",
  confirmed_at: Time.now
)
user3 = User.create!(
  name: "Yamada",
  email: "test2@gmail.com",
  password: "111111",
  confirmed_at: Time.now
)
user4 = User.create!(
  name: "Toshi",
  email: "test3@gmail.com",
  password: "111111",
  confirmed_at: Time.now
)
user5 = User.create!(
  name: "Kei",
  email: "test4@gmail.com",
  password: "111111",
  confirmed_at: Time.now
)

# ゲスト管理者ログイン
user6 = User.create!( 
  name: "admin",
  email: "guest_admin@example.com",
  password: "111111",
  confirmed_at: Time.now,
  admin: true )


# ゲストログイン
user7 = User.create!(
  name: 'Guest User',
  email: 'guest@example.com',
  password: '111111',
  confirmed_at: Time.now)


profile1 = user1.build_profile(
  # id: user１.id,
  icon: open("./app/assets/images/profile1.jpg"),
  gender: "男性",
  birthday: "1994-09-02",
  residence: 1,
  golf_history: 6,
  average_score: 5,
  annual_round_time: 10,
  playable_date: 3,
  pick_up: 2,
  introduction: "学生時代からゴルフを始めました！　よろしくお願いします！"
)
profile1.save

profile2 = user2.build_profile(
  # id: user2.id,
  icon: open("./app/assets/images/profile2.jpg"),
  gender: "女性",
  birthday: "1995-08-02",
  residence: 2,
  golf_history: 4,
  average_score: 8,
  annual_round_time: 8,
  playable_date: 2,
  pick_up: 1,
  introduction: "ベストスコア90です！　よろしくお願いします！"
)
profile2.save

profile3 = user3.build_profile(
  # id: user3.id,
  icon: open("./app/assets/images/profile3.jpg"),
  gender: "男性",
  birthday: "1996-07-11",
  residence: 3,
  golf_history: 2,
  average_score: 7,
  annual_round_time: 7,
  playable_date: 3,
  pick_up: 2,
  introduction: "一緒にラウンドしましょう！"
)
profile3.save

profile4 = user4.build_profile(
  # id: user4.id,
  icon: open("./app/assets/images/profile4.jpg"),
  gender: "男性",
  birthday: "1990-07-11",
  residence: 4,
  golf_history: 1,
  average_score: 11,
  annual_round_time: 3,
  playable_date: 3,
  pick_up: 2,
  introduction: "最近趣味でゴルフ始めました！ 一緒にラウンド楽しみましょう！"
)
profile4.save

profile5 = user5.build_profile(
  # id: user5.id,
  icon: open("./app/assets/images/profile5.jpg"),
  gender: "男性",
  birthday: "1988-07-11",
  residence: 5,
  golf_history: 1,
  average_score: 12,
  annual_round_time: 4,
  playable_date: 1,
  pick_up: 1,
  introduction: "初心者ですが、よろしくお願いします！"
)
profile5.save


# ゲスト管理者ログイン
profile6 = user6.build_profile(
  icon: open("./app/assets/images/profile6.jpg"),
  gender: "男性",
  birthday: "1",
  residence: 5,
  golf_history: 1,
  average_score: 12,
  annual_round_time: 4,
  playable_date: 1,
  pick_up: 1,
  introduction: "初心者ですが、よろしくお願いします！"
)
profile6.save

# ゲストログイン
profile7 = user7.build_profile(
  icon: open("./app/assets/images/profile7.jpg"),
  gender: "男性",
  introduction: "はじめまして。宜しくお願いします。"
)
profile7.save

Favorite.create!(
  user_id: user1.id,
  profile_id: profile1.id
)
Favorite.create!(
  user_id: user2.id,
  profile_id: profile2.id
)
Favorite.create!(
  user_id: user4.id,
  profile_id: profile2.id
)
Favorite.create!(
  user_id: user5.id,
  profile_id: profile2.id
)
Favorite.create!(
  user_id: user3.id,
  profile_id: profile2.id
)

talk1 = Talk.create!(
  sender_id: user1.id,
  receiver_id: user2.id,
)

talk2 = Talk.create!(
  sender_id: user3.id,
  receiver_id: user4.id,
)

talk3 = Talk.create!(
  sender_id: user1.id,
  receiver_id: user3.id,
)

talk4 = Talk.create!(
  sender_id: user2.id,
  receiver_id: user4.id,
)

talk5 = Talk.create!(
  sender_id: user1.id,
  receiver_id: user5.id,
)

Message.create!(
  content: "こんにちは",
  talk_id: talk1.id,
  user_id: user1.id,
  read: true,
)
Message.create!(
  content: "はじめまして！",
  talk_id: talk1.id,
  user_id: user2.id,
  read: false,
)
Message.create!(
  content: "ありがとうございました！",
  talk_id: talk2.id,
  user_id: user3.id,
  read: true,
)
Message.create!(
  content: "楽しかったです!",
  talk_id: talk2.id,
  user_id: user4.id,
  read: true,
)
Message.create!(
  content: "またゴルフ一緒に行きましょう!",
  talk_id: talk2.id,
  user_id: user3.id,
  read: false,
)

Blog.create!(
  title: "ベストスコア",
  content: "ベストスコア80出せました！",
  user_id: user1.id,
)
Blog.create!(
  title: "トーナメント",
  content: "宮崎県のゴルフトーナメントで優勝できましたV",
  user_id: user1.id,
)

Blog.create!(
  title: "初ラウンド",
  content: "ゴルフ初ラウンド、すごく楽しかった!",
  user_id: user5.id,
)

Blog.create!(
  title: "バンカー",
  content: "バンカーに苦戦して、スコア伸び悩んだ（ ;  ; ） バンカーの練習をもっとしよう！",
  user_id: user2.id,
)

Blog.create!(
  title: "トーナメント観戦",
  content: "プロの技術力に圧倒された。自分もプロみたいに上手くなれるよう練習しよう。",
  user_id: user4.id,
)