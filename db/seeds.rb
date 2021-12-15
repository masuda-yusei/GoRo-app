user1 = User.create!(
  id: 1,
  name: "Yusei",
  email: "you@gmail.com,
  password: "111111",
  admin: true,
  confirmed_at: Time.now,
)
user2 = User.create!(
  id: 2,
  name: "Yoshiki",
  email: "yoshi@gmail.com",
  password: "111111",
  confirmed_at: Time.now,
)
user3 = User.create!(
  id: 3,
  name: "Yamada",
  email: "yamada@gmail.com",
  password: "111111",
  confirmed_at: Time.now,
)
user4 = User.create!(
  id: 4,
  name: "Toshi",
  email: "toshi@gmail.com",
  password: "111111",
  confirmed_at: Time.now,
)
user5 = User.create!(
  id: 5,
  name: "Kei",
  email: "kei@gmail.com",
  password: "111111",
  confirmed_at: Time.now,
)

profile1 = user1.build_profile(
  id: user1.id,
  icon: "profile.jpg",
  gender: "男性",
  birthday: "1994-09-02",
  residence: "宮崎県",
  introduction: "学生時代からゴルフを始めました！　よろしくお願いします！"
)
profile1.save

profile2 = user2.build_profile(
  id: user2.id,
  icon: "profile.jpg",
  gender: "男性",
  birthday: "1995-08-02",
  residence: "東京都",
  introduction: "ベストスコア80です！　よろしくお願いします！"
)
profile2.save

profile3 = user3.build_profile(
  id: user3.id,
  icon: "profile.jpg",
  gender: "男性",
  birthday: "1996-07-11",
  residence: "福岡県",
  introduction: "一緒にラウンドしましょう！"
)
profile3.save

profile4 = user4.build_profile(
  id: user4.id,
  icon: "profile.jpg",
  gender: "男性",
  birthday: "1990-07-11",
  residence: "大分県",
  introduction: "最近趣味でゴルフ始めました！"
)
profile4.save

profile5 = user5.build_profile(
  id: user5.id,
  icon: "profile.jpg",
  gender: "男性",
  birthday: "1988-07-11",
  residence: "鹿児島県",
  introduction: "初心者ですが、よろしくお願いします！"
)
profile5.save

golf_information1 = user1.build_golf_information(
  id: user1.id,
  Golf_History: "5年以上"
  Average_Score: 85,
  Annual_Round_Times: "10回"
  Playable_Date: "2021-12-24"
  Pick_Up: 自分でゴルフ場に行けます
)
golf_information1.save

golf_information2 = user2.build_golf_information(
  id: user2.id,
  Golf_History: "2年"
  Average_Score: 90,
  Annual_Round_Times: "6回"
  Playable_Date: "2021-12-25"
  Pick_Up: 送迎お願いします
)
golf_information2.save

golf_information3 = user3.build_golf_information(
  id: user3.id,
  Golf_History: "3年"
  Average_Score: 95,
  Annual_Round_Times: "4回"
  Playable_Date: "2021-12-26"
  Pick_Up: 送迎お願いします
)
golf_information3.save

golf_information4 = user4.build_golf_information(
  id: user4.id,
  Golf_History: "10年"
  Average_Score: 75,
  Annual_Round_Times: "20回"
  Playable_Date: "2021-12-27"
  Pick_Up: 自分でゴルフ場に行けます
)
golf_information4.save

golf_information5 = user5.build_golf_information(
  id: user5.id,
  Golf_History: "1年未満"
  Average_Score: 110,
  Annual_Round_Times: "2回"
  Playable_Date: "2021-12-28"
  Pick_Up: 送迎お願いします
)
golf_information5.save

Favorite.create!(
  user_id: 5
)
Favorite.create!(
  user_id: 2
)
Favorite.create!(
  user_id: 4
)
Favorite.create!(
  user_id: 5
)
Favorite.create!(
  user_id: 1
)

Talk.create!(
  id: 1,
  sender_id: 1,
  receiver_id: 2,
)

Talk.create!(
  id: 2,
  sender_id: 3,
  receiver_id: 4,
)
Talk.create!(
  id: 3,
  sender_id: 1,
  receiver_id: 3,
)
Talk.create!(
  id: 4,
  sender_id: 2,
  receiver_id: 4,
)
Talk.create!(
  id: 5,
  sender_id: 1,
  receiver_id: 5,
)

Message.create!(
  content: "こんにちは",
  talk_id: 1,
  user_id: 2,
  read: true,
)
Message.create!(
  content: "はじめまして！",
  talk_id: 1,
  user_id: 1,
  read: true,
)
Message.create!(
  content: "ありがとうございました！",
  talk_id: 2,
  user_id: 3,
  read: true,
)
Message.create!(
  content: "楽しかったです!",
  talk_id: 2,
  user_id: 4,
  read: true,
)
Message.create!(
  content: "またゴルフ一緒に行きましょう!",
  talk_id: 2,
  user_id: 3,
  read: false,
)


Blog.create!(
  title: "ベストスコア",
  content: "ベストスコア80出せました！",
  user_id: 1,
)
Blog.create!(
  title: "トーナメント",
  content: "宮崎県のゴルフトーナメントで優勝できましたV",
  user_id: 1,
)

Blog.create!(
  title: "初ラウンド",
  content: "ゴルフ初ラウンド、すごく楽しかった!",
  user_id: 5,
)

Blog.create!(
  title: "バンカー",
  content: "バンカーに苦戦して、スコア伸び悩んだ（ ;  ; ） バンカーの練習をもっとしよう！",
  user_id: 2,
)

Blog.create!(
  title: "トーナメント観戦",
  content: "プロの技術力に圧倒された。自分もプロみたいに上手くなれるよう練習しよう。",
  user_id: 4,
) 