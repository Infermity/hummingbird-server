class AlgoliaUsersIndex < BaseIndex
  self.index_name = 'users'

  attributes :name, :past_names
  attribute :followers_count, frequency: 2.5
  attribute :avatar, format: AttachmentValueFormatter
  has_many :group_members, as: :id
end
