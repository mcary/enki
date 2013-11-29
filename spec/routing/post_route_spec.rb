require 'spec_helper'

describe 'post permalink routing' do
  it "accepts HTML format" do
    { :get => "/2009/06/03/foo-post" }.should route_to({
      "slug" => "foo-post",
      "controller" => "posts",
      "action" => "show",
      "year" => "2009",
      "month" => "06",
      "day" => "03",
    })
  end

  it "rejects rss format" do
    { :get => "/2009/06/03/foo-post.rss" }.should_not be_routable
  end

  it "rejects atom format" do
    { :get => "/2009/06/03/foo-post.atom" }.should_not be_routable
  end
end
