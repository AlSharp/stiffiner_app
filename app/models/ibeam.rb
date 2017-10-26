class Ibeam
  include Mongoid::Document
  field :Type, type: String
  
  belongs_to :stiffener
end
