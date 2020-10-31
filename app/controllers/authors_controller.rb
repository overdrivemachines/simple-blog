class AuthorsController < ApplicationController
  before_action :authenticate_author!

  # Specify layout file
  # (Different look for authors)
  layout 'authors'
end