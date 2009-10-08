module Searchable
  def searchable_by(*column_names) 
    @search_columns = [] 
    [column_names].flatten.each do |name|
      @search_columns << name
    end
  end

  def search_less_simple(params)
    with_scope :find => {:conditions => search_conditions(params['query'])} do 
      paginate :page => params['page'], :per_page => params['per_page'] || 10
    end 
  end
  
  def search_conditions(query, fields=nil) 
    return nil if query.blank? 
    fields ||= @search_columns
  
    # split the query by commas as well as spaces, just in case
    words = query.split(",").map(&:split).flatten
    
    binds = {} 
    or_frags = [] 
    count = 1
    
    words.each do |word|
      like_frags = [fields].flatten.map { |f| "LOWER(#{f}) LIKE :word#{count}" } 
      or_frags << "(#{like_frags.join(" OR ")})" 
      binds["word#{count}".to_sym] = "%#{word.to_s.downcase}%" 
      count += 1
    end

    [or_frags.join(" AND "), binds]
  end 
end