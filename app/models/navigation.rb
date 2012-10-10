class Navigation
  include Mongoid::Document
  
  field :name, :type => String
  field :title, :type => String
  field :sort, :type => Integer
  
  has_many :articles
end
