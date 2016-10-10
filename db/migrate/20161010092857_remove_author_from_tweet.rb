class RemoveAuthorFromTweet < ActiveRecord::Migration[5.0]
  def change
    remove_column :tweets, :author, :string
  end
end
