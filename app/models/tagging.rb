class Tagging < ActiveRecord::Base
  extend ValidationsHelper
  #  Join table for tags and taggable(polymorph)
  #  t.integer  "tag_id",   :null => false
  #  t.integer  "taggable_id",   :null => false
  #  t.string   "taggable_type", :null => false
  #  t.datetime "created_at"
  belongs_to :tag
  belongs_to :taggable, :polymorphic => true

  validates_polymorphic_type :taggable_type
  validates_numericality_of  :tag_id,:greater_tham=>0
  validates_numericality_of  :taggable_id,:greater_than=>0
  
  def before_destroy
    # disallow orphaned tags
    tag.destroy_without_callbacks if tag.taggings.count < 2  
  end
  
  def to_s
    ':'+tag.name.inspect
  end
  
  def self.link(params_tag,params_tagging)
    tgng = Tagging.new(params_tagging)
    object=tgng.taggable
    tgng = Tagging.delete_all(params_tagging)
    tags=params_tag[:name]
    tags.split(/[ ,]/).compact.each do |tag_name|
      tg = Tag.find(:first,:conditions=>{:name=>tag_name})
      tg = Tag.create(:name=>tag_name) if !tg
      if(tg)       
        tgng = Tagging.new(params_tagging)
        tgng.tag_id=tg.id
        tgng.save
      end
    end
    return object
  end
  
end
