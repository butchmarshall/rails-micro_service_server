require_dependency "micro_service_server/application_controller"

module Concerns
	module Controllers
		module Clients
			extend MicroServiceServer::Concerns::Controllers::Clients
		end
	end
end

module MicroServiceServer
	class ClientsController < ApplicationController
		include Concerns::Controllers::Clients
	end
end
