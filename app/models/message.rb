class Message < ApplicationRecord
  belongs_to :talk
  belongs_to :user

  # メッセージの内容やひもづく会話、ユーザのIDが値が空でないかをチェックする
  validates_presence_of :content, :talk_id, :user_id

  # 画面上に表示させる作成日は時刻をフォーマットに従って表示する
  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end  
end
