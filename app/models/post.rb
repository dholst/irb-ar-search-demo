class Post < ActiveRecord::Base
  default_scope :order => 'created_at DESC'
  named_scope :published, {:conditions => ["published = ?", true]}
end
