module Web::Views::Books
  class Create
    include Web::View
    template 'books/new'

    def error_messages
      create_result.error.each_with_object([]) do |(key, messages), result|
        k = Hanami::Utils::String.new(key).titleize

        _messages = if messages.is_a?(Hash)
                      error_messages(messages)
                    else
                      messages.map { |message| "#{k} #{message}" }
                    end

        result.concat(_messages)
      end
    end
  end
end
