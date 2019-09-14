class Activity < ApplicationRecord
  belongs_to :seller, class_name: 'User'
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :name, :address, :type_activity, :price, :description, presence: true
  validates :max_participants, :seller, presence: true
  validates :price, :max_participants, numericality: { only_integer: true }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include AlgoliaSearch

  algoliasearch per_environment: true do
    # the list of attributes sent to Algolia's API
    attribute :name, :address, :description
    # integer version of the created_at datetime field, to use numerical filtering


    # `title` is more important than `{story,comment}_text`, `{story,comment}_text` more than `url`, `url` more than `author`
    # btw, do not take into account position in most fields to avoid first word match boost
    searchableAttributes ['unordered(name)', 'unordered(address)', 'description']
  end

  #   # tags used for filtering
  #   tags do
  #     [item_type, "author_#{author}", "story_#{story_id}"]
  #   end

  #   # use associated number of HN points to sort results (last sort criteria)
  #   customRanking ['desc(points)', 'desc(num_comments)']

  #   # google+, $1.5M raises, C#: we love you
  #   separatorsToIndex '+#$'
  # end

  # def story_text
  #   item_type_cd != Item.comment ? text : nil
  # end

  # def story_title
  #   comment? && story ? story.title : nil
  # end

  # def story_url
  #   comment? && story ? story.url : nil
  # end

  # def comment_text
  #   comment? ? text : nil
  # end

  # def comment?
  #   item_type_cd == Item.comment
  # end

  # # [...]
end
