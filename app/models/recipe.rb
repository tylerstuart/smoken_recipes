class Recipe < ActiveRecord::Base
  attr_accessible :cooking_time, :description, :directions, :ingredients, :prep_time, :recipe_name

  belongs_to :user

  validates :cooking_time, :presence => true, :length => { :maximum => 20 }
  validates :description,  :presence => true, :length => { :maximum => 140 }
  validates :directions,   :presence => true
  validates :ingredients,  :presence => true
  validates :prep_time,    :presence => true, :length => { :maximum => 20 }
  validates :recipe_name,  :presence => true, :length => { :maximum => 40}
  validates :user_id,      :presence => true 

  default_scope :order => 'recipes.created_at DESC'
end
