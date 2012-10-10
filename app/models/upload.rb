class Upload
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  field :content_type, :type => String
  field :filename, :type => String
  
  before_create :set_filename, :set_content_type
  after_create :store_file
  after_destroy :delete_file
  
  validates_presence_of :uploaded_file
  
  attr_accessor :uploaded_file
  
  belongs_to :article
  
  def link
    "/data/#{CGI.escape(filename)}"
  end
  
  def src
    file_storage_location
  end
  
  private
  
  def store_file
    File.open(file_storage_location, 'wb') do |f|
      f.write uploaded_file.read
    end
  end
  
  def delete_file
    File.delete(file_storage_location)
  end
  
  def file_storage_location
    File.join(Rails.root, 'public', 'data', filename)
  end
  
  def set_filename
    self.filename = random_prefix + '_' + uploaded_file.original_filename
  end
  
  def set_content_type
    self.content_type = uploaded_file.content_type
  end
  
  def random_prefix
    Digest::SHA1.hexdigest(Time.now.to_s.split(//).sort_by {rand}.join)
  end
end
