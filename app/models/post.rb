class Post < ActiveRecord::Base
  belongs_to :user
  mount_uploader :cover, CoverUploader

  def self.search(query)
    where("lower(title) like ? or lower(content) like ?", "%#{query.downcase}%", "%#{query.downcase}%")
  end
end