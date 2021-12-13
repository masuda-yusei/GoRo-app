class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :icon, IconUploader

  enum gender: { 男性: 1, 女性: 2, その他: 3 }
end
