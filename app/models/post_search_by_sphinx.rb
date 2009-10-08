class PostSearchBySphinx < Post
  set_table_name 'posts'
  set_inheritance_column nil
  is_indexed :fields => ['title', 'body']
  
  def self.search_for(query)
    Ultrasphinx::Search.new(:query => query).run.results
  end
end