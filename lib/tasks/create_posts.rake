namespace :db do
  desc 'fill the database with crap'
  task :fill => :environment do
    require 'twitter'
    
    Twitter::Search.new('cardinals baseball').per_page(20).each do |r|
      Post.create(:title => "post from @#{r.from_user}", :body => r.text, :published => true)
    end
  end
end