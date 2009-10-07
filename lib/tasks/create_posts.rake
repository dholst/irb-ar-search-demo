namespace :db do
  desc 'fill the database with crap'
  task :fill => :environment do
    require 'twitter'
    
    Twitter::Search.new('ruby rails').per_page(200).each do |r|
      Post.create(:title => "A thoughtful post from @#{r.from_user}", :body => r.text, :published => true)
    end
  end
end