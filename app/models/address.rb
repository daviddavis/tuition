class Address < ActiveRecord::Base
  belongs_to :student

  def to_s
    "#{street}, #{city}, #{state} #{zip}"
  end
end
