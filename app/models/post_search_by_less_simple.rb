class PostSearchByLessSimple < Post
  set_table_name 'posts'
  set_inheritance_column nil
  
  searchable_by :title, :body
  
  def self.search(params)
    search_less_simple(params)
  end
end