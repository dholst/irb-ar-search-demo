class PostSearchByLessSimple < Post
  set_table_name 'posts'
  set_inheritance_column nil
  
  searchable_by :title, :body
  
  def self.search_for(query)
    search_less_simple(query)
  end
end