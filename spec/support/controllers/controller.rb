RSpec.shared_context 'stub controller' do
  let(:controller) { double(ApplicationController) }
  let(:session) { {} }
  let(:request) { OpenStruct.new(get?:    request_method == :get,
                                 post?:   request_method == :post,
                                 put?:    request_method == :put,
                                 patch?:  request_method == :patch?,
                                 delete?: request_method == :delete?,
                                 path: request_path) }
  let(:path) { request_path }
  let(:request_method) { :get }
  let(:request_path) { '/' }

  before do
    allow(controller).to receive(:request).and_return(request)
    allow(controller).to receive(:session).and_return(session)
  end
end
