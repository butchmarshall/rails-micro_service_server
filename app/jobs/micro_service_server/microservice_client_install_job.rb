module MicroServiceServer
	class MicroserviceClientInstallJob < ActiveJob::Base
		queue_as :default

		def perform(*args)
			params = args.extract_options!

			begin
				MicroService::Client.new(params).save
			# Failed to notify the microservice we successfully installed ourselves
			rescue MicroService::Client::InstallError => $e
				# Increment attempt number
				params["attempt"] ||= 1
				params["attempt"] = params["attempt"] + 1

				# Try again in one minute
				MicroserviceClientInstallJob.set(wait: 1.minute).perform_later(params) unless params["attempt"].to_i > 3
			end
		end
	end
end
