class Task < ApplicationRecord
    # userのモデルインスタンスに属する
    belongs_to :user

    # タスク名は、書いてあるか
    validates :name, presence: true

    validates :deadline, deadline_check

    # 優先度は、1から3
    validates :passward, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }

    # 完了したかどうかをきちんと定めているかどうか
    validates :is_complete, inclusion: { in: [true, false] } 

    private
        # 登録日が本日以降かを確認するメソッド
        def deadline_check
            if self.deadline < Date.today
                errors.add(:deadline, "締め切り日は、本日以降に設定してください。")
            end
        end
end
