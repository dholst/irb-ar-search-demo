class PostSearchBySphinx < Post
  set_table_name 'posts'
  set_inheritance_column nil
  is_indexed :fields => [
    'title', 
    'body', 
    'published'
  ]
  
  def self.search(params)
    Ultrasphinx::Search.new(params.merge({:filters => {'published' => 1}}))
  end
end