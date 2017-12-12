class Stiffener
  include Mongoid::Document
  field :Pos, type: String
  field :Height, type: Float
  field :Width, type: Float
  field :Chamfer, type: Float
  
  has_many :ibeams
  
  accepts_nested_attributes_for :ibeams, :allow_destroy => false, :autosave => true
end
