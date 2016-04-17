module MicroServiceServer
	module Concerns
		module Controllers
			module Clients
				extend ActiveSupport::Concern

				def create
					MicroserviceClientInstallJob.perform_later(install_params)

					render :nothing => true, :status => 204
				end

				def destroy
					status = 403

					@client = MicroService::Client.where(uninstall_params).first
					if @client && @client.update_attributes(:uninstalled => true)
						status = 204
					end

					render :nothing => true, :status => status
				end

				private
					def json_params
						ActionController::Parameters.new(JSON.parse(request.body.read))
					end

					def uninstall_params
						data = json_params

						data.permit(
							:id,
							:secret,
						)
					end

					def install_params
						data = json_params

						data.permit(
							:install_url,
							:uninstall_url,
						)
					end
			end
		end
	end
end