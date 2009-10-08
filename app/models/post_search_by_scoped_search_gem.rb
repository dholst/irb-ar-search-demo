class PostSearchByScopedSearchGem < Post
  set_table_name 'posts'
  set_inheritance_column nil
  
  scoped_search :on => [:title, :body]
  
  def self.search(params)
    search_for(params['query']).paginate(:page => params['page'], :per_page => params['per_page'] || 10)
  end
end