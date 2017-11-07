module Api::V1
	class AuthorsController < Api::BaseController
		skip_before_action :verify_authenticity_token

		def create
			author = Author.create(author_params)
			if author.present?
				author.books << Book.find(params[:book_ids])
 				success({}, "New Author has been created successfully!")
			else
				error(500, "error")
 			end
		end

	  private

    def author_params
      params.require(:author).permit(:first_name, :family_name, :phone_number, :date_of_birth)
    end
	end
end