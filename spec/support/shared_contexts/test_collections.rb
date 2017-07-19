require_relative '../book'

shared_context 'test collections' do
  let(:rowling) { 'J.K. Rowling' }
  let(:tolkien) { 'J.R.R. Tolkien' }
  let(:martin)  { 'Stephen King' }
  let(:king)    { 'George R.R. Martin' }

  let(:book_collection) do
    [
      Book.new(
        name: "Harry Potter and the Sorcerer's Stone",
        price: 84.83,
        author: rowling
      ),
      Book.new(
        name: 'Harry Potter and the Chamber of Secrets',
        price: 58.21,
        author: rowling
      ),
      Book.new(
        name: 'Harry Potter and the Prisoner of Azkaban',
        price: 83.32,
        author: rowling
      ),
      Book.new(
        name: 'Harry Potter and the Goblet of Fire',
        price: 58.21,
        author: rowling
      ),
      Book.new(
        name: 'Harry Potter and the Order of the Phoenix',
        price: 88.65,
        author: rowling
      ),
      Book.new(
        name: 'Harry Potter and the Half-Blood Prince',
        price: 71.16,
        author: rowling
      ),
      Book.new(
        name: 'Harry Potter and the Deathly Hallows',
        price: 87.94,
        author: rowling
      ),
      Book.new(
        name: 'The Hobbit',
        price: 57.89,
        author: tolkien
      ),
      Book.new(
        name: "Bilbo's Last Song",
        price: 98.43,
        author: tolkien
      ),
      Book.new(
        name: 'The Silmarillion',
        price: 50.76,
        author: tolkien
      ),
      Book.new(
        name: 'The Lord of the Rings - The Fellowship of the Ring',
        price: 90.82,
        author: tolkien
      ),
      Book.new(
        name: 'The Lord of the Rings - The Two Towers',
        price: 92.88,
        author: tolkien
      ),
      Book.new(
        name: 'The Lord of the Rings - The Return of the King',
        price: 72.56,
        author: tolkien
      ),
      Book.new(
        name: 'A Game of Thrones',
        price: 59.62,
        author: martin
      ),
      Book.new(
        name: 'A Clash of Kings',
        price: 62.23,
        author: martin
      ),
      Book.new(
        name: 'A Storm of Sword',
        price: 57.45,
        author: martin
      ),
      Book.new(
        name: 'A Feast for Crow',
        price: 91.63,
        author: martin
      ),
      Book.new(
        name: 'A Dance with Dragons',
        price: 62.34,
        author: martin
      ),
      Book.new(
        name: 'The Dark Tower: The Gunslinger',
        price: 69.77,
        author: king
      ),
      Book.new(
        name: 'The Dark Tower II: The Drawing of the Three',
        price: 75.47,
        author: king
      ),
      Book.new(
        name: 'The Dark Tower III: The Waste Lands',
        price: 50.21,
        author: king
      ),
      Book.new(
        name: 'The Dark Tower IV: Wizard and Glass',
        price: 86.40,
        author: king
      ),
      Book.new(
        name: 'The Dark Tower V: Wolves of the Calla',
        price: 91.08,
        author: king
      ),
      Book.new(
        name: 'The Dark Tower VI: Song of Susannah',
        price: 99.54,
        author: king
      ),
      Book.new(
        name: 'The Dark Tower VII: The Dark Tower',
        price: 83.94,
        author: king
      ),
      Book.new(
        name: 'The Dark Tower: The Wind Through the Keyhole',
        price: 62.06,
        author: king
      )
    ]
  end
end
