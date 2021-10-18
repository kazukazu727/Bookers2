class AddColumnUser < ActiveRecord::Migration[5.2]
  def change
    add_colum :introduction, :text

    add_colum :profile_image_id, :integer
  end
end
