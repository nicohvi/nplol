class Post < ActiveRecord::Base
	validates :title, 	presence: true, 
						length: {minimum: 5},
						uniqueness: true

	validates :content, presence: true, unless: :meme?

	has_many :comments, dependent: :destroy

  has_many :assets, dependent: :destroy
  accepts_nested_attributes_for :assets, :allow_destroy => true

  acts_as_taggable

  def asset_attributes=(asset_ids)
    assets.clear
    asset_ids.each do |asset_id|
      assets << Asset.find(asset_id)
    end
  end

  def publish!
    self.published = true
  end

  def unpublish!
    self.published = false
  end

  def self.published
    Post.order('created_at DESC').where('published', true)
  end

  def meme?
    self.is_a? Meme
  end

end
