module Api::V1
	class BooksController < Api::BaseController
		skip_before_action :verify_authenticity_token

		def index
			@books = paginate Book.includes(:authors).all
			success()
		end

	end
end