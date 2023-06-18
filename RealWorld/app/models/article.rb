class Article < ApplicationRecord

  after_validation :create_slug, only: [:create, :update]

  private

  def create_slug
    self.slug = self.title.parameterize.underscore
  end
end
