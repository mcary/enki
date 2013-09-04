require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/comments/index.html" do
  after(:each) do
    rendered.should be_valid_html5_fragment
  end

  it 'should render' do
    comments = [Factory.create(:comment)]
    comments.stub!(:total_pages).and_return(1)
    assign :comments, comments
    render :template => '/admin/comments/index', :formats => [:html]
  end
end
