require 'rails_helper'

RSpec.describe Michibiki::SkipService do
  let(:skip_service) { Michibiki::SkipService.new(skip_strategy: skip_strategy) }

  describe '#valid?' do
    subject { skip_service.valid? }
    context 'when strategy exists' do
      let(:skip_strategy) { 'profile_setting_redirector' } # in dummy app
      it do
        expect {
          subject
        }.not_to change { skip_service.errors[:invalid_strategy] }
      end
    end

    context "when strategy doesn't exist" do
      let(:skip_strategy) { 'invalid_strategy' }
      let(:messages) { [invalid_strategy: I18n.t('michibiki.skip_failure.invalid_strategy')] }
      it do
        expect {
          subject
        }.to change { skip_service.errors[:invalid_strategy] }.to(messages)
      end
    end
  end
end
