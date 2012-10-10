class Article
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  
  field :name
  field :content
  field :published_on, :type => Date
  
  belongs_to :navigation
  has_many :uploads
end
