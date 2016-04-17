Rails.application.routes.draw do
	mount MicroServiceServer::Engine => "/micro_service_server"
end
