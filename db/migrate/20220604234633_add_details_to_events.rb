class AddDetailsToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :logo_url, :text
    add_column :events, :website_url, :string
    add_column :events, :organization_name, :string
  end
end
