class ChangeStatusDefaultInOffersToPending < ActiveRecord::Migration[7.0]
  def change
    change_column_default :offers, :status, from: "pending", to: "Pending"
  end
end
