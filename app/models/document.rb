class Document < ActiveRecord::Base
  belongs_to :uploadable, polymorphic: true

  enum purpose: [:BLOG_ATTACHMENT]
end
