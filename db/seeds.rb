p "create Users"
User.create!(
  email: 'user1@gmail.com',
  password: '11111111',
  name: 'タケル',
  self_introduction: '最近ゴルフ始めました！',
  gender: 0,
  profile_image: open("#{Rails.root}/db/dummy_images/1.jpg")
)
User.create!(
  email: 'user2@gmail.com',
  password: '11111111',
  name: 'ミカ',
  self_introduction: 'ゴルフ初心者です！',
  gender: 1,
  profile_image: open("#{Rails.root}/db/dummy_images/2.jpg")
)
User.create!(
  email: 'user3@gmail.com',
  password: '11111111',
  name: 'エヴァ',
  self_introduction: 'プロフィールをご覧いただきありがとうございます。週に2回ゴルフ練習してます・',
  gender: 0,
  profile_image: open("#{Rails.root}/db/dummy_images/3.jpg")
)
User.create!(
  email: 'user4@gmail.com',
  password: '11111111',
  name: 'ノア',
  self_introduction: '最近になってゴルフハマりました！',
  gender: 0,
  profile_image: open("#{Rails.root}/db/dummy_images/4.jpg")
)
User.create!(
  email: 'user5@gmail.com',
  password: '11111111',
  name: 'リアム',
  self_introduction: '関東在住の方一緒にゴルフ行きましょう！',
  gender: 0,
  profile_image: open("#{Rails.root}/db/dummy_images/5.jpg")
)
User.create!(
  email: 'user6@gmail.com',
  password: '11111111',
  name: 'オリバー',
  self_introduction: '平均スコア80くらいです。',
  gender: 0,
  profile_image: open("#{Rails.root}/db/dummy_images/6.jpg")
)