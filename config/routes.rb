MicroServiceServer::Engine.routes.draw do
	# Installs a client on this server
	post 'install' => "clients#create", :as => :install_client
	# Uninstalls a client from this server
	post 'uninstall' => "clients#destroy", :as => :uninstall_client
end
