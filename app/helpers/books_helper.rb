module BooksHelper
  def subscription_link(user, book)
    if SUBSCRIPTION::Subscribe.new(user, book).is_subscriber?
      link_to 'Unsubscribe Book', unsubscribe_book_path(book), class: 'btn btn-warning btn-lg btn-block'
    else
      link_to 'Subscribe Book', subscribe_book_path(book), class: 'btn btn-success btn-lg btn-block'
    end
  end
end
