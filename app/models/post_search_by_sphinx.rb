class PostSearchBySphinx < Post
  set_table_name 'posts'
  set_inheritance_column nil
  is_indexed :fields => [
    'title', 
    'body', 
    'published'
  ]
  
  def self.search(params)
    params['per_page'] ||= 10
    params['filters'] = {'published' => 1}
    Ultrasphinx::Search.new(params)
  end
end