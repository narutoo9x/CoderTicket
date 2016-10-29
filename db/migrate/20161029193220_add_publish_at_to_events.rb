class AddPublishAtToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :publish_at, :datetime
  end
end
