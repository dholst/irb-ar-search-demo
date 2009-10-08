module Searchable
  def searchable_by(*column_names) 
    @search_columns = [] 
    [column_names].flatten.each do |name|
      @search_columns << name
    end
  end

  def search_less_simple(query, fields=nil, options={}) 
    with_scope :find => {:conditions => search_conditions(query, fields) } do 
      find :all, options
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