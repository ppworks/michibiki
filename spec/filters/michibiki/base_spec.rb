require 'rails_helper'

describe Michibiki::Base do
  let(:redirector) { Michibiki::Base }
  include_context 'stub controller'

  describe '#before' do
    subject { redirector.before(controller) }
    context 'when requst is not GET' do
      let(:request_method) { :post }
      context "and request.path is '/'" do
        let(:request_path) { '/' }
        it 'should not redirect'do
          expect(controller).not_to receive(:redirect_to)
          subject
        end
      end

      context "and request.path is '/other'" do
        let(:request_path) { '/other' }
        context 'and skip session is set' do
          let(:session) { {'skip_base_redirector_at' => Time.current} }
          it 'should not redirect'do
            expect(controller).not_to receive(:redirect_to)
            subject
          end
        end

        context 'and skip session is not set' do
          it 'should not redirect'do
            expect(controller).not_to receive(:redirect_to)
            subject
          end
        end
      end
    end

    context 'when requst is GET' do
      let(:request_method) { :get }
      context "and request.path is '/'" do
        let(:request_path) { '/' }
        it 'should not redirect'do
          expect(controller).not_to receive(:redirect_to)
          subject
        end
      end

      context "and request.path is '/other'" do
        let(:request_path) { '/other' }
        context 'and skip session is set' do
          let(:session) { {'skip_base_at' => Time.current} }
          it 'should not redirect'do
            expect(controller).not_to receive(:redirect_to)
            subject
          end
        end

        context 'and skip session is not set' do
          it 'should redirect'do
            expect(controller).to receive(:redirect_to)
            subject
          end
        end
      end
    end
  end
end
