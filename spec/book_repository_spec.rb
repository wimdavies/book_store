require 'book_repository'
require 'book'

def reset_books_table
  seed_sql = File.read('spec/seeds_books.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

RSpec.describe BookRepository do
  before(:each) do 
    reset_books_table
  end

  it 'returns list of all books' do
    repo = BookRepository.new
    books = repo.all

    expect(books.length).to eq 3
    expect(books[0].id).to eq '1'
    expect(books[0].title).to eq 'Frankenstein'
    expect(books[0].author_name).to eq 'Mary Shelley'
    expect(books[1].id).to eq '2'
    expect(books[1].title).to eq 'Anna Karenina'
    expect(books[1].author_name).to eq 'Leo Tolstoy'
    expect(books[2].id).to eq '3'
    expect(books[2].title).to eq 'The Lord of the Rings'
    expect(books[2].author_name).to eq 'J. R. R. Tolkien'
  end
end