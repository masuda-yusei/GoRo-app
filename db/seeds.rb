admin = User.create!(
  name:"GoRo公式アカウント",
  email:"admin_user@gmail.com",
  password:"111111",
  admin: true,
  confirmed_at: Time.now,
)

user1 = User.create!(
  name: "Yusei",
  email: "yusei@gmail.com",
  password: "111111",
  admin: true,
  confirmed_at: Time.now,
)
user2 = User.create!(
  name: "Yoshiki",
  email: "yoshiki@gmail.com",
  password: "111111",
  confirmed_at: Time.now,
)
user3 = User.create!(
  name: "Yamada",
  email: "yamada@gmail.com",
  password: "111111",
  confirmed_at: Time.now,
)
user4 = User.create!(
  name: "Toshi",
  email: "toshi@gmail.com",
  password: "111111",
  confirmed_at: Time.now,
)
user5 = User.create!(
  name: "Kei",
  email: "kei@gmail.com",
  password: "111111",
  confirmed_at: Time.now,
)

profile1 = user1.build_profile(
  # id: user1.id,
  icon: "profile.jpg",
  gender: "男性",
  birthday: "1994-09-02",
  residence: 1,
  introduction: "学生時代からゴルフを始めました！　よろしくお願いします！"
)
profile1.save

profile2 = user2.build_profile(
  # id: user2.id,
  icon: "profile.jpg",
  gender: "男性",
  birthday: "1995-08-02",
  residence: 2,
  introduction: "ベストスコア80です！　よろしくお願いします！"
)
profile2.save

profile3 = user3.build_profile(
  # id: user3.id,
  icon: "profile.jpg",
  gender: "男性",
  birthday: "1996-07-11",
  residence: 3,
  introduction: "一緒にラウンドしましょう！"
)
profile3.save

profile4 = user4.build_profile(
  # id: user4.id,
  icon: "profile.jpg",
  gender: "男性",
  birthday: "1990-07-11",
  residence: 4,
  introduction: "最近趣味でゴルフ始めました！"
)
profile4.save

profile5 = user5.build_profile(
  # id: user5.id,
  icon: "profile.jpg",
  gender: "男性",
  birthday: "1988-07-11",
  residence: 5,
  introduction: "初心者ですが、よろしくお願いします！"
)
profile5.save

# golf_information1 = user1.build_golf_information(
#   id: user1.id,
#   Golf_History: "5年以上",
#   Average_Score: "85",
#   Annual_Round_Times: "10回",
#   Playable_Date: "2021-12-24",
#   Pick_Up: "自分でゴルフ場に行けます"
# )
# golf_information1.save

# golf_information2 = user2.build_golf_information(
#   id: user2.id,
#   Golf_History: "2年",
#   Average_Score: "90",
#   Annual_Round_Times: "6回",
#   Playable_Date: "2021-12-25",
#   Pick_Up: "送迎お願いします"
# )
# golf_information2.save

# golf_information3 = user3.build_golf_information(
#   id: user3.id,
#   Golf_History: "3年",
#   Average_Score: "95",
#   Annual_Round_Times: "4回",
#   Playable_Date: "2021-12-26",
#   Pick_Up: "送迎お願いします"
# )
# golf_information3.save

# golf_information4 = user4.build_golf_information(
#   id: user4.id,
#   Golf_History: "10年",
#   Average_Score: "75",
#   Annual_Round_Times: "20回",
#   Playable_Date: "2021-12-27",
#   Pick_Up: "自分でゴルフ場に行けます"
# )
# golf_information4.save

# golf_information5 = user5.build_golf_information(
#   id: user5.id,
#   Golf_History: "1年未満",
#   Average_Score: "110",
#   Annual_Round_Times: "2回",
#   Playable_Date: "2021-12-28",
#   Pick_Up: "送迎お願いします"
# )
# golf_information5.save

Favorite.create!(
  user_id: user1.id
)
Favorite.create!(
  user_id: user2.id
)
Favorite.create!(
  user_id: user4.id
)
Favorite.create!(
  user_id: user5.id
)
Favorite.create!(
  user_id: user3.id
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