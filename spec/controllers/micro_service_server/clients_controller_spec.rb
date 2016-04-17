require 'rails_helper'

RSpec.describe MicroServiceServer::ClientsController, type: :controller do
	routes { MicroServiceServer::Engine.routes }

	before(:each) do
		@header_params = {
			:CONTENT_TYPE => 'application/json',
			:ACCEPT => 'application/json'
		}
	end

	describe 'POST install' do
		it 'should register a new client with the server' do
			post :create, {
				install_url: "http://localhost/my-server/install",
				uninstall_url: "http://localhost/my-server/uninstall",
			}.to_json, @header_params

			# Success
			expect(response.code.to_i).to eq(204)
		end
	end

	describe 'POST uninstall' do
		it 'should unregister an existing client with the server' do
		end
	end
end
