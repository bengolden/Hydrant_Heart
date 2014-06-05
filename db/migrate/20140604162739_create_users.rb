class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_hash
      t.string :image_url default: "http://fc08.deviantart.net/fs70/f/2012/199/4/3/eddsworld___unknown_profile_by_xnamenloserx-d57qvfm.jpg"

      t.timestamps
    end
  end
end
