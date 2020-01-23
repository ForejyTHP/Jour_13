require_relative '../lib/mairie_christmas'

describe 'the get townhall emailmethod' do
  it 'should find the email address' do
    expect(get_townhall_email('https://www.annuaire-des-mairies.com/95/genainville.html')).to eq('mairie-genainville@wanadoo.fr')
    expect(get_townhall_email('https://www.annuaire-des-mairies.com/95/wy-dit-joli-village.html')).to eq('mairie.wy-dit-joli-village@wanadoo.fr')
  end
  it 'should return the right number of entries' do
    expect(get_townhall_urls.size).to eq(185)
  end
end
