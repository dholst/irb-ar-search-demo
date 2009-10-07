class PostSearchBySql < Post
  set_table_name 'posts'
  set_inheritance_column nil
  
  def self.search_for(query)
    find :all, :conditions => ['title like ? or body like ?', like(query), like(query)]
  end
  
  def self.like(query)
    "%#{query.gsub ('%', '\%').gsub ('_', '\_')}%"
  end
end