require_relative 'lib/database_connection'
require_relative 'lib/book'
require_relative 'lib/book_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store')

# Challenge 
repo = BookRepository.new
books = repo.all

books.each do |book|
  puts "#{book.id} - #{book.title} - #{book.author_name}"
end

# Desired output
# 1 - Nineteen Eighty-Four - George Orwell
# 2 - Mrs Dalloway - Virginia Woolf
# 3 - Emma - Jane Austen
# 4 - Dracula - Bram Stoker
# 5 - The Age of Innocence - Edith Wharton