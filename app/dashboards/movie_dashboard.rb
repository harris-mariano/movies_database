require "administrate/base_dashboard"

class MovieDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    title: Field::String,
    release_year: Field::String,
    genre: Field::String,
    director: Field::String,
    story: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    image: Field::Paperclip.with_options(
      thumbnail_style: 'original'
    ),
    casts: Field::HasMany,
    actors: Field::HasMany,
    reviews: Field::HasMany,
    favorites: Field::HasMany,
    users: Field::HasMany,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    image
    id
    title
    director
    release_year
    genre
    reviews
    favorites
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    image
    title
    release_year
    genre
    director
    story
    created_at
    updated_at
    reviews
    favorites
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    title
    release_year
    genre
    director
    story
    image
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how movies are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(movie)
  #   "Movie ##{movie.id}"
  # end
end
