class Ibeam
  include Mongoid::Document
  field :_id, type: Integer
  field :Type, type: String
  field :Assigned, type: Boolean
  
  belongs_to :stiffener
end
