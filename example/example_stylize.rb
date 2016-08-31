require 'texstyles'

header = '% Header goes here'
abstract = '% Abstract goes here'

metadata = {
  'title' => 'An example scholarly article',
  'short_title' => 'Example article',
  'authors' => [
  { 'name' => 'First Author',
    'affiliation' => 1},
  { 'name' => 'Second Author',
    'affiliation' => 2},
  { 'name' => 'Third Author',
    'affiliations' => [1, 2]}
  ],
  'affiliations' => {
    1 => 'Example Organization',
    2 => 'Another Organization'
  },
  'header' => header,
  'abstract' => abstract
}


# Choose any available Texstyles::Style here
# Full list can be fetched via: Texstyles::Style.list
authorea_style = Texstyles::Style.new(:authorea)

# To obtain the correct latex preamble for the given style:
stylized_preamble = authorea_style.stylize_metadata(metadata)

# Then piece together a document by hand (or use the texstylist gem for further automation)
stylized_document = stylized_preamble + "a basic example\n"  + "\\end{document}"

# Enjoy!
puts stylized_document