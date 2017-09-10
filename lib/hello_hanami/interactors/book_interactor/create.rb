require 'hanami/interactor'
require 'hanami/validations'

module BookInteractor
  class Create
    class Validation
      include Hanami::Validations

      validations do
        required(:title).filled(:str?)
        required(:author).filled(:str?)
      end
    end

    include Hanami::Interactor
    expose :book

    def initialize(params)
      @params = params
    end

    def call
      @book = BookRepository.new.create(@params)
    end

    private

    def valid?
      @validate_result = Validation.new(@params).validate

      if @validate_result.failure?
        error(@validate_result.messages)
      end

      @validate_result.success?
    end
  end
end
