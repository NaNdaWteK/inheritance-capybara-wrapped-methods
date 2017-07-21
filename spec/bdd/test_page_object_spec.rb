require_relative '../spec_helper_bdd'
require_relative 'test_support/template'
require_relative '../../app'
feature 'Page Object:' do

  let(:app) do
    Page::Template.new
  end

  scenario 'fill inputs and avoid to get his value' do
    value = 'any value'

    app.fill('first', value)

    expect(app.input_value('first')).to eq value
  end

  scenario 'ensure class exists and it has visible and correct content' do
    default_content = 'Subtitle'

    expect(app.has_element?('.subtitle')).to be true
    expect(app.is_visible?(default_content)).to be true
    expect(app.content('.subtitle')).to eq default_content
  end

  scenario 'has enabled and disabled buttons' do

    expect(app.is_enabled?('#enabled')).to be true
    expect(app.is_disabled?('#disabled')).to be true
  end

  scenario 'click on enabled button displays content' do
    app.press('#enabled')

    app.wait_for_element?('#clicked')
    expect(app.content('#clicked')).to eq 'Button enabled clicked'
  end

end
