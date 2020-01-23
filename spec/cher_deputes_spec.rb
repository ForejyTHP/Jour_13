require_relative '../lib/cher_deputes'

describe 'the cher deputes method' do
  it 'should have find the right e-mail on the page' do
    expect(get_depute_mail('http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036')).to eq('damien.abad@assemblee-nationale.fr')
    expect(get_depute_mail('http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA721674')).to eq('Stephanie.Atger@assemblee-nationale.fr')
  end
end
