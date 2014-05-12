class Author < ActiveRecord::Base
  has_many :blogs

  def to_s
    name
  end
end
