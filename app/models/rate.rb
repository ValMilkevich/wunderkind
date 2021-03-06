class Rate < ActiveRecord::Base
 extend ValidationsHelper
  
  belongs_to :ratable, :polymorphic=>true
  
  validates_presence_of :ratable_id,:greater_than=>0
  validates_presence_of :ratable_type,:greater_than=>0
  validates_numericality_of :value, :greater_than_or_equal_to=>0
  validates_numericality_of :ratable_id, :greater_than_or_equal_to=>0
  
  validates_polymorphic_type :ratable_type
  
end
