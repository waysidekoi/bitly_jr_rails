class Url < ActiveRecord::Base
  attr_accessible :full_url, :shortened_url


  validates :shortened_url, :uniqueness => true
  validates :full_url, :format => { :with => /^(http|https):\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?$/,
                                    :message => "needed (include http://)" }


  
end
