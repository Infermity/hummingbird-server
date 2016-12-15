class PostResource < BaseResource
  caching

  attributes :content, :content_formatted, :comments_count, :post_likes_count,
    :spoiler, :nsfw, :blocked, :deleted_at, :created_at, :updated_at,
    :top_level_comments_count, :edited_at

  has_one :user
  has_one :target_user
  has_one :media, polymorphic: true
  has_one :spoiled_unit, polymorphic: true
  has_many :post_likes
  has_many :comments
end
