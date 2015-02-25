class AddOmniauthFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :twitter_consumer, :string
    add_column :users, :twitter_consumer_secret, :string
    add_column :users, :omniauth_raw_data, :text

    add_index :users, [:provider, :uid] # will access users and provider togehter when either is called ( 'composite index')

    remove_index :users, :email #remove old index
    add_index :users, :email  #add new one
  end
end
