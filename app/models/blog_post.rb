class BlogPost < ActiveRecord::Base
  has_many :comments
  belongs_to :author
  has_many :categories
  has_and_belongs_to_many :editors

  validates_presence_of :title, :body
end
