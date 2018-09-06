json.posts @posts do |post|
  json.id post.id
  json.title post.title
  json.image post.thumbnail_url
end