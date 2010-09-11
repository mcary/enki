require File.dirname(__FILE__) + '/../spec_helper'

describe PostsHelper do
  include PostsHelper

  before(:all) do
    @post = Post.new(:title => 'A Post',
                     :slug => 'a-post',
                     :body => "Lorem ipsum.#{Post::TRUNCATE_MARKER}\n\ndolor sit amet, consectetur adipiscing elit.")
    
    @post.save
  end
  
  after(:all) do
    @post.delete
  end

  describe '#truncate_body_html' do
    it 'should truncate post body html' do
      truncate_body_html(@post).body_html.length.should == 56
    end

    it 'should ensure that truncated post includes read more link' do
      truncate_body_html(@post).body_html.match('<a href=".*">Read more...</a>').should_not be_nil
    end
  end
end
