class PostSearchBySimple < Post
  set_table_name 'posts'
  set_inheritance_column nil
  
  def self.search(params)
    query = "%#{params['query'].gsub('%', '\%').gsub('_', '\_')}%".downcase
    
    with_scope :find => {:conditions => ['lower(title) like :query or lower(body) like :query', {:query => query}]} do
      paginate :page => params['page'], :per_page => params['per_page'] || 10
    end
  end
end