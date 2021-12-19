class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :icon, IconUploader

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user


  enum gender: { 男性: 1, 女性: 2, その他: 3 }
  enum residence: { "---":0,
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
    沖縄県:47 }
  enum golf_history: { '1年': 1, '2年': 2, '3年': 3, '4年': 4, '5年以上': 5, '10年以上': 6, '15年以上': 7 }
  enum average_score: { '60': 1, '65': 2, '70': 3, '75': 4, '80': 5, '85': 6, '90': 7, '95': 8, '100': 9, '105': 10, '110': 11, '115': 12, '120': 13, '125': 14, '130': 15, '135': 16, '140': 17 }
  enum playable_date: { '土日': 1, '平日': 2, '土日・平日どちらも可': 3 }
  enum pick_up: { '送迎お願いします': 1, '自分でゴルフ場に行けます': 2 }
  
  validates :residence, presence: true
  validates :introduction, length: { maximum: 1000 }
end
