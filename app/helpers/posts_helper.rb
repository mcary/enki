module PostsHelper
  def truncate_body_html(post)
    if truncate_index = post.body_html.index(Post::TRUNCATE_MARKER)
      post.body_html = truncate(post.body_html, :length => truncate_index + 1, :omission => " ") << link_to('Read more...', post_path(post)) << '</p>'
    end
    post
  end
  
  # This isn't strictly correct, but it's a pretty good guess
  # and saves another hit to the DB
  def more_content?
    @posts.size == Post::DEFAULT_LIMIT
  end
end
