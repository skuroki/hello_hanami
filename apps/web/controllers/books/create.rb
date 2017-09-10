module Web::Controllers::Books
  class Create
    include Web::Action

    expose :create_result

    def call(params)
      @create_result = BookInteractor::Create.new(params[:book]).call

      if @create_result.success?
        redirect_to routes.books_path
      else
        self.status = 422
      end
    end
  end
end
