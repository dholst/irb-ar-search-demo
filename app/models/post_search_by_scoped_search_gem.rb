class PostSearchByScopedSearchGem < Post
  set_table_name 'posts'
  set_inheritance_column nil
  
  scoped_search :on => [:title, :body]
end